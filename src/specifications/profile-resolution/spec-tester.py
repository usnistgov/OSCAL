#!/usr/bin/env python3
import argparse
import os.path
import subprocess
import tempfile
import shutil
import json
from xml.etree import ElementTree as ET

from typing import TypedDict, List


class TestScenario(TypedDict):
    """A source profile along with the expected resulting profile and match expressions"""
    source_profile_path: str
    expected_catalog_path: str
    selection_expressions: List[str]


class TestRequirement(TypedDict):
    """A single requirement composed of multiple test scenarios"""
    section_id: str
    requirement_id: str
    scenarios: List[TestScenario]


DRIVER_SOURCE_TOKEN = "{src}"
DRIVER_DESTINATION_TOKEN = "{dest}"


class Driver(object):
    def __init__(self, command: str) -> None:
        if not DRIVER_SOURCE_TOKEN in command:
            raise Exception(
                f"Command `{command}` does not contain source token '{DRIVER_SOURCE_TOKEN}'")
        if not DRIVER_DESTINATION_TOKEN in command:
            raise Exception(
                f"Command `{command}` does not contain source token '{DRIVER_DESTINATION_TOKEN}'")

        self.command = command
        self.out_directory = tempfile.mkdtemp("oscal-pr-test-out")

    def run(self, src_path) -> ET.ElementTree:
        src_name = os.path.basename(src_path)
        # some-profile.xml => some-profile_RESOLVED.xml
        dest_name = os.path.splitext(src_name)[0] + "_RESOLVED.xml"
        dest_path = os.path.join(self.out_directory, dest_name)

        command = self.command\
            .replace(DRIVER_SOURCE_TOKEN, f"'{src_path}'")\
            .replace(DRIVER_DESTINATION_TOKEN, f"'{dest_path}'")

        # Notice: this code does not protect against shell injection of any kind,
        # `self.command` and `src_path` must be trusted.
        ret = subprocess.run(command, shell=True, capture_output=True)
        # TODO handle command failure

        if ret.returncode != 0:
            raise Exception(
                f"Process returned non-zero exit code, stderr:\n\n{ret.stderr}")

        return ET.parse(dest_path)

    def cleanup(self):
        shutil.rmtree(self.out_directory)


def elements_equal(e1: ET.ElementTree, e2: ET.ElementTree):
    """Via https://stackoverflow.com/a/24349916"""
    if e1.tag != e2.tag:
        return False
    if e1.text != e2.text:
        return False
    if e1.tail != e2.tail:
        return False
    if e1.attrib != e2.attrib:
        return False
    if len(e1) != len(e2):
        return False
    return all(elements_equal(c1, c2) for c1, c2 in zip(e1, e2))


SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))
DEFAULT_TESTS_PATH = os.path.join(SCRIPT_DIR, "spec-tests.json")
DEFAULT_SPEC_PATH = os.path.join(SCRIPT_DIR, "profile-resolution-specml.xml")


class RequirementTests(object):
    def __init__(self, spec_path=DEFAULT_SPEC_PATH, tests_path=DEFAULT_TESTS_PATH) -> None:
        self.spec_path = spec_path
        self.tests_path = tests_path

        self.spec = ET.parse(self.spec_path)

        with open(self.tests_path) as tests_file:
            tests_json = json.loads(tests_file.read())
            # TODO any sort of input validation, this is currently at best a type hint
            self.tests: List[TestRequirement] = tests_json

    def print_coverage(self):
        # TODO make this return data that could be instrumented by external callers
        for section in self.spec.findall("{http://csrc.nist.gov/ns/oscal/specml}section"):
            section_head = section.find(
                "{http://csrc.nist.gov/ns/oscal/specml}head").text

            for requirement in section.findall("{http://csrc.nist.gov/ns/oscal/specml}req"):
                pass
            print(f"Section: {section_head}")

    def run(self, command):
        driver = Driver(command)
        test_record = []

        for requirement in self.tests:
            print(
                f"Test requirement: {requirement['section_id']}/{requirement['requirement_id']}")
            self._test_requirement(driver, requirement)

    def _test_requirement(self, driver: Driver, requirement: TestRequirement):
        requirement_pass = True

        for scenario in requirement["scenarios"]:
            self._test_scenario(driver, scenario)

    def _test_scenario(self, driver: Driver, scenario: TestScenario):
        result = driver.run(scenario["source_profile_path"])
        expected = ET.parse(scenario["expected_catalog_path"])

        scenario_pass = True
        for selection_expression in scenario["selection_expressions"]:
            result_selection = result.findall(selection_expression)
            expected_selection = expected.findall(selection_expression)

            for result_elem, expected_elem in zip(result_selection, expected_selection):
                if not elements_equal(result_elem, expected_elem):
                    scenario_pass = False

            if len(result_selection) != len(expected_selection):
                print("Resulting selection lengths do not match")
                scenario_pass = False

        if not scenario_pass:
            requirement_pass = False


if __name__ == '__main__':
    parser = argparse.ArgumentParser(
        description='OSCAL profile-resolution testing harness')
    parser.add_argument(
        "--tests_path", default=DEFAULT_TESTS_PATH, help="Override the tests file")
    parser.add_argument(
        "--spec_path", default=DEFAULT_SPEC_PATH, help="Override the spec file")

    subparsers = parser.add_subparsers(
        required=True, dest="action", description="valid subcommands")

    # "run" subcommand
    parser_run = subparsers.add_parser('run', description='Run the spec tests')
    parser_run.add_argument(
        "command", help="The program to call, with the input profile and output path"
        f" replaced with {DRIVER_SOURCE_TOKEN} and {DRIVER_DESTINATION_TOKEN} respectively")

    # "coverage" subcommand
    parser_coverage = subparsers.add_parser(
        'coverage', description='Report the coverage of the given tests file against the spec')

    args = parser.parse_args()

    harness = RequirementTests(args.spec_path, args.tests_path)

    if args.action == "run":
        harness.run(args.command)
    elif args.action == "coverage":
        harness.print_coverage()
