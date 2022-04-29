// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.4;

import {DSTest} from "@ds-test/test.sol";
import {Vm} from "@forge-std/Vm.sol";
import {ERC20_OZ} from "$/ERC20_OZ.sol";
import {ERC20_Solmate} from "$/ERC20_Solmate.sol";
import {ERC20_Maple} from "$/ERC20_Maple.sol";

// deploy
contract ERC20_OZ_deploy_Test is DSTest {
    function test_deploy() public {
        ERC20_OZ sut = new ERC20_OZ();
    }
}

// transferToNonOwner
contract ERC20_OZ_transferToNonOwner_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC20_OZ internal sut;

    function setUp() public {
        sut = new ERC20_OZ();
        sut.mint(address(0xAAAA), 1000 ether);
    }

    function test_transferToNonOwner() public {
        HEVM.prank(address(0xAAAA));
        sut.transfer(address(0xBBBB), 500 ether);
    }
}

// transferToOwner
contract ERC20_OZ_transferToOwner_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC20_OZ internal sut;

    function setUp() public {
        sut = new ERC20_OZ();
        sut.mint(address(0xAAAA), 1000 ether);
        sut.mint(address(0xBBBB), 1000 ether);
    }

    function test_transferToOwner() public {
        HEVM.prank(address(0xAAAA));
        sut.transfer(address(0xBBBB), 500 ether);
    }
}

// transferFromToNonOwner
contract ERC20_OZ_transferFromToNonOwner_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC20_OZ internal sut;

    function setUp() public {
        sut = new ERC20_OZ();
        sut.mint(address(0xAAAA), 1000 ether);
        HEVM.prank(address(0xAAAA));
        sut.approve(address(0xBBBB), 1000 ether);
    }

    function test_transferFromToNonOwner() public {
        HEVM.prank(address(0xBBBB));
        sut.transferFrom(address(0xAAAA), address(0xCCCC), 500 ether);
    }
}

// transferFromToOwner
contract ERC20_OZ_transferFromToOwner_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC20_OZ internal sut;

    function setUp() public {
        sut = new ERC20_OZ();
        sut.mint(address(0xAAAA), 1000 ether);
        sut.mint(address(0xCCCC), 1000 ether);
        HEVM.prank(address(0xAAAA));
        sut.approve(address(0xBBBB), 1000 ether);
    }

    function test_transferFromToOwner() public {
        HEVM.prank(address(0xBBBB));
        sut.transferFrom(address(0xAAAA), address(0xCCCC), 500 ether);
    }
}

// approve
contract ERC20_OZ_approve_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC20_OZ internal sut;

    function setUp() public {
        sut = new ERC20_OZ();
        sut.mint(address(0xAAAA), 1000 ether);
    }

    function test_approve() public {
        HEVM.prank(address(0xAAAA));
        sut.approve(address(0xBBBB), 1000 ether);
    }
}

// totalSupply
contract ERC20_OZ_totalSupply_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC20_OZ internal sut;

    function setUp() public {
        sut = new ERC20_OZ();
        sut.mint(address(0xAAAA), 1000 ether);
    }

    function test_totalSupply() public view {
        sut.totalSupply();
    }
}

// balanceOf
contract ERC20_OZ_balanceOf_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC20_OZ internal sut;

    function setUp() public {
        sut = new ERC20_OZ();
        sut.mint(address(0xAAAA), 1000 ether);
    }

    function test_balanceOf() public view {
        sut.balanceOf(address(0xAAAA));
    }
}

// allowance
contract ERC20_OZ_allowance_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC20_OZ internal sut;

    function setUp() public {
        sut = new ERC20_OZ();
        sut.mint(address(0xAAAA), 1000 ether);
        HEVM.prank(address(0xAAAA));
        sut.approve(address(0xBBBB), 1000 ether);
    }

    function test_allowance() public view {
        sut.allowance(address(0xAAAA), address(0xBBBB));
    }
}

// deploy
contract ERC20_Solmate_deploy_Test is DSTest {
    function test_deploy() public {
        ERC20_Solmate sut = new ERC20_Solmate();
    }
}

// transferToNonOwner
contract ERC20_Solmate_transferToNonOwner_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC20_Solmate internal sut;

    function setUp() public {
        sut = new ERC20_Solmate();
        sut.mint(address(0xAAAA), 1000 ether);
    }

    function test_transferToNonOwner() public {
        HEVM.prank(address(0xAAAA));
        sut.transfer(address(0xBBBB), 500 ether);
    }
}

// transferToOwner
contract ERC20_Solmate_transferToOwner_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC20_Solmate internal sut;

    function setUp() public {
        sut = new ERC20_Solmate();
        sut.mint(address(0xAAAA), 1000 ether);
        sut.mint(address(0xBBBB), 1000 ether);
    }

    function test_transferToOwner() public {
        HEVM.prank(address(0xAAAA));
        sut.transfer(address(0xBBBB), 500 ether);
    }
}

// transferFromToNonOwner
contract ERC20_Solmate_transferFromToNonOwner_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC20_Solmate internal sut;

    function setUp() public {
        sut = new ERC20_Solmate();
        sut.mint(address(0xAAAA), 1000 ether);
        HEVM.prank(address(0xAAAA));
        sut.approve(address(0xBBBB), 1000 ether);
    }

    function test_transferFromToNonOwner() public {
        HEVM.prank(address(0xBBBB));
        sut.transferFrom(address(0xAAAA), address(0xCCCC), 500 ether);
    }
}

// transferFromToOwner
contract ERC20_Solmate_transferFromToOwner_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC20_Solmate internal sut;

    function setUp() public {
        sut = new ERC20_Solmate();
        sut.mint(address(0xAAAA), 1000 ether);
        sut.mint(address(0xCCCC), 1000 ether);
        HEVM.prank(address(0xAAAA));
        sut.approve(address(0xBBBB), 1000 ether);
    }

    function test_transferFromToOwner() public {
        HEVM.prank(address(0xBBBB));
        sut.transferFrom(address(0xAAAA), address(0xCCCC), 500 ether);
    }
}

// approve
contract ERC20_Solmate_approve_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC20_Solmate internal sut;

    function setUp() public {
        sut = new ERC20_Solmate();
        sut.mint(address(0xAAAA), 1000 ether);
    }

    function test_approve() public {
        HEVM.prank(address(0xAAAA));
        sut.approve(address(0xBBBB), 1000 ether);
    }
}

// totalSupply
contract ERC20_Solmate_totalSupply_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC20_Solmate internal sut;

    function setUp() public {
        sut = new ERC20_Solmate();
        sut.mint(address(0xAAAA), 1000 ether);
    }

    function test_totalSupply() public view {
        sut.totalSupply();
    }
}

// balanceOf
contract ERC20_Solmate_balanceOf_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC20_Solmate internal sut;

    function setUp() public {
        sut = new ERC20_Solmate();
        sut.mint(address(0xAAAA), 1000 ether);
    }

    function test_balanceOf() public view {
        sut.balanceOf(address(0xAAAA));
    }
}

// allowance
contract ERC20_Solmate_allowance_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC20_Solmate internal sut;

    function setUp() public {
        sut = new ERC20_Solmate();
        sut.mint(address(0xAAAA), 1000 ether);
        HEVM.prank(address(0xAAAA));
        sut.approve(address(0xBBBB), 1000 ether);
    }

    function test_allowance() public view {
        sut.allowance(address(0xAAAA), address(0xBBBB));
    }
}

// deploy
contract ERC20_Maple_deploy_Test is DSTest {
    function test_deploy() public {
        ERC20_Maple sut = new ERC20_Maple();
    }
}

// transferToNonOwner
contract ERC20_Maple_transferToNonOwner_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC20_Maple internal sut;

    function setUp() public {
        sut = new ERC20_Maple();
        sut.mint(address(0xAAAA), 1000 ether);
    }

    function test_transferToNonOwner() public {
        HEVM.prank(address(0xAAAA));
        sut.transfer(address(0xBBBB), 500 ether);
    }
}

// transferToOwner
contract ERC20_Maple_transferToOwner_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC20_Maple internal sut;

    function setUp() public {
        sut = new ERC20_Maple();
        sut.mint(address(0xAAAA), 1000 ether);
        sut.mint(address(0xBBBB), 1000 ether);
    }

    function test_transferToOwner() public {
        HEVM.prank(address(0xAAAA));
        sut.transfer(address(0xBBBB), 500 ether);
    }
}

// transferFromToNonOwner
contract ERC20_Maple_transferFromToNonOwner_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC20_Maple internal sut;

    function setUp() public {
        sut = new ERC20_Maple();
        sut.mint(address(0xAAAA), 1000 ether);
        HEVM.prank(address(0xAAAA));
        sut.approve(address(0xBBBB), 1000 ether);
    }

    function test_transferFromToNonOwner() public {
        HEVM.prank(address(0xBBBB));
        sut.transferFrom(address(0xAAAA), address(0xCCCC), 500 ether);
    }
}

// transferFromToOwner
contract ERC20_Maple_transferFromToOwner_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC20_Maple internal sut;

    function setUp() public {
        sut = new ERC20_Maple();
        sut.mint(address(0xAAAA), 1000 ether);
        sut.mint(address(0xCCCC), 1000 ether);
        HEVM.prank(address(0xAAAA));
        sut.approve(address(0xBBBB), 1000 ether);
    }

    function test_transferFromToOwner() public {
        HEVM.prank(address(0xBBBB));
        sut.transferFrom(address(0xAAAA), address(0xCCCC), 500 ether);
    }
}

// approve
contract ERC20_Maple_approve_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC20_Maple internal sut;

    function setUp() public {
        sut = new ERC20_Maple();
        sut.mint(address(0xAAAA), 1000 ether);
    }

    function test_approve() public {
        HEVM.prank(address(0xAAAA));
        sut.approve(address(0xBBBB), 1000 ether);
    }
}

// totalSupply
contract ERC20_Maple_totalSupply_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC20_Maple internal sut;

    function setUp() public {
        sut = new ERC20_Maple();
        sut.mint(address(0xAAAA), 1000 ether);
    }

    function test_totalSupply() public view {
        sut.totalSupply();
    }
}

// balanceOf
contract ERC20_Maple_balanceOf_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC20_Maple internal sut;

    function setUp() public {
        sut = new ERC20_Maple();
        sut.mint(address(0xAAAA), 1000 ether);
    }

    function test_balanceOf() public view {
        sut.balanceOf(address(0xAAAA));
    }
}

// allowance
contract ERC20_Maple_allowance_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC20_Maple internal sut;

    function setUp() public {
        sut = new ERC20_Maple();
        sut.mint(address(0xAAAA), 1000 ether);
        HEVM.prank(address(0xAAAA));
        sut.approve(address(0xBBBB), 1000 ether);
    }

    function test_allowance() public view {
        sut.allowance(address(0xAAAA), address(0xBBBB));
    }
}
