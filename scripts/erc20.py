import re
import common

variations = {
    "OZ": "OpenZeppelin v5",
    "OZPermit": "OpenZeppelin v5 Permit",
    "Solmate": "Solmate",
    "Maple": "Maple",
}

def regex_for_method(method):
    regex_string = "test_{}.+gas:\s(\d+)".format(method)
    return re.compile(regex_string)    

def fn_for_method(method):
    def get_gas(line):
        match = re.search(regex_for_method(method), line)
        return {
            "gas": match.group(1)
        }
    return get_gas

def group(lines):
    methods = common.group_methods_and_variant(lines)

    def rows_for_method(method_name, method_fn):
        return common.rows_for_method(methods, variations, method_name, method_fn)

    method_keys = [
        "deploy",
        "transferToOwner",
        "transferToNonOwner",
        "transferFromToOwner",
        "transferFromToNonOwner",
        "approve",
        "totalSupply",
        "balanceOf",
        "allowance",
    ]

    for method in method_keys:
        methods[method] = rows_for_method(method, fn_for_method(method))

    return methods
