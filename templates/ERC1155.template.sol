// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.4;

import {DSTest} from "@ds-test/test.sol";
import {Vm} from "@forge-std/Vm.sol";
{% for variation in contracts.erc1155.variations %}
import {ERC1155_{{variation}}} from "$/ERC1155_{{variation}}.sol";
{% endfor %}
{% for variation in contracts.erc1155.variations %}

// mint
contract ERC1155_{{variation}}_mint_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC1155_{{variation}} internal sut;

    function setUp() public {
        sut = new ERC1155_{{variation}}();
    }
    
    function test_mint() public {
        sut.mint(address(0xAAAA), 1, 1);
    }
}

// mintBatch
contract ERC1155_{{variation}}_mintBatch_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC1155_{{variation}} internal sut;

    function setUp() public {
        sut = new ERC1155_{{variation}}();
    }
    
    function test_mintBatch_1() public {
        uint256[] memory ids = new uint256[](1);
        ids[0] = 1;

        uint256[] memory amounts = new uint256[](1);
        amounts[0] = 1;

        sut.mintBatch(address(0xAAAA), ids, amounts);
    }

    function test_mintBatch_5() public {
        uint256[] memory ids = new uint256[](5);
        ids[0] = 1;
        ids[1] = 2;
        ids[2] = 3;
        ids[3] = 4;
        ids[4] = 5;

        uint256[] memory amounts = new uint256[](5);
        amounts[0] = 1;
        amounts[1] = 1;
        amounts[2] = 1;
        amounts[3] = 1;
        amounts[4] = 1;

        sut.mintBatch(address(0xAAAA), ids, amounts);
    }

    function test_mintBatch_10() public {
        uint256[] memory ids = new uint256[](10);
        ids[0] = 1;
        ids[1] = 2;
        ids[2] = 3;
        ids[3] = 4;
        ids[4] = 5;
        ids[5] = 1;
        ids[6] = 2;
        ids[7] = 3;
        ids[8] = 4;
        ids[9] = 5;

        uint256[] memory amounts = new uint256[](10);
        amounts[0] = 1;
        amounts[1] = 1;
        amounts[2] = 1;
        amounts[3] = 1;
        amounts[4] = 1;
        amounts[5] = 1;
        amounts[6] = 1;
        amounts[7] = 1;
        amounts[8] = 1;
        amounts[9] = 2;

        sut.mintBatch(address(0xAAAA), ids, amounts);
    }
}


{% endfor %}
