import erc721
import common


def group_by_contract(lines):
    contracts = common.group_by_contract(lines)
    grouped_by_contract_dict = {}

    grouped_by_contract_dict["ERC721"] = erc721.group(contracts["ERC721"])

    return grouped_by_contract_dict


def erc721_subreadme(contracts, readme, method):
    return common.sub_readme(readme, method, common.table_for_rows(
        contracts["ERC721"][method]))


def main():
    snapshot = open(".gas-snapshot", "r")
    lines = snapshot.readlines()

    contracts = group_by_contract(lines)

    f = open("README.md", "r+")
    readme = f.read()
    f.seek(0)
    readme = erc721_subreadme(contracts, readme, "mint")
    readme = erc721_subreadme(contracts, readme, "safeMint")
    readme = erc721_subreadme(contracts, readme, "transferToOwner")
    readme = erc721_subreadme(contracts, readme, "transferToNonOwner")
    readme = erc721_subreadme(contracts, readme, "approve")
    readme = erc721_subreadme(contracts, readme, "setApprovalForAll")
    f.write(readme)
    f.truncate()


main()
