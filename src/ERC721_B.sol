// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.4;

import {ERC721B} from "@ERC721B/ERC721B.sol";

contract ERC721_B is ERC721B {
    constructor() ERC721B("Name", "Sy") {}

    function mint(address to, uint256 amount) external payable {
        _mint(to, amount);
    }

    function safeMint(address to, uint256 amount) external payable {
        _safeMint(to, amount);
    }

    function tokenURI(uint256 id) public pure override returns (string memory) {
        return "";
    }
}
