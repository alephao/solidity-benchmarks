// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.4;

import {ERC721A} from "@ERC721A/ERC721A.sol";

contract ERC721_A is ERC721A {
    constructor() ERC721A("Name", "Sy") {}

    function mint(address to, uint256 amount) external payable {
        _mint(to, amount);
    }

    function safeMint(address to, uint256 amount) external payable {
        _safeMint(to, amount);
    }

    function burn(uint256 tokenId) external {
        _burn(tokenId, false);
    }

    function _startTokenId() internal pure override returns (uint256) {
        return 1;
    }
}

contract ERC721_A_ERC2309 is ERC721A {
    constructor(uint96 amount) ERC721A("Name", "Sy") {
        _mintERC2309(address(1), amount);
    }
}
