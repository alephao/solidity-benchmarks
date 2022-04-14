// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

import {ERC721A} from "@ERC721A/ERC721A.sol";

contract ERC721AMinimal is ERC721A {
    constructor() ERC721A("Name", "Sy") {}

    function mint(address to, uint256 amount) external payable {
        _mint(to, amount, "", false);
    }

    function safeMint(address to, uint256 amount) external payable {
        _safeMint(to, amount);
    }

    function _startTokenId() internal view override returns (uint256) {
        return 1;
    }
}
