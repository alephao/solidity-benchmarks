from itertools import groupby
import re
from markdownTable import markdownTable

# Pattern: <CONTRACT>_<VARIANT>_<method>_Test:test_<method>_<optionalConstraint>_<optionalData>() (gas: <gas>)
# Example: ERC721_B_transfer_Test:test_transfer_toNonOwner_id50() (gas: 179836)


def group_by_contract(lines):
    grouped_by_contract = groupby(lines, lambda x: x.split("_")[0])
    grouped_by_contract_dict = {}
    for key, elements in grouped_by_contract:
        grouped_by_contract_dict[key] = list(elements)
    return grouped_by_contract_dict


def group_by_variant(lines):
    grouped_by_variant = groupby(lines, lambda x: x.split("_")[1])
    grouped_by_variant_dict = {}
    for key, elements in grouped_by_variant:
        grouped_by_variant_dict[key] = list(elements)
    return grouped_by_variant_dict


def group_by_method(lines):
    grouped_by_method = groupby(lines, lambda x: x.split("_")[2])
    grouped_by_method_dict = {}
    for key, elements in grouped_by_method:
        if key in grouped_by_method_dict:
            grouped_by_method_dict[key] = grouped_by_method_dict[key] + \
                list(elements)
        else:
            grouped_by_method_dict[key] = list(elements)
    return grouped_by_method_dict


def group_by_constraint(lines):
    grouped_by_constraint = groupby(lines, lambda x: x.split("_")[5])
    grouped_by_constraint_dict = {}
    for key, elements in grouped_by_constraint:
        grouped_by_constraint_dict[key] = list(elements)
    return grouped_by_constraint_dict


def group_methods_and_variant(lines):
    methods = group_by_method(lines)
    grouped = {}
    for key in methods:
        grouped[key] = group_by_variant(methods[key])
    return grouped


def rows_for_method(methods, variations, method_name, method_fn):
    rows = []
    for variant in methods[method_name]:
        vrows = list(map(method_fn, methods[method_name][variant]))
        if "key" in vrows[0]:
            vrows = sorted(vrows, key=lambda x: int(x["key"]))

        rows_dict = {"Implementation":  variations[variant]}
        for r in vrows:
            if "key" in r:
                rows_dict[r["key"]] = r["gas"]
            else:
                rows_dict["--"] = r["gas"]

        rows.append(rows_dict)
    return rows


def table_for_rows(rows):
    return markdownTable(rows).setParams(
        row_sep='markdown', quote=False).getMarkdown()


def sub_readme(file, method, content):
    pattern = "<!-- Start {} Table -->(.|\n)+<!-- End {} Table -->".format(
        method, method)
    sub = "<!-- Start {} Table -->\n{}\n<!-- End {} Table -->".format(
        method, content, method)
    return re.sub(pattern, sub, file, 1, re.M)
