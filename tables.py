from functools import reduce
from os import write
import re
from markdownTable import markdownTable

variations = [
    {
        "name": "Open Zeppelin",
        "short": "OZ"
    },
    {
        "name": "Solmate",
        "short": "Solmate"
    },
    {
        "name": "ERC721A",
        "short": "A"
    },
]

mint_regex = re.compile("test_mint_(\d+).+gas:\s(\d+)")
transfer_owner_regex = re.compile("transfer_toOwner_id(\d+).+gas:\s(\d+)")
transfer_nonowner_regex = re.compile(
    "transfer_toNonOwner_id(\d+).+gas:\s(\d+)")
approvalall_regex = re.compile(
    "test_setApprovalForAll.+gas:\s(\d+)")


def tuple_list_to_kv_obj(tuple_list, initial_obj={}):
    def fn(previous, current):
        new_obj = previous
        new_obj['{}'.format(current[0])] = current[1]
        return new_obj

    return reduce(fn, tuple_list, initial_obj)


def _make_row_match(regex, lines, test_name):
    p = filter(lambda x: x.startswith(test_name), lines)
    p = map(lambda line: re.search(regex, line), p)
    p = filter(lambda match: match != None, p)
    return list(p)


def make_row(regex, lines, variant, test_name, sorting_key=None):
    if sorting_key == None:
        def sorting_key(t): return int(t[0])

    p = _make_row_match(regex, lines, test_name)
    # (data, gas)
    p = map(lambda match: (match.group(1), match.group(2)), p)
    p = sorted(p, key=sorting_key)

    # { data: gas }
    initial_obj = {"Implementation": variant}
    p = tuple_list_to_kv_obj(p, initial_obj)
    return p


def mint_table(lines):
    rows = map(lambda variation: make_row(mint_regex, lines,
               variation["name"], "ERC721" + variation["short"] + "MintTest"), variations)
    rows = list(rows)
    table = markdownTable(rows).setParams(
        row_sep='markdown', quote=False).getMarkdown()
    return table


def transfer_owner_table(lines):
    rows = map(lambda variation: make_row(transfer_owner_regex, lines,
               variation["name"], "ERC721" + variation["short"] + "TransferTest"), variations)
    rows = list(rows)
    table = markdownTable(rows).setParams(
        row_sep='markdown', quote=False).getMarkdown()
    return table


def transfer_nonowner_table(lines):
    rows = map(lambda variation: make_row(transfer_nonowner_regex, lines,
               variation["name"], "ERC721" + variation["short"] + "TransferTest"), variations)
    rows = list(rows)
    table = markdownTable(rows).setParams(
        row_sep='markdown', quote=False).getMarkdown()
    return table


def _make_approvalall_row(regex, lines, variant, test_name):
    p = _make_row_match(regex, lines, test_name)
    # (data, gas)
    p = map(lambda match: ("_", match.group(1)), p)

    # { data: gas }
    initial_obj = {"Implementation": variant}
    p = tuple_list_to_kv_obj(p, initial_obj)
    return p


def approvalall_table(lines):
    rows = map(lambda variation: _make_approvalall_row(approvalall_regex, lines,
               variation["name"], "ERC721" + variation["short"] + "ApprovalTest"), variations)
    rows = list(rows)
    table = markdownTable(rows).setParams(
        row_sep='markdown', quote=False).getMarkdown()
    return table


def main():
    snapshot = open(".gas-snapshot", "r")
    lines = snapshot.readlines()

    f = open("README.md", "r+")
    readme = f.read()
    f.seek(0)
    readme = re.sub(r"<!-- Start Mint Table -->(.|\n)+<!-- End Mint Table -->",
                    "<!-- Start Mint Table -->\n{}\n<!-- End Mint Table -->".format(mint_table(lines)), readme, 1, re.M)
    readme = re.sub(r"<!-- Start Transfer Owner Table -->(.|\n)+<!-- End Transfer Owner Table -->",
                    "<!-- Start Transfer Owner Table -->\n{}\n<!-- End Transfer Owner Table -->".format(transfer_owner_table(lines)), readme, 1, re.M)
    readme = re.sub(r"<!-- Start Transfer Non Owner Table -->(.|\n)+<!-- End Transfer Non Owner Table -->",
                    "<!-- Start Transfer Non Owner Table -->\n{}\n<!-- End Transfer Non Owner Table -->".format(transfer_nonowner_table(lines)), readme, 1, re.M)
    readme = re.sub(r"<!-- Start setApprovalForAll Table -->(.|\n)+<!-- End setApprovalForAll Table -->",
                    "<!-- Start setApprovalForAll Table -->\n{}\n<!-- End setApprovalForAll Table -->".format(approvalall_table(lines)), readme, 1, re.M)
    f.write(readme)
    f.truncate()


main()
