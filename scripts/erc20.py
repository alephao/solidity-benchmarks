import re
import common

variations = {
    "OZ": "Open Zeppelin",
    "Solmate": "Solmate",
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


transferFromToOwner_regex = re.compile("transferFromToOwner.+gas:\s(\d+)")


def transferFromToOwner(line):
    match = re.search(transferFromToOwner_regex, line)
    return {
        "gas": match.group(1)
    }


transferFromToNonOwner_regex = re.compile(
    "transferFromToNonOwner.+gas:\s(\d+)")


def transferFromToNonOwner(line):
    match = re.search(transferFromToNonOwner_regex, line)
    return {
        "gas": match.group(1)
    }


approve_regex = re.compile(
    "approve.+gas:\s(\d+)")


def approve(line):
    match = re.search(approve_regex, line)
    return {
        "gas": match.group(1)
    }

totalSupply_regex = re.compile(
    "totalSupply.+gas:\s(\d+)")


def totalSupply(line):
    match = re.search(totalSupply_regex, line)
    return {
        "gas": match.group(1)
    }

balanceOf_regex = re.compile(
    "balanceOf.+gas:\s(\d+)")


def balanceOf(line):
    match = re.search(balanceOf_regex, line)
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
    methods["transferFromToOwner"] = rows_for_method(
        "transferFromToOwner", transferFromToOwner)
    methods["transferFromToNonOwner"] = rows_for_method(
        "transferFromToNonOwner", transferFromToNonOwner)
    methods["approve"] = rows_for_method(
        "approve", approve)
    methods["totalSupply"] = rows_for_method(
        "totalSupply", totalSupply)
    methods["balanceOf"] = rows_for_method(
        "balanceOf", balanceOf)

    return methods
