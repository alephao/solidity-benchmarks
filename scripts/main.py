import erc20
import erc721
import erc1155
import common


def group_by_contract(lines):
    contracts = common.group_by_contract(lines)
    grouped_by_contract_dict = {}

    grouped_by_contract_dict["ERC20"] = erc20.group(contracts["ERC20"])
    grouped_by_contract_dict["ERC721"] = erc721.group(contracts["ERC721"])
    grouped_by_contract_dict["ERC1155"] = erc1155.group(contracts["ERC1155"])

    return grouped_by_contract_dict


# ERC20

def erc20_subreadme(contracts, readme, method):
    return common.sub_readme(readme, method, common.table_for_rows(
        contracts["ERC20"][method]))


def update_erc20_readme(contracts):
    f = open("ERC20.md", "r+")
    readme = f.read()
    f.seek(0)
    readme = erc20_subreadme(contracts, readme, "transferToOwner")
    readme = erc20_subreadme(contracts, readme, "transferToNonOwner")
    f.write(readme)
    f.truncate()

# ERC721


def erc721_subreadme(contracts, readme, method):
    return common.sub_readme(readme, method, common.table_for_rows(
        contracts["ERC721"][method]))


def update_erc721_readme(contracts):
    f = open("README.md", "r+")
    readme = f.read()
    f.seek(0)
    readme = erc721_subreadme(contracts, readme, "mint")
    readme = erc721_subreadme(contracts, readme, "safeMint")
    readme = erc721_subreadme(contracts, readme, "transferToOwner")
    readme = erc721_subreadme(contracts, readme, "transferToNonOwner")
    readme = erc721_subreadme(contracts, readme, "approve")
    readme = erc721_subreadme(contracts, readme, "setApprovalForAll")
    readme = erc721_subreadme(contracts, readme, "balanceOf")
    readme = erc721_subreadme(contracts, readme, "ownerOf")
    readme = erc721_subreadme(contracts, readme, "getApproved")
    f.write(readme)
    f.truncate()

# ERC1155


def erc1155_subreadme(contracts, readme, method):
    return common.sub_readme(readme, method, common.table_for_rows(
        contracts["ERC1155"][method]))


def update_erc1155_readme(contracts):
    f = open("ERC1155.md", "r+")
    readme = f.read()
    f.seek(0)
    readme = erc1155_subreadme(contracts, readme, "mint")
    readme = erc1155_subreadme(contracts, readme, "mintBatch")
    f.write(readme)
    f.truncate()


def main():
    snapshot = open(".gas-snapshot", "r")
    lines = snapshot.readlines()

    contracts = group_by_contract(lines)

    update_erc20_readme(contracts)
    update_erc721_readme(contracts)
    update_erc1155_readme(contracts)


main()
