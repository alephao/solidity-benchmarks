import re
import common

variations = {
    "OZ": "Open Zeppelin",
    "Solmate": "Solmate",
}

# Methods to format .gas-snapshot line to an object with relevant info

mint_regex = re.compile("test_mint.+gas:\s(\d+)")


def mint(line):
    match = re.search(mint_regex, line)
    return {
        "gas": match.group(1)
    }


mintBatch_regex = re.compile("test_mintBatch_(\d+).+gas:\s(\d+)")


def mintBatch(line):
    match = re.search(mintBatch_regex, line)
    return {
        "key": match.group(1),
        "gas": match.group(2)
    }

def group(lines):
    methods = common.group_methods_and_variant(lines)

    def rows_for_method(method_name, method_fn):
        return common.rows_for_method(methods, variations, method_name, method_fn)

    methods["mint"] = rows_for_method("mint", mint)
    methods["mintBatch"] = rows_for_method("mintBatch", mintBatch)

    return methods
