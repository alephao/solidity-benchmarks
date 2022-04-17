// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.4;

import {ERC1155} from "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract ERC1155_OZ is ERC1155 {
    uint256 currentSupply;

    constructor() ERC1155("") {}

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
        _mintBatch(to, ids, amounts, "");
    }
}
