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


def update_erc20_readme(contracts, file):
    f = open(file, "r+")
    readme = f.read()
    f.seek(0)
    readme = erc20_subreadme(contracts, readme, "deploy")
    readme = erc20_subreadme(contracts, readme, "transferToOwner")
    readme = erc20_subreadme(contracts, readme, "transferToNonOwner")
    readme = erc20_subreadme(contracts, readme, "transferFromToOwner")
    readme = erc20_subreadme(contracts, readme, "transferFromToNonOwner")
    readme = erc20_subreadme(contracts, readme, "approve")
    readme = erc20_subreadme(contracts, readme, "totalSupply")
    readme = erc20_subreadme(contracts, readme, "balanceOf")
    readme = erc20_subreadme(contracts, readme, "allowance")
    f.write(readme)
    f.truncate()

# ERC721


def erc721_subreadme(contracts, readme, method):
    return common.sub_readme(readme, method, common.table_for_rows(
        contracts["ERC721"][method]))


def update_erc721_readme(contracts, file):
    f = open(file, "r+")
    readme = f.read()
    f.seek(0)
    readme = erc721_subreadme(contracts, readme, "deploy")
    readme = erc721_subreadme(contracts, readme, "deployERC2309")
    readme = erc721_subreadme(contracts, readme, "mint")
    readme = erc721_subreadme(contracts, readme, "safeMint")
    readme = erc721_subreadme(contracts, readme, "burn")
    readme = erc721_subreadme(contracts, readme, "transferToOwner")
    readme = erc721_subreadme(contracts, readme, "transferToNonOwner")
    readme = erc721_subreadme(contracts, readme, "safeTransferToOwner")
    readme = erc721_subreadme(contracts, readme, "safeTransferToNonOwner")
    readme = erc721_subreadme(contracts, readme, "approve")
    readme = erc721_subreadme(contracts, readme, "setApprovalForAll")
    readme = erc721_subreadme(contracts, readme, "balanceOf")
    readme = erc721_subreadme(contracts, readme, "ownerOf")
    readme = erc721_subreadme(contracts, readme, "getApproved")
    readme = erc721_subreadme(contracts, readme, "isApprovedForAll")
    f.write(readme)
    f.truncate()

# ERC1155


def erc1155_subreadme(contracts, readme, method):
    return common.sub_readme(readme, method, common.table_for_rows(
        contracts["ERC1155"][method]))


def update_erc1155_readme(contracts, file):
    f = open(file, "r+")
    readme = f.read()
    f.seek(0)
    readme = erc1155_subreadme(contracts, readme, "deploy")
    readme = erc1155_subreadme(contracts, readme, "mint")
    readme = erc1155_subreadme(contracts, readme, "mintBatch")
    readme = erc1155_subreadme(contracts, readme, "safeTransferFrom")
    readme = erc1155_subreadme(contracts, readme, "safeBatchTransferFrom")
    f.write(readme)
    f.truncate()


def update_readmes(version):
    snapshot_file = "{}.gas-snapshot".format(version.replace(".", "-"))
    snapshot = open(snapshot_file, "r")
    lines = snapshot.readlines()

    contracts = group_by_contract(lines)

    base_write_path = "benchmarks/{}".format(version)
    update_erc20_readme(contracts, "{}/ERC20.md".format(base_write_path))
    update_erc721_readme(contracts, "{}/ERC721.md".format(base_write_path))
    update_erc1155_readme(contracts, "{}/ERC1155.md".format(base_write_path))

def main():
    versions = [
        "0.8.20",
        "0.8.20-via-ir",
        "0.8.21",
        "0.8.21-via-ir",
        "0.8.22",
        "0.8.22-via-ir",
        "0.8.23",
        "0.8.23-via-ir",
    ]

    for version in versions:
        update_readmes(version)


main()
