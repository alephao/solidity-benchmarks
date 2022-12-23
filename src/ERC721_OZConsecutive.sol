// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.4;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {ERC721Consecutive} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721Consecutive.sol";

contract ERC721_OZConsecutive is ERC721Consecutive {
    uint256 currentSupply;

    constructor() ERC721("Name", "Sy") {}

    function mint(address to, uint256 amount) external payable {
        uint256 startingIndex;
        unchecked {
            startingIndex = currentSupply + 1;
            currentSupply += amount;
        }

        for (uint256 i; i < amount; ) {
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

        for (uint256 i; i < amount; ) {
            _safeMint(to, startingIndex + i);
            unchecked {
                i++;
            }
        }
    }

    function burn(uint256 tokenId) external {
        _burn(tokenId);
    }
}

contract ERC721_OZConsecutive_ERC2309 is ERC721Consecutive {
    constructor(uint96 amount) ERC721("Name", "Sy") {
        _mintConsecutive(address(1), amount);
    }
}
