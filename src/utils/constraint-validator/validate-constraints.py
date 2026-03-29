#!/usr/bin/env python3
"""
OSCAL Parameter Constraint Validator (Proof of Concept)

Validates parameter values against constraint test expressions,
using the rules language identified by the test's 'system' attribute.

Supported constraint systems:
  - W3C XML Schema regex (http://www.w3.org/TR/xmlschema-2/#regexs)
  - OSCAL numeric range (https://csrc.nist.gov/ns/oscal/constraints/numeric-range)

Usage:
  python validate-constraints.py <oscal-catalog.json> [--param-values values.json]

The values.json file should contain a mapping of parameter IDs to values:
  {"ac-1_prm_1": "30 days", "ac-2_prm_1": "3"}
"""

import argparse
import json
import re
import sys
from pathlib import Path

# Well-known constraint system URIs
SYSTEM_REGEX = "http://www.w3.org/TR/xmlschema-2/#regexs"
SYSTEM_NUMERIC_RANGE = "https://csrc.nist.gov/ns/oscal/constraints/numeric-range"


def validate_regex(expression, value):
    """Validate a value against a W3C XML Schema regular expression."""
    try:
        return bool(re.fullmatch(expression, value))
    except re.error as e:
        return f"Invalid regex: {e}"


def validate_numeric_range(expression, value):
    """Validate a value against a numeric range constraint (e.g., '1-65535')."""
    match = re.fullmatch(r"(\d+)-(\d+)", expression.strip())
    if not match:
        return f"Invalid range expression: {expression}"

    low, high = int(match.group(1)), int(match.group(2))

    try:
        num_value = int(value)
    except (ValueError, TypeError):
        try:
            num_value = float(value)
        except (ValueError, TypeError):
            return f"Value '{value}' is not numeric"

    return low <= num_value <= high


VALIDATORS = {
    SYSTEM_REGEX: validate_regex,
    SYSTEM_NUMERIC_RANGE: validate_numeric_range,
}


def extract_params_with_constraints(catalog):
    """Extract parameters that have constraint tests with a system attribute."""
    params = []

    def walk(obj):
        if isinstance(obj, dict):
            if "params" in obj:
                for param in obj["params"]:
                    constraints = param.get("constraints", [])
                    for constraint in constraints:
                        tests = constraint.get("tests", [])
                        for test in tests:
                            if "expression" in test:
                                params.append({
                                    "id": param.get("id", "unknown"),
                                    "label": param.get("label", ""),
                                    "system": test.get("system"),
                                    "expression": test["expression"],
                                    "description": constraint.get("description", ""),
                                })
            for v in obj.values():
                walk(v)
        elif isinstance(obj, list):
            for item in obj:
                walk(item)

    walk(catalog)
    return params


def validate_param(param, value):
    """Validate a single parameter value against its constraint."""
    system = param.get("system")

    if system is None:
        return {"status": "skipped", "reason": "No system specified (informational constraint)"}

    validator = VALIDATORS.get(system)
    if validator is None:
        return {"status": "skipped", "reason": f"Unsupported system: {system}"}

    result = validator(param["expression"], value)

    if isinstance(result, str):
        return {"status": "error", "reason": result}
    elif result:
        return {"status": "pass"}
    else:
        return {"status": "fail", "reason": f"Value '{value}' does not satisfy: {param['expression']}"}


def main():
    parser = argparse.ArgumentParser(
        description="Validate OSCAL parameter values against constraint test expressions."
    )
    parser.add_argument("catalog", help="Path to an OSCAL catalog or profile in JSON format")
    parser.add_argument(
        "--param-values",
        help="Path to a JSON file mapping parameter IDs to values",
    )
    args = parser.parse_args()

    catalog_path = Path(args.catalog)
    if not catalog_path.exists():
        print(f"Error: {catalog_path} not found", file=sys.stderr)
        sys.exit(1)

    with open(catalog_path) as f:
        catalog = json.load(f)

    params = extract_params_with_constraints(catalog)

    if not params:
        print("No parameters with constraint tests found.")
        sys.exit(0)

    # Load parameter values if provided
    param_values = {}
    if args.param_values:
        with open(args.param_values) as f:
            param_values = json.load(f)

    print(f"Found {len(params)} parameter constraint(s)\n")

    failures = 0
    for param in params:
        param_id = param["id"]
        value = param_values.get(param_id)

        print(f"  Parameter: {param_id}")
        print(f"    System:     {param.get('system', '(none)')}")
        print(f"    Expression: {param['expression']}")

        if value is None:
            print(f"    Result:     SKIPPED (no value provided)")
        else:
            print(f"    Value:      {value}")
            result = validate_param(param, value)
            status = result["status"].upper()
            reason = result.get("reason", "")
            print(f"    Result:     {status}{' - ' + reason if reason else ''}")
            if status == "FAIL":
                failures += 1

        print()

    if failures > 0:
        print(f"{failures} constraint(s) failed.")
        sys.exit(1)
    else:
        print("All constraints passed.")


if __name__ == "__main__":
    main()
