// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.4;

import {DSTest} from "@ds-test/test.sol";
import {Vm} from "@forge-std/Vm.sol";
{% for variation in contracts.erc20.variations %}
import {ERC20_{{variation}}} from "$/ERC20_{{variation}}.sol";
{% endfor %}
{% for variation in contracts.erc20.variations %}

// transfer
contract ERC20_{{variation}}_transferToNonOwner_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC20_{{variation}} internal sut;

    function setUp() public {
        sut = new ERC20_{{variation}}();
        sut.mint(address(0xAAAA), 1000 ether);
    }
    
    function test_transferToNonOwner() public {
        HEVM.prank(address(0xAAAA));
        sut.transfer(address(0xBBBB), 500 ether);
    }
}

contract ERC20_{{variation}}_transferToOwner_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC20_{{variation}} internal sut;

    function setUp() public {
        sut = new ERC20_{{variation}}();
        sut.mint(address(0xAAAA), 1000 ether);
        sut.mint(address(0xBBBB), 1000 ether);
    }
    
    function test_transferToOwner() public {
      HEVM.prank(address(0xAAAA));
        sut.transfer(address(0xBBBB), 500 ether);
    }
}
{% endfor %}
