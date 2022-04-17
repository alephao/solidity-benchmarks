// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.4;

import {ERC1155} from "@solmate/tokens/ERC1155.sol";

contract ERC1155_Solmate is ERC1155 {
    constructor() {}

    function mint(
        address to,
        uint256 id,
        uint256 amount
    ) external payable {
        _mint(to, id, amount, "");
    }

    function mintBatch(
        address to,
        uint256[] calldata ids,
        uint256[] calldata amounts
    ) external payable {
        _batchMint(to, ids, amounts, "");
    }

    function uri(uint256) public pure override returns (string memory) {
        return "";
    }
}
