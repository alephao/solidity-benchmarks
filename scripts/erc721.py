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

deploy_regex = re.compile("test_deploy\(.+gas:\s(\d+)")


def deploy(line):
    match = re.search(deploy_regex, line)
    return {
        "gas": match.group(1)
    }

deployERC2309_regex = re.compile("test_deployERC2309_(\d+)\(.+gas:\s(\d+)")

def deployERC2309(line):
    match = re.search(deployERC2309_regex, line)
    return {
        "key": match.group(1),
        "gas": match.group(2)
    }


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

burn_regex = re.compile("burn_id(\d+).+gas:\s(\d+)")


def burn(line):
    match = re.search(burn_regex, line)
    return {
        "key": match.group(1),
        "gas": match.group(2)
    }

transferToOwner_regex = re.compile("test_transferToOwner_id(\d+).+gas:\s(\d+)")


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


safeTransferToOwner_regex = re.compile(
    "test_safeTransferToOwner_id(\d+).+gas:\s(\d+)")


def safeTransferToOwner(line):
    match = re.search(safeTransferToOwner_regex, line)
    return {
        "key": match.group(1),
        "gas": match.group(2)
    }


safeTransferToNonOwner_regex = re.compile(
    "test_safeTransferToNonOwner_id(\d+).+gas:\s(\d+)")


def safeTransferToNonOwner(line):
    match = re.search(safeTransferToNonOwner_regex, line)
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


getApproved_regex = re.compile(
    "test_getApproved_(\d+).+gas:\s(\d+)")


def getApproved(line):
    match = re.search(getApproved_regex, line)
    return {
        "key": match.group(1),
        "gas": match.group(2)
    }


isApprovedForAll_regex = re.compile(
    "test_isApprovedForAll.+gas:\s(\d+)")


def isApprovedForAll(line):
    match = re.search(isApprovedForAll_regex, line)
    return {
        "gas": match.group(1)
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

    methods["deploy"] = rows_for_method("deploy", deploy)
    methods["deployERC2309"] = rows_for_method("deployERC2309", deployERC2309)
    methods["mint"] = rows_for_method("mint", mint)
    methods["safeMint"] = rows_for_method("safeMint", safeMint)
    methods["burn"] = rows_for_method("burn", burn)
    methods["approve"] = rows_for_method("approve", approve)
    methods["setApprovalForAll"] = rows_for_method(
        "setApprovalForAll", setApprovalForAll)
    methods["transferToOwner"] = rows_for_method(
        "transferToOwner", transferToOwner)
    methods["transferToNonOwner"] = rows_for_method(
        "transferToNonOwner", transferToNonOwner)
    methods["safeTransferToOwner"] = rows_for_method(
        "safeTransferToOwner", safeTransferToOwner)
    methods["safeTransferToNonOwner"] = rows_for_method(
        "safeTransferToNonOwner", safeTransferToNonOwner)
    methods["balanceOf"] = rows_for_method("balanceOf", balanceOf)
    methods["ownerOf"] = rows_for_method("ownerOf", ownerOf)
    methods["getApproved"] = rows_for_method("getApproved", getApproved)
    methods["isApprovedForAll"] = rows_for_method(
        "isApprovedForAll", isApprovedForAll)

    return methods
