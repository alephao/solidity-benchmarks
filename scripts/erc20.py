import re
import common

variations = {
    "OZ": "Open Zeppelin",
}

# Methods to format .gas-snapshot line to an object with relevant info

transferToOwner_regex = re.compile("transferToOwner.+gas:\s(\d+)")


def transferToOwner(line):
    match = re.search(transferToOwner_regex, line)
    return {
        "gas": match.group(1)
    }


transferToNonOwner_regex = re.compile(
    "test_transferToNonOwner.+gas:\s(\d+)")


def transferToNonOwner(line):
    match = re.search(transferToNonOwner_regex, line)
    return {
        "gas": match.group(1)
    }


def group(lines):
    methods = common.group_methods_and_variant(lines)

    def rows_for_method(method_name, method_fn):
        return common.rows_for_method(methods, variations, method_name, method_fn)

    methods["transferToOwner"] = rows_for_method(
        "transferToOwner", transferToOwner)
    methods["transferToNonOwner"] = rows_for_method(
        "transferToNonOwner", transferToNonOwner)

    return methods
