// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.4;

import {ERC721} from "@solady/tokens/ERC721.sol";

contract ERC721_Solady is ERC721 {
    uint256 currentSupply;

    constructor() {}

    function name() public view virtual override returns (string memory) {
        return "Name";
    }

    function symbol() public view virtual override returns (string memory) {
        return "Sy";
    }

    function mint(address to, uint256 amount) external payable {
        uint256 startingIndex;
        unchecked {
            startingIndex = currentSupply + 1;
            currentSupply += amount;
        }

        for (uint256 i; i < amount;) {
            _mint(to, startingIndex + i);
            unchecked {
                i++;
            }
        }
    }

    function safeMint(address to, uint256 amount) external payable {
        uint256 startingIndex;
        unchecked {
            startingIndex = currentSupply + 1;
            currentSupply += amount;
        }

        for (uint256 i; i < amount;) {
            _safeMint(to, startingIndex + i);
            unchecked {
                i++;
            }
        }
    }

    function burn(uint256 tokenId) external {
        _burn(tokenId);
    }

    function tokenURI(uint256 id) public view override returns (string memory) {
        return "";
    }
}
