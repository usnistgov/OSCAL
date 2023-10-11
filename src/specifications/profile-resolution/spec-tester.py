#!/usr/bin/env python3
import argparse
import sys
import os.path
import subprocess
import tempfile
import shutil
import json
from xml.etree import ElementTree as ET

from typing import TypedDict, List, Dict, Set, Tuple


# Via https://gist.github.com/rene-d/9e584a7dd2935d0f461904b9f2950007
class Colors:
    """ ANSI color codes """
    BLACK = "\033[0;30m"
    RED = "\033[0;31m"
    GREEN = "\033[0;32m"
    BROWN = "\033[0;33m"
    BLUE = "\033[0;34m"
    PURPLE = "\033[0;35m"
    CYAN = "\033[0;36m"
    LIGHT_GRAY = "\033[0;37m"
    DARK_GRAY = "\033[1;30m"
    LIGHT_RED = "\033[1;31m"
    LIGHT_GREEN = "\033[1;32m"
    YELLOW = "\033[1;33m"
    LIGHT_BLUE = "\033[1;34m"
    LIGHT_PURPLE = "\033[1;35m"
    LIGHT_CYAN = "\033[1;36m"
    LIGHT_WHITE = "\033[1;37m"
    BOLD = "\033[1m"
    FAINT = "\033[2m"
    ITALIC = "\033[3m"
    UNDERLINE = "\033[4m"
    BLINK = "\033[5m"
    NEGATIVE = "\033[7m"
    CROSSED = "\033[9m"
    END = "\033[0m"
    # cancel SGR codes if we don't write to a terminal
    if not __import__("sys").stdout.isatty():
        for _ in dir():
            if isinstance(_, str) and _[0] != "_":
                locals()[_] = ""
    else:
        # set Windows console in VT mode
        if __import__("platform").system() == "Windows":
            kernel32 = __import__("ctypes").windll.kernel32
            kernel32.SetConsoleMode(kernel32.GetStdHandle(-11), 7)
            del kernel32


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
    """Handles running the profile resolver given a source file and destination path"""

    def __init__(self, command: str) -> None:
        """
        Note: Creates a temporary directory as a side effect, consumer must call .cleanup() to remove
        """
        if not DRIVER_SOURCE_TOKEN in command:
            raise Exception(
                f"Command `{command}` does not contain source token '{DRIVER_SOURCE_TOKEN}'")
        if not DRIVER_DESTINATION_TOKEN in command:
            raise Exception(
                f"Command `{command}` does not contain source token '{DRIVER_DESTINATION_TOKEN}'")

        self.command = command
        self.out_directory = tempfile.mkdtemp("oscal-pr-test-out")

    def run(self, src_path) -> ET.ElementTree:
        """
        Note: Places output files in a temporary directory, consumer must call .cleanup() to remove
        """
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
        """Delete temporary directory"""
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

SPECML_NS = "http://csrc.nist.gov/ns/oscal/specml"


class RequirementTests(object):
    def __init__(self, spec_path=DEFAULT_SPEC_PATH, tests_path=DEFAULT_TESTS_PATH) -> None:
        self.spec_path = spec_path
        self.tests_path = tests_path

        self.spec = ET.parse(self.spec_path)

        with open(self.tests_path) as tests_file:
            tests_json = json.loads(tests_file.read())
            # TODO any sort of input validation, this is currently at best a type hint
            self.tests: List[TestRequirement] = tests_json

        # K,V of section ids -> section titles
        self.section_heads: Dict[str, str] = {}
        # K,V of section ids -> requirement id -> requirement level
        # TODO parse out requirement text and store alongside level?
        self.section_requirements: Dict[str, Dict[str, str]] = {}

        # process spec file
        for section in self.spec.findall(f"{{{SPECML_NS}}}section"):
            section_id = section.attrib['id']
            section_head = section.find(f"{{{SPECML_NS}}}head").text

            self.section_heads[section_id] = section_head
            self.section_requirements[section_id] = {}

            for requirement in section.findall(f".//{{{SPECML_NS}}}req"):
                requirement_id = requirement.attrib['id']
                requirement_level = requirement.attrib['level']

                self.section_requirements[section_id][requirement_id] = requirement_level

    def print_coverage(self):
        """
        Utility method that prints the test coverage against the spec
        """
        covered_tests: Dict[str, Set[str]] = {}

        for test in self.tests:
            if test["section_id"] not in covered_tests:
                covered_tests[test["section_id"]] = set()
            covered_tests[test["section_id"]].add(test["requirement_id"])

        for section_id, section_head in self.section_heads.items():
            requirements = set(self.section_requirements[section_id].keys())
            tested_requirements = covered_tests.get(section_id, set())
            covered_requirements = tested_requirements.intersection(
                requirements)
            uncovered_requirements = requirements.difference(
                tested_requirements)
            unknown_requirements = tested_requirements.difference(requirements)

            section_color = Colors.GREEN
            if len(requirements) == 0:
                section_color = Colors.DARK_GRAY
            elif len(tested_requirements) == 0:
                section_color = Colors.RED
            elif len(uncovered_requirements) > 0:
                section_color = Colors.YELLOW

            # Provide the user with information about extraneous requirements
            extra_warning = f"{Colors.RED}+{len(unknown_requirements)}" if len(
                unknown_requirements) > 0 else ""

            print(
                f"{Colors.BOLD}{section_color}{section_head} ({section_id}): {len(covered_requirements)}/{len(requirements)} {extra_warning}{Colors.END}")

            for requirement_id, level in self.section_requirements[section_id].items():
                requirement_color = Colors.GREEN if requirement_id in tested_requirements else Colors.RED
                print(f"    {requirement_color}{requirement_id} - {level}")

            # Warn the user of extraneous requirements in the section
            for requirement_id in unknown_requirements:
                print(
                    f"\n    {Colors.YELLOW}Warning: Unknown requirement id {requirement_id}{Colors.END}")

        # Warn the user of extraneous sections in the tests
        for section_id in set(covered_tests.keys()).difference(set(self.section_heads.keys())):
            print(
                f"{Colors.YELLOW}Warning: Unknown section id {section_id} containing {len(covered_tests[section_id])} requirements{Colors.END}")

    def run(self, command, do_cleanup=True) -> bool:
        driver = Driver(command)

        suite_pass = True

        try:
            for test in self.tests:
                print(
                    f"Test requirement: {test['section_id']}/{test['requirement_id']}")
                test_pass = self._run_test(driver, test)

                if not test_pass:
                    suite_pass = False
        finally:
            if do_cleanup:
                driver.cleanup()

        return suite_pass

    def _run_test(self, driver: Driver, requirement: TestRequirement) -> bool:
        test_pass = True

        for scenario in requirement["scenarios"]:
            scenario_pass = self._run_test_scenario(driver, scenario)
            if not scenario_pass:
                test_pass = False

        return test_pass

    def _run_test_scenario(self, driver: Driver, scenario: TestScenario) -> bool:
        """
        Runs a given test scenario, returning True if all selection expressions pass
        """
        result = driver.run(scenario["source_profile_path"])
        # TODO user friendly error if catalog path cannot be found
        expected = ET.parse(scenario["expected_catalog_path"])

        # if no selection expressions exist, test still successfully produced an output
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

        return scenario_pass


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

    # TODO argument for cleaning up output files

    # "coverage" subcommand
    parser_coverage = subparsers.add_parser(
        'coverage', description='Report the coverage of the given tests file against the spec')

    args = parser.parse_args()

    harness = RequirementTests(args.spec_path, args.tests_path)

    if args.action == "run":
        suite_pass = harness.run(args.command)
        if not suite_pass:
            sys.exit(1)
    elif args.action == "coverage":
        harness.print_coverage()
