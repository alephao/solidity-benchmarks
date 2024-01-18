import re
import common

variations = {
    "OZ": "OpenZeppelin",
    "OZEnumerable": "OpenZeppelin Enumerable",
    "OZConsecutive": "OpenZeppelin Consecutive",
    "Solady": "Solady",
    "Solmate": "Solmate",
    "A": "ERC721A",
    "B": "ERC721B",
    "K": "ERC721K",
}

# Methods to format .gas-snapshot line to an object with relevant info

# For snapshots of methods with no variations
def regex_for_method_simple(method):
    regex_string = "test_{}.+gas:\s(\d+)".format(method)
    return re.compile(regex_string)

def fn_for_method_simple(method):
    def get_gas(line):
        match = re.search(regex_for_method_simple(method), line)
        return {
            "gas": match.group(1)
        }
    return get_gas

# For snapshots of methods with amount variations
def regex_for_method_amount(method):
    regex_string = "test_{}_(\d+).+gas:\s(\d+)".format(method)
    return re.compile(regex_string)

def fn_for_method_amount(method):
    def get_gas(line):
        match = re.search(regex_for_method_amount(method), line)
        return {
            "key": match.group(1),
            "gas": match.group(2),
        }
    return get_gas

# For snapshots of methods with id variations
def regex_for_method_id(method):
    regex_string = "test_{}_id(\d+).+gas:\s(\d+)".format(method)
    return re.compile(regex_string)

def fn_for_method_id(method):
    def get_gas(line):
        match = re.search(regex_for_method_id(method), line)
        return {
            "key": match.group(1),
            "gas": match.group(2),
        }
    return get_gas

deploy = fn_for_method_simple("deploy")
isApprovedForAll = fn_for_method_simple("isApprovedForAll")
setApprovalForAll = fn_for_method_simple("setApprovalForAll")

deployERC2309 = fn_for_method_amount("deployERC2309")
mint = fn_for_method_amount("mint")
safeMint = fn_for_method_amount("safeMint")
balanceOf = fn_for_method_amount("balanceOf")
ownerOf = fn_for_method_amount("ownerOf")
getApproved = fn_for_method_amount("getApproved")

burn = fn_for_method_id("burn")
transferToOwner = fn_for_method_id("transferToOwner")
transferToNonOwner = fn_for_method_id("transferToNonOwner")
safeTransferToOwner = fn_for_method_id("safeTransferToOwner")
safeTransferToNonOwner = fn_for_method_id("safeTransferToNonOwner")
approve = fn_for_method_id("approve")


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

    methods_simple = [
        "deploy",
        "isApprovedForAll",
        "setApprovalForAll",
    ]
    methods_amount = [
        "deployERC2309",
        "mint",
        "safeMint",
        "balanceOf",
        "ownerOf",
        "getApproved",
    ]
    methods_id = [
        "burn",
        "transferToOwner",
        "transferToNonOwner",
        "safeTransferToOwner",
        "safeTransferToNonOwner",
        "approve",
    ]

    for method in methods_simple:
        methods[method] = rows_for_method(method, fn_for_method_simple(method))

    for method in methods_amount:
        methods[method] = rows_for_method(method, fn_for_method_amount(method))

    for method in methods_id:
        methods[method] = rows_for_method(method, fn_for_method_id(method))

    return methods
