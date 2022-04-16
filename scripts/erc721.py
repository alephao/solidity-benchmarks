from functools import reduce
from os import write
import re
from markdownTable import markdownTable
from itertools import groupby
import common

variations = {
    "OZ": "Open Zeppelin",
    "OZEnumerable": "Open Zeppelin Enumerable",
    "Solmate": "Solmate",
    "A": "ERC721A",
    "B": "ERC721B",
    "K": "ERC721K",
}

# Methods to format .gas-snapshot line to an object with relevant info

mint_regex = re.compile("test_mint_(\d+).+gas:\s(\d+)")


def mint(line):
    match = re.search(mint_regex, line)
    return {
        "key": match.group(1),
        "gas": match.group(2)
    }


safeMint_regex = re.compile("test_safeMint_(\d+).+gas:\s(\d+)")


def safeMint(line):
    match = re.search(safeMint_regex, line)
    return {
        "key": match.group(1),
        "gas": match.group(2)
    }


transferToOwner_regex = re.compile("transferToOwner_id(\d+).+gas:\s(\d+)")


def transferToOwner(line):
    match = re.search(transferToOwner_regex, line)
    return {
        "key": match.group(1),
        "gas": match.group(2)
    }


transferToNonOwner_regex = re.compile(
    "test_transferToNonOwner_id(\d+).+gas:\s(\d+)")


def transferToNonOwner(line):
    match = re.search(transferToNonOwner_regex, line)
    return {
        "key": match.group(1),
        "gas": match.group(2)
    }


approve_regex = re.compile(
    "test_approve_id(\d+).+gas:\s(\d+)")


def approve(line):
    match = re.search(approve_regex, line)
    return {
        "key": match.group(1),
        "gas": match.group(2)
    }


setApprovalForAll_regex = re.compile(
    "test_setApprovalForAll.+gas:\s(\d+)")


def setApprovalForAll(line):
    match = re.search(setApprovalForAll_regex, line)
    return {
        "gas": match.group(1)
    }

balanceOf_regex = re.compile(
    "test_balanceOf_(\d+).+gas:\s(\d+)")


def balanceOf(line):
    match = re.search(balanceOf_regex, line)
    return {
        "key": match.group(1),
        "gas": match.group(2)
    }

ownerOf_regex = re.compile(
    "test_ownerOf_(\d+).+gas:\s(\d+)")


def ownerOf(line):
    match = re.search(ownerOf_regex, line)
    return {
        "key": match.group(1),
        "gas": match.group(2)
    }


def group_methods_and_variant(lines):
    methods = common.group_by_method(lines)
    grouped = {}
    for key in methods:
        grouped[key] = common.group_by_variant(methods[key])
    return grouped


def group(lines):
    methods = group_methods_and_variant(lines)

    def rows_for_method(method_name, method_fn):
        return common.rows_for_method(methods, variations, method_name, method_fn)

    methods["mint"] = rows_for_method("mint", mint)
    methods["safeMint"] = rows_for_method("safeMint", safeMint)
    methods["approve"] = rows_for_method("approve", approve)
    methods["setApprovalForAll"] = rows_for_method(
        "setApprovalForAll", setApprovalForAll)
    methods["transferToOwner"] = rows_for_method(
        "transferToOwner", transferToOwner)
    methods["transferToNonOwner"] = rows_for_method(
        "transferToNonOwner", transferToNonOwner)
    methods["balanceOf"] = rows_for_method("balanceOf", balanceOf)
    methods["ownerOf"] = rows_for_method("ownerOf", ownerOf)

    return methods
