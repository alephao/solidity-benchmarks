// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.4;

import {ERC721K} from "@ERC721K/ERC721K.sol";

contract ERC721_K is ERC721K {
    constructor() ERC721K("ERC721K", "K") {}

    function mint(address to, uint256 amount) external payable {
        _mint(to, amount, "", false);
    }

    function safeMint(address to, uint256 amount) external payable {
        _safeMint(to, amount);
    }

    function burn(uint256 tokenId) external {
        _burn(tokenId, false);
    }
    
    function tokenURI(uint256)
        public
        pure
        virtual
        override
        returns (string memory)
    {}
}
