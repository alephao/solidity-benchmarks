// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.4;

import {DSTest} from "@ds-test/test.sol";
import {Vm} from "@forge-std/Vm.sol";
import {ERC721_OZ} from "$/ERC721_OZ.sol";
import {ERC721_OZEnumerable} from "$/ERC721_OZEnumerable.sol";
import {ERC721_Solmate} from "$/ERC721_Solmate.sol";
import {ERC721_A} from "$/ERC721_A.sol";
import {ERC721_B} from "$/ERC721_B.sol";
import {ERC721_K} from "$/ERC721_K.sol";

// deploy
contract ERC721_OZ_deploy_Test is DSTest {
    function test_deploy() public {
        ERC721_OZ sut = new ERC721_OZ();
    }
}

// mint
contract ERC721_OZ_mint_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_OZ internal sut;

    function setUp() public {
        sut = new ERC721_OZ();
    }

    function test_mint_1() public {
        sut.mint(address(0xAAAA), 1);
    }

    function test_mint_2() public {
        sut.mint(address(0xAAAA), 2);
    }

    function test_mint_3() public {
        sut.mint(address(0xAAAA), 3);
    }

    function test_mint_4() public {
        sut.mint(address(0xAAAA), 4);
    }

    function test_mint_5() public {
        sut.mint(address(0xAAAA), 5);
    }

    function test_mint_10() public {
        sut.mint(address(0xAAAA), 10);
    }

    function test_mint_50() public {
        sut.mint(address(0xAAAA), 50);
    }

    function test_mint_100() public {
        sut.mint(address(0xAAAA), 100);
    }
}

// safeMint
contract ERC721_OZ_safeMint_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_OZ internal sut;

    function setUp() public {
        sut = new ERC721_OZ();
    }

    function test_safeMint_1() public {
        sut.safeMint(address(0xAAAA), 1);
    }

    function test_safeMint_2() public {
        sut.safeMint(address(0xAAAA), 2);
    }

    function test_safeMint_3() public {
        sut.safeMint(address(0xAAAA), 3);
    }

    function test_safeMint_4() public {
        sut.safeMint(address(0xAAAA), 4);
    }

    function test_safeMint_5() public {
        sut.safeMint(address(0xAAAA), 5);
    }

    function test_safeMint_10() public {
        sut.safeMint(address(0xAAAA), 10);
    }

    function test_safeMint_50() public {
        sut.safeMint(address(0xAAAA), 50);
    }

    function test_safeMint_100() public {
        sut.safeMint(address(0xAAAA), 100);
    }
}

// burn
contract ERC721_OZ_burn_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_OZ internal sut;

    function setUp() public {
        sut = new ERC721_OZ();
        sut.mint(address(0xAAAA), 101);
    }

    function test_burn_id1() public {
        HEVM.prank(address(0xAAAA));
        sut.burn(1);
    }

    function test_burn_id10() public {
        HEVM.prank(address(0xAAAA));
        sut.burn(10);
    }

    function test_burn_id50() public {
        HEVM.prank(address(0xAAAA));
        sut.burn(50);
    }

    function test_burn_id100() public {
        HEVM.prank(address(0xAAAA));
        sut.burn(100);
    }
}

// transfer toOwner
contract ERC721_OZ_transferToOwner_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_OZ internal sut;

    function setUp() public {
        sut = new ERC721_OZ();
        sut.mint(address(0xAAAA), 101);
        sut.mint(address(0xBBBB), 101);
    }

    function test_transferToOwner_id1() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xBBBB), 1);
    }

    function test_transferToOwner_id10() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xBBBB), 10);
    }

    function test_transferToOwner_id50() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xBBBB), 50);
    }

    function test_transferToOwner_id100() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xBBBB), 100);
    }
}

// transfer toNonOwner
contract ERC721_OZ_transferToNonOwner_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_OZ internal sut;

    function setUp() public {
        sut = new ERC721_OZ();
        sut.mint(address(0xAAAA), 101);
    }

    function test_transferToNonOwner_id1() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xCCCC), 1);
    }

    function test_transferToNonOwner_id10() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xCCCC), 10);
    }

    function test_transferToNonOwner_id50() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xCCCC), 50);
    }

    function test_transferToNonOwner_id100() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xCCCC), 100);
    }
}

// safeTransfer toOwner
contract ERC721_OZ_safeTransferToOwner_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_OZ internal sut;

    function setUp() public {
        sut = new ERC721_OZ();
        sut.mint(address(0xAAAA), 101);
        sut.mint(address(0xBBBB), 101);
    }

    function test_safeTransferToOwner_id1() public {
        HEVM.prank(address(0xAAAA));
        sut.safeTransferFrom(address(0xAAAA), address(0xBBBB), 1);
    }

    function test_safeTransferToOwner_id10() public {
        HEVM.prank(address(0xAAAA));
        sut.safeTransferFrom(address(0xAAAA), address(0xBBBB), 10);
    }

    function test_safeTransferToOwner_id50() public {
        HEVM.prank(address(0xAAAA));
        sut.safeTransferFrom(address(0xAAAA), address(0xBBBB), 50);
    }

    function test_safeTransferToOwner_id100() public {
        HEVM.prank(address(0xAAAA));
        sut.safeTransferFrom(address(0xAAAA), address(0xBBBB), 100);
    }
}

// safeTransfer toNonOwner
contract ERC721_OZ_safeTransferToNonOwner_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_OZ internal sut;

    function setUp() public {
        sut = new ERC721_OZ();
        sut.mint(address(0xAAAA), 101);
    }

    function test_safeTransferToNonOwner_id1() public {
        HEVM.prank(address(0xAAAA));
        sut.safeTransferFrom(address(0xAAAA), address(0xCCCC), 1);
    }

    function test_safeTransferToNonOwner_id10() public {
        HEVM.prank(address(0xAAAA));
        sut.safeTransferFrom(address(0xAAAA), address(0xCCCC), 10);
    }

    function test_safeTransferToNonOwner_id50() public {
        HEVM.prank(address(0xAAAA));
        sut.safeTransferFrom(address(0xAAAA), address(0xCCCC), 50);
    }

    function test_safeTransferToNonOwner_id100() public {
        HEVM.prank(address(0xAAAA));
        sut.safeTransferFrom(address(0xAAAA), address(0xCCCC), 100);
    }
}

// setApprovalForAll
contract ERC721_OZ_setApprovalForAll_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_OZ internal sut;

    function setUp() public {
        sut = new ERC721_OZ();
        sut.mint(address(0xAAAA), 101);
    }

    function test_setApprovalForAll() public {
        HEVM.prank(address(0xAAAA));
        sut.setApprovalForAll(address(0xCCCC), true);
    }
}

// approve
contract ERC721_OZ_approve_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_OZ internal sut;

    function setUp() public {
        sut = new ERC721_OZ();
        sut.mint(address(0xAAAA), 101);
    }


    function test_approve_id1() public {
        HEVM.prank(address(0xAAAA));
        sut.approve(address(0xCCCC), 1);
    }

    function test_approve_id10() public {
        HEVM.prank(address(0xAAAA));
        sut.approve(address(0xCCCC), 10);
    }

    function test_approve_id50() public {
        HEVM.prank(address(0xAAAA));
        sut.approve(address(0xCCCC), 50);
    }

    function test_approve_id100() public {
        HEVM.prank(address(0xAAAA));
        sut.approve(address(0xCCCC), 100);
    }
}

// balanceOf
contract ERC721_OZ_balanceOf_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_OZ internal sut;

    function setUp() public {
        sut = new ERC721_OZ();
        sut.mint(address(0xAAAA), 1);
        sut.mint(address(0xBBBB), 10);
        sut.mint(address(0xCCCC), 50);
        sut.mint(address(0xDDDD), 100);
    }

    function test_balanceOf_1() view public {
        sut.balanceOf(address(0xAAAA));
    }

    function test_balanceOf_10() view public {
        sut.balanceOf(address(0xBBBB));
    }

    function test_balanceOf_50() view public {
        sut.balanceOf(address(0xCCCC));
    }

    function test_balanceOf_100() view public {
        sut.balanceOf(address(0xDDDD));
    }
}

contract ERC721_OZ_ownerOf_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_OZ internal sut;

    function setUp() public {
        sut = new ERC721_OZ();
        sut.mint(address(0xAAAA), 101);
    }

    function test_ownerOf_1() view public {
        sut.ownerOf(1);
    }

    function test_ownerOf_10() view public {
        sut.ownerOf(10);
    }

    function test_ownerOf_50() view public {
        sut.ownerOf(50);
    }

    function test_ownerOf_100() view public {
        sut.ownerOf(100);
    }
}

contract ERC721_OZ_getApproved_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_OZ internal sut;

    function setUp() public {
        sut = new ERC721_OZ();
        sut.mint(address(0xAAAA), 101);
    }

    function test_getApproved_1() view public {
        sut.ownerOf(1);
    }

    function test_getApproved_10() view public {
        sut.ownerOf(10);
    }

    function test_getApproved_50() view public {
        sut.ownerOf(50);
    }

    function test_getApproved_100() view public {
        sut.ownerOf(100);
    }
}

// isApprovedForAll
contract ERC721_OZ_isApprovedForAll_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_OZ internal sut;

    function setUp() public {
        sut = new ERC721_OZ();
        sut.mint(address(0xAAAA), 10);
    }

    function test_isApprovedForAll() view public {
        sut.isApprovedForAll(address(0xAAAA), address(0xBBBB));
    }
}

// deploy
contract ERC721_OZEnumerable_deploy_Test is DSTest {
    function test_deploy() public {
        ERC721_OZEnumerable sut = new ERC721_OZEnumerable();
    }
}

// mint
contract ERC721_OZEnumerable_mint_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_OZEnumerable internal sut;

    function setUp() public {
        sut = new ERC721_OZEnumerable();
    }

    function test_mint_1() public {
        sut.mint(address(0xAAAA), 1);
    }

    function test_mint_2() public {
        sut.mint(address(0xAAAA), 2);
    }

    function test_mint_3() public {
        sut.mint(address(0xAAAA), 3);
    }

    function test_mint_4() public {
        sut.mint(address(0xAAAA), 4);
    }

    function test_mint_5() public {
        sut.mint(address(0xAAAA), 5);
    }

    function test_mint_10() public {
        sut.mint(address(0xAAAA), 10);
    }

    function test_mint_50() public {
        sut.mint(address(0xAAAA), 50);
    }

    function test_mint_100() public {
        sut.mint(address(0xAAAA), 100);
    }
}

// safeMint
contract ERC721_OZEnumerable_safeMint_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_OZEnumerable internal sut;

    function setUp() public {
        sut = new ERC721_OZEnumerable();
    }

    function test_safeMint_1() public {
        sut.safeMint(address(0xAAAA), 1);
    }

    function test_safeMint_2() public {
        sut.safeMint(address(0xAAAA), 2);
    }

    function test_safeMint_3() public {
        sut.safeMint(address(0xAAAA), 3);
    }

    function test_safeMint_4() public {
        sut.safeMint(address(0xAAAA), 4);
    }

    function test_safeMint_5() public {
        sut.safeMint(address(0xAAAA), 5);
    }

    function test_safeMint_10() public {
        sut.safeMint(address(0xAAAA), 10);
    }

    function test_safeMint_50() public {
        sut.safeMint(address(0xAAAA), 50);
    }

    function test_safeMint_100() public {
        sut.safeMint(address(0xAAAA), 100);
    }
}

// burn
contract ERC721_OZEnumerable_burn_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_OZEnumerable internal sut;

    function setUp() public {
        sut = new ERC721_OZEnumerable();
        sut.mint(address(0xAAAA), 101);
    }

    function test_burn_id1() public {
        HEVM.prank(address(0xAAAA));
        sut.burn(1);
    }

    function test_burn_id10() public {
        HEVM.prank(address(0xAAAA));
        sut.burn(10);
    }

    function test_burn_id50() public {
        HEVM.prank(address(0xAAAA));
        sut.burn(50);
    }

    function test_burn_id100() public {
        HEVM.prank(address(0xAAAA));
        sut.burn(100);
    }
}

// transfer toOwner
contract ERC721_OZEnumerable_transferToOwner_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_OZEnumerable internal sut;

    function setUp() public {
        sut = new ERC721_OZEnumerable();
        sut.mint(address(0xAAAA), 101);
        sut.mint(address(0xBBBB), 101);
    }

    function test_transferToOwner_id1() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xBBBB), 1);
    }

    function test_transferToOwner_id10() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xBBBB), 10);
    }

    function test_transferToOwner_id50() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xBBBB), 50);
    }

    function test_transferToOwner_id100() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xBBBB), 100);
    }
}

// transfer toNonOwner
contract ERC721_OZEnumerable_transferToNonOwner_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_OZEnumerable internal sut;

    function setUp() public {
        sut = new ERC721_OZEnumerable();
        sut.mint(address(0xAAAA), 101);
    }

    function test_transferToNonOwner_id1() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xCCCC), 1);
    }

    function test_transferToNonOwner_id10() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xCCCC), 10);
    }

    function test_transferToNonOwner_id50() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xCCCC), 50);
    }

    function test_transferToNonOwner_id100() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xCCCC), 100);
    }
}

// safeTransfer toOwner
contract ERC721_OZEnumerable_safeTransferToOwner_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_OZEnumerable internal sut;

    function setUp() public {
        sut = new ERC721_OZEnumerable();
        sut.mint(address(0xAAAA), 101);
        sut.mint(address(0xBBBB), 101);
    }

    function test_safeTransferToOwner_id1() public {
        HEVM.prank(address(0xAAAA));
        sut.safeTransferFrom(address(0xAAAA), address(0xBBBB), 1);
    }

    function test_safeTransferToOwner_id10() public {
        HEVM.prank(address(0xAAAA));
        sut.safeTransferFrom(address(0xAAAA), address(0xBBBB), 10);
    }

    function test_safeTransferToOwner_id50() public {
        HEVM.prank(address(0xAAAA));
        sut.safeTransferFrom(address(0xAAAA), address(0xBBBB), 50);
    }

    function test_safeTransferToOwner_id100() public {
        HEVM.prank(address(0xAAAA));
        sut.safeTransferFrom(address(0xAAAA), address(0xBBBB), 100);
    }
}

// safeTransfer toNonOwner
contract ERC721_OZEnumerable_safeTransferToNonOwner_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_OZEnumerable internal sut;

    function setUp() public {
        sut = new ERC721_OZEnumerable();
        sut.mint(address(0xAAAA), 101);
    }

    function test_safeTransferToNonOwner_id1() public {
        HEVM.prank(address(0xAAAA));
        sut.safeTransferFrom(address(0xAAAA), address(0xCCCC), 1);
    }

    function test_safeTransferToNonOwner_id10() public {
        HEVM.prank(address(0xAAAA));
        sut.safeTransferFrom(address(0xAAAA), address(0xCCCC), 10);
    }

    function test_safeTransferToNonOwner_id50() public {
        HEVM.prank(address(0xAAAA));
        sut.safeTransferFrom(address(0xAAAA), address(0xCCCC), 50);
    }

    function test_safeTransferToNonOwner_id100() public {
        HEVM.prank(address(0xAAAA));
        sut.safeTransferFrom(address(0xAAAA), address(0xCCCC), 100);
    }
}

// setApprovalForAll
contract ERC721_OZEnumerable_setApprovalForAll_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_OZEnumerable internal sut;

    function setUp() public {
        sut = new ERC721_OZEnumerable();
        sut.mint(address(0xAAAA), 101);
    }

    function test_setApprovalForAll() public {
        HEVM.prank(address(0xAAAA));
        sut.setApprovalForAll(address(0xCCCC), true);
    }
}

// approve
contract ERC721_OZEnumerable_approve_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_OZEnumerable internal sut;

    function setUp() public {
        sut = new ERC721_OZEnumerable();
        sut.mint(address(0xAAAA), 101);
    }


    function test_approve_id1() public {
        HEVM.prank(address(0xAAAA));
        sut.approve(address(0xCCCC), 1);
    }

    function test_approve_id10() public {
        HEVM.prank(address(0xAAAA));
        sut.approve(address(0xCCCC), 10);
    }

    function test_approve_id50() public {
        HEVM.prank(address(0xAAAA));
        sut.approve(address(0xCCCC), 50);
    }

    function test_approve_id100() public {
        HEVM.prank(address(0xAAAA));
        sut.approve(address(0xCCCC), 100);
    }
}

// balanceOf
contract ERC721_OZEnumerable_balanceOf_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_OZEnumerable internal sut;

    function setUp() public {
        sut = new ERC721_OZEnumerable();
        sut.mint(address(0xAAAA), 1);
        sut.mint(address(0xBBBB), 10);
        sut.mint(address(0xCCCC), 50);
        sut.mint(address(0xDDDD), 100);
    }

    function test_balanceOf_1() view public {
        sut.balanceOf(address(0xAAAA));
    }

    function test_balanceOf_10() view public {
        sut.balanceOf(address(0xBBBB));
    }

    function test_balanceOf_50() view public {
        sut.balanceOf(address(0xCCCC));
    }

    function test_balanceOf_100() view public {
        sut.balanceOf(address(0xDDDD));
    }
}

contract ERC721_OZEnumerable_ownerOf_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_OZEnumerable internal sut;

    function setUp() public {
        sut = new ERC721_OZEnumerable();
        sut.mint(address(0xAAAA), 101);
    }

    function test_ownerOf_1() view public {
        sut.ownerOf(1);
    }

    function test_ownerOf_10() view public {
        sut.ownerOf(10);
    }

    function test_ownerOf_50() view public {
        sut.ownerOf(50);
    }

    function test_ownerOf_100() view public {
        sut.ownerOf(100);
    }
}

contract ERC721_OZEnumerable_getApproved_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_OZEnumerable internal sut;

    function setUp() public {
        sut = new ERC721_OZEnumerable();
        sut.mint(address(0xAAAA), 101);
    }

    function test_getApproved_1() view public {
        sut.ownerOf(1);
    }

    function test_getApproved_10() view public {
        sut.ownerOf(10);
    }

    function test_getApproved_50() view public {
        sut.ownerOf(50);
    }

    function test_getApproved_100() view public {
        sut.ownerOf(100);
    }
}

// isApprovedForAll
contract ERC721_OZEnumerable_isApprovedForAll_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_OZEnumerable internal sut;

    function setUp() public {
        sut = new ERC721_OZEnumerable();
        sut.mint(address(0xAAAA), 10);
    }

    function test_isApprovedForAll() view public {
        sut.isApprovedForAll(address(0xAAAA), address(0xBBBB));
    }
}

// deploy
contract ERC721_Solmate_deploy_Test is DSTest {
    function test_deploy() public {
        ERC721_Solmate sut = new ERC721_Solmate();
    }
}

// mint
contract ERC721_Solmate_mint_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_Solmate internal sut;

    function setUp() public {
        sut = new ERC721_Solmate();
    }

    function test_mint_1() public {
        sut.mint(address(0xAAAA), 1);
    }

    function test_mint_2() public {
        sut.mint(address(0xAAAA), 2);
    }

    function test_mint_3() public {
        sut.mint(address(0xAAAA), 3);
    }

    function test_mint_4() public {
        sut.mint(address(0xAAAA), 4);
    }

    function test_mint_5() public {
        sut.mint(address(0xAAAA), 5);
    }

    function test_mint_10() public {
        sut.mint(address(0xAAAA), 10);
    }

    function test_mint_50() public {
        sut.mint(address(0xAAAA), 50);
    }

    function test_mint_100() public {
        sut.mint(address(0xAAAA), 100);
    }
}

// safeMint
contract ERC721_Solmate_safeMint_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_Solmate internal sut;

    function setUp() public {
        sut = new ERC721_Solmate();
    }

    function test_safeMint_1() public {
        sut.safeMint(address(0xAAAA), 1);
    }

    function test_safeMint_2() public {
        sut.safeMint(address(0xAAAA), 2);
    }

    function test_safeMint_3() public {
        sut.safeMint(address(0xAAAA), 3);
    }

    function test_safeMint_4() public {
        sut.safeMint(address(0xAAAA), 4);
    }

    function test_safeMint_5() public {
        sut.safeMint(address(0xAAAA), 5);
    }

    function test_safeMint_10() public {
        sut.safeMint(address(0xAAAA), 10);
    }

    function test_safeMint_50() public {
        sut.safeMint(address(0xAAAA), 50);
    }

    function test_safeMint_100() public {
        sut.safeMint(address(0xAAAA), 100);
    }
}

// burn
contract ERC721_Solmate_burn_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_Solmate internal sut;

    function setUp() public {
        sut = new ERC721_Solmate();
        sut.mint(address(0xAAAA), 101);
    }

    function test_burn_id1() public {
        HEVM.prank(address(0xAAAA));
        sut.burn(1);
    }

    function test_burn_id10() public {
        HEVM.prank(address(0xAAAA));
        sut.burn(10);
    }

    function test_burn_id50() public {
        HEVM.prank(address(0xAAAA));
        sut.burn(50);
    }

    function test_burn_id100() public {
        HEVM.prank(address(0xAAAA));
        sut.burn(100);
    }
}

// transfer toOwner
contract ERC721_Solmate_transferToOwner_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_Solmate internal sut;

    function setUp() public {
        sut = new ERC721_Solmate();
        sut.mint(address(0xAAAA), 101);
        sut.mint(address(0xBBBB), 101);
    }

    function test_transferToOwner_id1() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xBBBB), 1);
    }

    function test_transferToOwner_id10() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xBBBB), 10);
    }

    function test_transferToOwner_id50() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xBBBB), 50);
    }

    function test_transferToOwner_id100() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xBBBB), 100);
    }
}

// transfer toNonOwner
contract ERC721_Solmate_transferToNonOwner_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_Solmate internal sut;

    function setUp() public {
        sut = new ERC721_Solmate();
        sut.mint(address(0xAAAA), 101);
    }

    function test_transferToNonOwner_id1() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xCCCC), 1);
    }

    function test_transferToNonOwner_id10() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xCCCC), 10);
    }

    function test_transferToNonOwner_id50() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xCCCC), 50);
    }

    function test_transferToNonOwner_id100() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xCCCC), 100);
    }
}

// safeTransfer toOwner
contract ERC721_Solmate_safeTransferToOwner_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_Solmate internal sut;

    function setUp() public {
        sut = new ERC721_Solmate();
        sut.mint(address(0xAAAA), 101);
        sut.mint(address(0xBBBB), 101);
    }

    function test_safeTransferToOwner_id1() public {
        HEVM.prank(address(0xAAAA));
        sut.safeTransferFrom(address(0xAAAA), address(0xBBBB), 1);
    }

    function test_safeTransferToOwner_id10() public {
        HEVM.prank(address(0xAAAA));
        sut.safeTransferFrom(address(0xAAAA), address(0xBBBB), 10);
    }

    function test_safeTransferToOwner_id50() public {
        HEVM.prank(address(0xAAAA));
        sut.safeTransferFrom(address(0xAAAA), address(0xBBBB), 50);
    }

    function test_safeTransferToOwner_id100() public {
        HEVM.prank(address(0xAAAA));
        sut.safeTransferFrom(address(0xAAAA), address(0xBBBB), 100);
    }
}

// safeTransfer toNonOwner
contract ERC721_Solmate_safeTransferToNonOwner_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_Solmate internal sut;

    function setUp() public {
        sut = new ERC721_Solmate();
        sut.mint(address(0xAAAA), 101);
    }

    function test_safeTransferToNonOwner_id1() public {
        HEVM.prank(address(0xAAAA));
        sut.safeTransferFrom(address(0xAAAA), address(0xCCCC), 1);
    }

    function test_safeTransferToNonOwner_id10() public {
        HEVM.prank(address(0xAAAA));
        sut.safeTransferFrom(address(0xAAAA), address(0xCCCC), 10);
    }

    function test_safeTransferToNonOwner_id50() public {
        HEVM.prank(address(0xAAAA));
        sut.safeTransferFrom(address(0xAAAA), address(0xCCCC), 50);
    }

    function test_safeTransferToNonOwner_id100() public {
        HEVM.prank(address(0xAAAA));
        sut.safeTransferFrom(address(0xAAAA), address(0xCCCC), 100);
    }
}

// setApprovalForAll
contract ERC721_Solmate_setApprovalForAll_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_Solmate internal sut;

    function setUp() public {
        sut = new ERC721_Solmate();
        sut.mint(address(0xAAAA), 101);
    }

    function test_setApprovalForAll() public {
        HEVM.prank(address(0xAAAA));
        sut.setApprovalForAll(address(0xCCCC), true);
    }
}

// approve
contract ERC721_Solmate_approve_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_Solmate internal sut;

    function setUp() public {
        sut = new ERC721_Solmate();
        sut.mint(address(0xAAAA), 101);
    }


    function test_approve_id1() public {
        HEVM.prank(address(0xAAAA));
        sut.approve(address(0xCCCC), 1);
    }

    function test_approve_id10() public {
        HEVM.prank(address(0xAAAA));
        sut.approve(address(0xCCCC), 10);
    }

    function test_approve_id50() public {
        HEVM.prank(address(0xAAAA));
        sut.approve(address(0xCCCC), 50);
    }

    function test_approve_id100() public {
        HEVM.prank(address(0xAAAA));
        sut.approve(address(0xCCCC), 100);
    }
}

// balanceOf
contract ERC721_Solmate_balanceOf_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_Solmate internal sut;

    function setUp() public {
        sut = new ERC721_Solmate();
        sut.mint(address(0xAAAA), 1);
        sut.mint(address(0xBBBB), 10);
        sut.mint(address(0xCCCC), 50);
        sut.mint(address(0xDDDD), 100);
    }

    function test_balanceOf_1() view public {
        sut.balanceOf(address(0xAAAA));
    }

    function test_balanceOf_10() view public {
        sut.balanceOf(address(0xBBBB));
    }

    function test_balanceOf_50() view public {
        sut.balanceOf(address(0xCCCC));
    }

    function test_balanceOf_100() view public {
        sut.balanceOf(address(0xDDDD));
    }
}

contract ERC721_Solmate_ownerOf_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_Solmate internal sut;

    function setUp() public {
        sut = new ERC721_Solmate();
        sut.mint(address(0xAAAA), 101);
    }

    function test_ownerOf_1() view public {
        sut.ownerOf(1);
    }

    function test_ownerOf_10() view public {
        sut.ownerOf(10);
    }

    function test_ownerOf_50() view public {
        sut.ownerOf(50);
    }

    function test_ownerOf_100() view public {
        sut.ownerOf(100);
    }
}

contract ERC721_Solmate_getApproved_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_Solmate internal sut;

    function setUp() public {
        sut = new ERC721_Solmate();
        sut.mint(address(0xAAAA), 101);
    }

    function test_getApproved_1() view public {
        sut.ownerOf(1);
    }

    function test_getApproved_10() view public {
        sut.ownerOf(10);
    }

    function test_getApproved_50() view public {
        sut.ownerOf(50);
    }

    function test_getApproved_100() view public {
        sut.ownerOf(100);
    }
}

// isApprovedForAll
contract ERC721_Solmate_isApprovedForAll_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_Solmate internal sut;

    function setUp() public {
        sut = new ERC721_Solmate();
        sut.mint(address(0xAAAA), 10);
    }

    function test_isApprovedForAll() view public {
        sut.isApprovedForAll(address(0xAAAA), address(0xBBBB));
    }
}

// deploy
contract ERC721_A_deploy_Test is DSTest {
    function test_deploy() public {
        ERC721_A sut = new ERC721_A();
    }
}

// mint
contract ERC721_A_mint_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_A internal sut;

    function setUp() public {
        sut = new ERC721_A();
    }

    function test_mint_1() public {
        sut.mint(address(0xAAAA), 1);
    }

    function test_mint_2() public {
        sut.mint(address(0xAAAA), 2);
    }

    function test_mint_3() public {
        sut.mint(address(0xAAAA), 3);
    }

    function test_mint_4() public {
        sut.mint(address(0xAAAA), 4);
    }

    function test_mint_5() public {
        sut.mint(address(0xAAAA), 5);
    }

    function test_mint_10() public {
        sut.mint(address(0xAAAA), 10);
    }

    function test_mint_50() public {
        sut.mint(address(0xAAAA), 50);
    }

    function test_mint_100() public {
        sut.mint(address(0xAAAA), 100);
    }
}

// safeMint
contract ERC721_A_safeMint_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_A internal sut;

    function setUp() public {
        sut = new ERC721_A();
    }

    function test_safeMint_1() public {
        sut.safeMint(address(0xAAAA), 1);
    }

    function test_safeMint_2() public {
        sut.safeMint(address(0xAAAA), 2);
    }

    function test_safeMint_3() public {
        sut.safeMint(address(0xAAAA), 3);
    }

    function test_safeMint_4() public {
        sut.safeMint(address(0xAAAA), 4);
    }

    function test_safeMint_5() public {
        sut.safeMint(address(0xAAAA), 5);
    }

    function test_safeMint_10() public {
        sut.safeMint(address(0xAAAA), 10);
    }

    function test_safeMint_50() public {
        sut.safeMint(address(0xAAAA), 50);
    }

    function test_safeMint_100() public {
        sut.safeMint(address(0xAAAA), 100);
    }
}

// burn
contract ERC721_A_burn_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_A internal sut;

    function setUp() public {
        sut = new ERC721_A();
        sut.mint(address(0xAAAA), 101);
    }

    function test_burn_id1() public {
        HEVM.prank(address(0xAAAA));
        sut.burn(1);
    }

    function test_burn_id10() public {
        HEVM.prank(address(0xAAAA));
        sut.burn(10);
    }

    function test_burn_id50() public {
        HEVM.prank(address(0xAAAA));
        sut.burn(50);
    }

    function test_burn_id100() public {
        HEVM.prank(address(0xAAAA));
        sut.burn(100);
    }
}

// transfer toOwner
contract ERC721_A_transferToOwner_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_A internal sut;

    function setUp() public {
        sut = new ERC721_A();
        sut.mint(address(0xAAAA), 101);
        sut.mint(address(0xBBBB), 101);
    }

    function test_transferToOwner_id1() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xBBBB), 1);
    }

    function test_transferToOwner_id10() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xBBBB), 10);
    }

    function test_transferToOwner_id50() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xBBBB), 50);
    }

    function test_transferToOwner_id100() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xBBBB), 100);
    }
}

// transfer toNonOwner
contract ERC721_A_transferToNonOwner_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_A internal sut;

    function setUp() public {
        sut = new ERC721_A();
        sut.mint(address(0xAAAA), 101);
    }

    function test_transferToNonOwner_id1() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xCCCC), 1);
    }

    function test_transferToNonOwner_id10() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xCCCC), 10);
    }

    function test_transferToNonOwner_id50() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xCCCC), 50);
    }

    function test_transferToNonOwner_id100() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xCCCC), 100);
    }
}

// safeTransfer toOwner
contract ERC721_A_safeTransferToOwner_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_A internal sut;

    function setUp() public {
        sut = new ERC721_A();
        sut.mint(address(0xAAAA), 101);
        sut.mint(address(0xBBBB), 101);
    }

    function test_safeTransferToOwner_id1() public {
        HEVM.prank(address(0xAAAA));
        sut.safeTransferFrom(address(0xAAAA), address(0xBBBB), 1);
    }

    function test_safeTransferToOwner_id10() public {
        HEVM.prank(address(0xAAAA));
        sut.safeTransferFrom(address(0xAAAA), address(0xBBBB), 10);
    }

    function test_safeTransferToOwner_id50() public {
        HEVM.prank(address(0xAAAA));
        sut.safeTransferFrom(address(0xAAAA), address(0xBBBB), 50);
    }

    function test_safeTransferToOwner_id100() public {
        HEVM.prank(address(0xAAAA));
        sut.safeTransferFrom(address(0xAAAA), address(0xBBBB), 100);
    }
}

// safeTransfer toNonOwner
contract ERC721_A_safeTransferToNonOwner_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_A internal sut;

    function setUp() public {
        sut = new ERC721_A();
        sut.mint(address(0xAAAA), 101);
    }

    function test_safeTransferToNonOwner_id1() public {
        HEVM.prank(address(0xAAAA));
        sut.safeTransferFrom(address(0xAAAA), address(0xCCCC), 1);
    }

    function test_safeTransferToNonOwner_id10() public {
        HEVM.prank(address(0xAAAA));
        sut.safeTransferFrom(address(0xAAAA), address(0xCCCC), 10);
    }

    function test_safeTransferToNonOwner_id50() public {
        HEVM.prank(address(0xAAAA));
        sut.safeTransferFrom(address(0xAAAA), address(0xCCCC), 50);
    }

    function test_safeTransferToNonOwner_id100() public {
        HEVM.prank(address(0xAAAA));
        sut.safeTransferFrom(address(0xAAAA), address(0xCCCC), 100);
    }
}

// setApprovalForAll
contract ERC721_A_setApprovalForAll_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_A internal sut;

    function setUp() public {
        sut = new ERC721_A();
        sut.mint(address(0xAAAA), 101);
    }

    function test_setApprovalForAll() public {
        HEVM.prank(address(0xAAAA));
        sut.setApprovalForAll(address(0xCCCC), true);
    }
}

// approve
contract ERC721_A_approve_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_A internal sut;

    function setUp() public {
        sut = new ERC721_A();
        sut.mint(address(0xAAAA), 101);
    }


    function test_approve_id1() public {
        HEVM.prank(address(0xAAAA));
        sut.approve(address(0xCCCC), 1);
    }

    function test_approve_id10() public {
        HEVM.prank(address(0xAAAA));
        sut.approve(address(0xCCCC), 10);
    }

    function test_approve_id50() public {
        HEVM.prank(address(0xAAAA));
        sut.approve(address(0xCCCC), 50);
    }

    function test_approve_id100() public {
        HEVM.prank(address(0xAAAA));
        sut.approve(address(0xCCCC), 100);
    }
}

// balanceOf
contract ERC721_A_balanceOf_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_A internal sut;

    function setUp() public {
        sut = new ERC721_A();
        sut.mint(address(0xAAAA), 1);
        sut.mint(address(0xBBBB), 10);
        sut.mint(address(0xCCCC), 50);
        sut.mint(address(0xDDDD), 100);
    }

    function test_balanceOf_1() view public {
        sut.balanceOf(address(0xAAAA));
    }

    function test_balanceOf_10() view public {
        sut.balanceOf(address(0xBBBB));
    }

    function test_balanceOf_50() view public {
        sut.balanceOf(address(0xCCCC));
    }

    function test_balanceOf_100() view public {
        sut.balanceOf(address(0xDDDD));
    }
}

contract ERC721_A_ownerOf_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_A internal sut;

    function setUp() public {
        sut = new ERC721_A();
        sut.mint(address(0xAAAA), 101);
    }

    function test_ownerOf_1() view public {
        sut.ownerOf(1);
    }

    function test_ownerOf_10() view public {
        sut.ownerOf(10);
    }

    function test_ownerOf_50() view public {
        sut.ownerOf(50);
    }

    function test_ownerOf_100() view public {
        sut.ownerOf(100);
    }
}

contract ERC721_A_getApproved_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_A internal sut;

    function setUp() public {
        sut = new ERC721_A();
        sut.mint(address(0xAAAA), 101);
    }

    function test_getApproved_1() view public {
        sut.ownerOf(1);
    }

    function test_getApproved_10() view public {
        sut.ownerOf(10);
    }

    function test_getApproved_50() view public {
        sut.ownerOf(50);
    }

    function test_getApproved_100() view public {
        sut.ownerOf(100);
    }
}

// isApprovedForAll
contract ERC721_A_isApprovedForAll_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_A internal sut;

    function setUp() public {
        sut = new ERC721_A();
        sut.mint(address(0xAAAA), 10);
    }

    function test_isApprovedForAll() view public {
        sut.isApprovedForAll(address(0xAAAA), address(0xBBBB));
    }
}

// deploy
contract ERC721_B_deploy_Test is DSTest {
    function test_deploy() public {
        ERC721_B sut = new ERC721_B();
    }
}

// mint
contract ERC721_B_mint_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_B internal sut;

    function setUp() public {
        sut = new ERC721_B();
    }

    function test_mint_1() public {
        sut.mint(address(0xAAAA), 1);
    }

    function test_mint_2() public {
        sut.mint(address(0xAAAA), 2);
    }

    function test_mint_3() public {
        sut.mint(address(0xAAAA), 3);
    }

    function test_mint_4() public {
        sut.mint(address(0xAAAA), 4);
    }

    function test_mint_5() public {
        sut.mint(address(0xAAAA), 5);
    }

    function test_mint_10() public {
        sut.mint(address(0xAAAA), 10);
    }

    function test_mint_50() public {
        sut.mint(address(0xAAAA), 50);
    }

    function test_mint_100() public {
        sut.mint(address(0xAAAA), 100);
    }
}

// safeMint
contract ERC721_B_safeMint_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_B internal sut;

    function setUp() public {
        sut = new ERC721_B();
    }

    function test_safeMint_1() public {
        sut.safeMint(address(0xAAAA), 1);
    }

    function test_safeMint_2() public {
        sut.safeMint(address(0xAAAA), 2);
    }

    function test_safeMint_3() public {
        sut.safeMint(address(0xAAAA), 3);
    }

    function test_safeMint_4() public {
        sut.safeMint(address(0xAAAA), 4);
    }

    function test_safeMint_5() public {
        sut.safeMint(address(0xAAAA), 5);
    }

    function test_safeMint_10() public {
        sut.safeMint(address(0xAAAA), 10);
    }

    function test_safeMint_50() public {
        sut.safeMint(address(0xAAAA), 50);
    }

    function test_safeMint_100() public {
        sut.safeMint(address(0xAAAA), 100);
    }
}

// burn
contract ERC721_B_burn_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_B internal sut;

    function setUp() public {
        sut = new ERC721_B();
        sut.mint(address(0xAAAA), 101);
    }

    function test_burn_id1() public {
        HEVM.prank(address(0xAAAA));
        sut.burn(1);
    }

    function test_burn_id10() public {
        HEVM.prank(address(0xAAAA));
        sut.burn(10);
    }

    function test_burn_id50() public {
        HEVM.prank(address(0xAAAA));
        sut.burn(50);
    }

    function test_burn_id100() public {
        HEVM.prank(address(0xAAAA));
        sut.burn(100);
    }
}

// transfer toOwner
contract ERC721_B_transferToOwner_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_B internal sut;

    function setUp() public {
        sut = new ERC721_B();
        sut.mint(address(0xAAAA), 101);
        sut.mint(address(0xBBBB), 101);
    }

    function test_transferToOwner_id1() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xBBBB), 1);
    }

    function test_transferToOwner_id10() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xBBBB), 10);
    }

    function test_transferToOwner_id50() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xBBBB), 50);
    }

    function test_transferToOwner_id100() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xBBBB), 100);
    }
}

// transfer toNonOwner
contract ERC721_B_transferToNonOwner_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_B internal sut;

    function setUp() public {
        sut = new ERC721_B();
        sut.mint(address(0xAAAA), 101);
    }

    function test_transferToNonOwner_id1() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xCCCC), 1);
    }

    function test_transferToNonOwner_id10() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xCCCC), 10);
    }

    function test_transferToNonOwner_id50() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xCCCC), 50);
    }

    function test_transferToNonOwner_id100() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xCCCC), 100);
    }
}

// safeTransfer toOwner
contract ERC721_B_safeTransferToOwner_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_B internal sut;

    function setUp() public {
        sut = new ERC721_B();
        sut.mint(address(0xAAAA), 101);
        sut.mint(address(0xBBBB), 101);
    }

    function test_safeTransferToOwner_id1() public {
        HEVM.prank(address(0xAAAA));
        sut.safeTransferFrom(address(0xAAAA), address(0xBBBB), 1);
    }

    function test_safeTransferToOwner_id10() public {
        HEVM.prank(address(0xAAAA));
        sut.safeTransferFrom(address(0xAAAA), address(0xBBBB), 10);
    }

    function test_safeTransferToOwner_id50() public {
        HEVM.prank(address(0xAAAA));
        sut.safeTransferFrom(address(0xAAAA), address(0xBBBB), 50);
    }

    function test_safeTransferToOwner_id100() public {
        HEVM.prank(address(0xAAAA));
        sut.safeTransferFrom(address(0xAAAA), address(0xBBBB), 100);
    }
}

// safeTransfer toNonOwner
contract ERC721_B_safeTransferToNonOwner_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_B internal sut;

    function setUp() public {
        sut = new ERC721_B();
        sut.mint(address(0xAAAA), 101);
    }

    function test_safeTransferToNonOwner_id1() public {
        HEVM.prank(address(0xAAAA));
        sut.safeTransferFrom(address(0xAAAA), address(0xCCCC), 1);
    }

    function test_safeTransferToNonOwner_id10() public {
        HEVM.prank(address(0xAAAA));
        sut.safeTransferFrom(address(0xAAAA), address(0xCCCC), 10);
    }

    function test_safeTransferToNonOwner_id50() public {
        HEVM.prank(address(0xAAAA));
        sut.safeTransferFrom(address(0xAAAA), address(0xCCCC), 50);
    }

    function test_safeTransferToNonOwner_id100() public {
        HEVM.prank(address(0xAAAA));
        sut.safeTransferFrom(address(0xAAAA), address(0xCCCC), 100);
    }
}

// setApprovalForAll
contract ERC721_B_setApprovalForAll_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_B internal sut;

    function setUp() public {
        sut = new ERC721_B();
        sut.mint(address(0xAAAA), 101);
    }

    function test_setApprovalForAll() public {
        HEVM.prank(address(0xAAAA));
        sut.setApprovalForAll(address(0xCCCC), true);
    }
}

// approve
contract ERC721_B_approve_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_B internal sut;

    function setUp() public {
        sut = new ERC721_B();
        sut.mint(address(0xAAAA), 101);
    }


    function test_approve_id1() public {
        HEVM.prank(address(0xAAAA));
        sut.approve(address(0xCCCC), 1);
    }

    function test_approve_id10() public {
        HEVM.prank(address(0xAAAA));
        sut.approve(address(0xCCCC), 10);
    }

    function test_approve_id50() public {
        HEVM.prank(address(0xAAAA));
        sut.approve(address(0xCCCC), 50);
    }

    function test_approve_id100() public {
        HEVM.prank(address(0xAAAA));
        sut.approve(address(0xCCCC), 100);
    }
}

// balanceOf
contract ERC721_B_balanceOf_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_B internal sut;

    function setUp() public {
        sut = new ERC721_B();
        sut.mint(address(0xAAAA), 1);
        sut.mint(address(0xBBBB), 10);
        sut.mint(address(0xCCCC), 50);
        sut.mint(address(0xDDDD), 100);
    }

    function test_balanceOf_1() view public {
        sut.balanceOf(address(0xAAAA));
    }

    function test_balanceOf_10() view public {
        sut.balanceOf(address(0xBBBB));
    }

    function test_balanceOf_50() view public {
        sut.balanceOf(address(0xCCCC));
    }

    function test_balanceOf_100() view public {
        sut.balanceOf(address(0xDDDD));
    }
}

contract ERC721_B_ownerOf_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_B internal sut;

    function setUp() public {
        sut = new ERC721_B();
        sut.mint(address(0xAAAA), 101);
    }

    function test_ownerOf_1() view public {
        sut.ownerOf(1);
    }

    function test_ownerOf_10() view public {
        sut.ownerOf(10);
    }

    function test_ownerOf_50() view public {
        sut.ownerOf(50);
    }

    function test_ownerOf_100() view public {
        sut.ownerOf(100);
    }
}

contract ERC721_B_getApproved_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_B internal sut;

    function setUp() public {
        sut = new ERC721_B();
        sut.mint(address(0xAAAA), 101);
    }

    function test_getApproved_1() view public {
        sut.ownerOf(1);
    }

    function test_getApproved_10() view public {
        sut.ownerOf(10);
    }

    function test_getApproved_50() view public {
        sut.ownerOf(50);
    }

    function test_getApproved_100() view public {
        sut.ownerOf(100);
    }
}

// isApprovedForAll
contract ERC721_B_isApprovedForAll_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_B internal sut;

    function setUp() public {
        sut = new ERC721_B();
        sut.mint(address(0xAAAA), 10);
    }

    function test_isApprovedForAll() view public {
        sut.isApprovedForAll(address(0xAAAA), address(0xBBBB));
    }
}

// deploy
contract ERC721_K_deploy_Test is DSTest {
    function test_deploy() public {
        ERC721_K sut = new ERC721_K();
    }
}

// mint
contract ERC721_K_mint_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_K internal sut;

    function setUp() public {
        sut = new ERC721_K();
    }

    function test_mint_1() public {
        sut.mint(address(0xAAAA), 1);
    }

    function test_mint_2() public {
        sut.mint(address(0xAAAA), 2);
    }

    function test_mint_3() public {
        sut.mint(address(0xAAAA), 3);
    }

    function test_mint_4() public {
        sut.mint(address(0xAAAA), 4);
    }

    function test_mint_5() public {
        sut.mint(address(0xAAAA), 5);
    }

    function test_mint_10() public {
        sut.mint(address(0xAAAA), 10);
    }

    function test_mint_50() public {
        sut.mint(address(0xAAAA), 50);
    }

    function test_mint_100() public {
        sut.mint(address(0xAAAA), 100);
    }
}

// safeMint
contract ERC721_K_safeMint_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_K internal sut;

    function setUp() public {
        sut = new ERC721_K();
    }

    function test_safeMint_1() public {
        sut.safeMint(address(0xAAAA), 1);
    }

    function test_safeMint_2() public {
        sut.safeMint(address(0xAAAA), 2);
    }

    function test_safeMint_3() public {
        sut.safeMint(address(0xAAAA), 3);
    }

    function test_safeMint_4() public {
        sut.safeMint(address(0xAAAA), 4);
    }

    function test_safeMint_5() public {
        sut.safeMint(address(0xAAAA), 5);
    }

    function test_safeMint_10() public {
        sut.safeMint(address(0xAAAA), 10);
    }

    function test_safeMint_50() public {
        sut.safeMint(address(0xAAAA), 50);
    }

    function test_safeMint_100() public {
        sut.safeMint(address(0xAAAA), 100);
    }
}

// burn
contract ERC721_K_burn_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_K internal sut;

    function setUp() public {
        sut = new ERC721_K();
        sut.mint(address(0xAAAA), 101);
    }

    function test_burn_id1() public {
        HEVM.prank(address(0xAAAA));
        sut.burn(1);
    }

    function test_burn_id10() public {
        HEVM.prank(address(0xAAAA));
        sut.burn(10);
    }

    function test_burn_id50() public {
        HEVM.prank(address(0xAAAA));
        sut.burn(50);
    }

    function test_burn_id100() public {
        HEVM.prank(address(0xAAAA));
        sut.burn(100);
    }
}

// transfer toOwner
contract ERC721_K_transferToOwner_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_K internal sut;

    function setUp() public {
        sut = new ERC721_K();
        sut.mint(address(0xAAAA), 101);
        sut.mint(address(0xBBBB), 101);
    }

    function test_transferToOwner_id1() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xBBBB), 1);
    }

    function test_transferToOwner_id10() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xBBBB), 10);
    }

    function test_transferToOwner_id50() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xBBBB), 50);
    }

    function test_transferToOwner_id100() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xBBBB), 100);
    }
}

// transfer toNonOwner
contract ERC721_K_transferToNonOwner_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_K internal sut;

    function setUp() public {
        sut = new ERC721_K();
        sut.mint(address(0xAAAA), 101);
    }

    function test_transferToNonOwner_id1() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xCCCC), 1);
    }

    function test_transferToNonOwner_id10() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xCCCC), 10);
    }

    function test_transferToNonOwner_id50() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xCCCC), 50);
    }

    function test_transferToNonOwner_id100() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xCCCC), 100);
    }
}

// safeTransfer toOwner
contract ERC721_K_safeTransferToOwner_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_K internal sut;

    function setUp() public {
        sut = new ERC721_K();
        sut.mint(address(0xAAAA), 101);
        sut.mint(address(0xBBBB), 101);
    }

    function test_safeTransferToOwner_id1() public {
        HEVM.prank(address(0xAAAA));
        sut.safeTransferFrom(address(0xAAAA), address(0xBBBB), 1);
    }

    function test_safeTransferToOwner_id10() public {
        HEVM.prank(address(0xAAAA));
        sut.safeTransferFrom(address(0xAAAA), address(0xBBBB), 10);
    }

    function test_safeTransferToOwner_id50() public {
        HEVM.prank(address(0xAAAA));
        sut.safeTransferFrom(address(0xAAAA), address(0xBBBB), 50);
    }

    function test_safeTransferToOwner_id100() public {
        HEVM.prank(address(0xAAAA));
        sut.safeTransferFrom(address(0xAAAA), address(0xBBBB), 100);
    }
}

// safeTransfer toNonOwner
contract ERC721_K_safeTransferToNonOwner_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_K internal sut;

    function setUp() public {
        sut = new ERC721_K();
        sut.mint(address(0xAAAA), 101);
    }

    function test_safeTransferToNonOwner_id1() public {
        HEVM.prank(address(0xAAAA));
        sut.safeTransferFrom(address(0xAAAA), address(0xCCCC), 1);
    }

    function test_safeTransferToNonOwner_id10() public {
        HEVM.prank(address(0xAAAA));
        sut.safeTransferFrom(address(0xAAAA), address(0xCCCC), 10);
    }

    function test_safeTransferToNonOwner_id50() public {
        HEVM.prank(address(0xAAAA));
        sut.safeTransferFrom(address(0xAAAA), address(0xCCCC), 50);
    }

    function test_safeTransferToNonOwner_id100() public {
        HEVM.prank(address(0xAAAA));
        sut.safeTransferFrom(address(0xAAAA), address(0xCCCC), 100);
    }
}

// setApprovalForAll
contract ERC721_K_setApprovalForAll_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_K internal sut;

    function setUp() public {
        sut = new ERC721_K();
        sut.mint(address(0xAAAA), 101);
    }

    function test_setApprovalForAll() public {
        HEVM.prank(address(0xAAAA));
        sut.setApprovalForAll(address(0xCCCC), true);
    }
}

// approve
contract ERC721_K_approve_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_K internal sut;

    function setUp() public {
        sut = new ERC721_K();
        sut.mint(address(0xAAAA), 101);
    }


    function test_approve_id1() public {
        HEVM.prank(address(0xAAAA));
        sut.approve(address(0xCCCC), 1);
    }

    function test_approve_id10() public {
        HEVM.prank(address(0xAAAA));
        sut.approve(address(0xCCCC), 10);
    }

    function test_approve_id50() public {
        HEVM.prank(address(0xAAAA));
        sut.approve(address(0xCCCC), 50);
    }

    function test_approve_id100() public {
        HEVM.prank(address(0xAAAA));
        sut.approve(address(0xCCCC), 100);
    }
}

// balanceOf
contract ERC721_K_balanceOf_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_K internal sut;

    function setUp() public {
        sut = new ERC721_K();
        sut.mint(address(0xAAAA), 1);
        sut.mint(address(0xBBBB), 10);
        sut.mint(address(0xCCCC), 50);
        sut.mint(address(0xDDDD), 100);
    }

    function test_balanceOf_1() view public {
        sut.balanceOf(address(0xAAAA));
    }

    function test_balanceOf_10() view public {
        sut.balanceOf(address(0xBBBB));
    }

    function test_balanceOf_50() view public {
        sut.balanceOf(address(0xCCCC));
    }

    function test_balanceOf_100() view public {
        sut.balanceOf(address(0xDDDD));
    }
}

contract ERC721_K_ownerOf_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_K internal sut;

    function setUp() public {
        sut = new ERC721_K();
        sut.mint(address(0xAAAA), 101);
    }

    function test_ownerOf_1() view public {
        sut.ownerOf(1);
    }

    function test_ownerOf_10() view public {
        sut.ownerOf(10);
    }

    function test_ownerOf_50() view public {
        sut.ownerOf(50);
    }

    function test_ownerOf_100() view public {
        sut.ownerOf(100);
    }
}

contract ERC721_K_getApproved_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_K internal sut;

    function setUp() public {
        sut = new ERC721_K();
        sut.mint(address(0xAAAA), 101);
    }

    function test_getApproved_1() view public {
        sut.ownerOf(1);
    }

    function test_getApproved_10() view public {
        sut.ownerOf(10);
    }

    function test_getApproved_50() view public {
        sut.ownerOf(50);
    }

    function test_getApproved_100() view public {
        sut.ownerOf(100);
    }
}

// isApprovedForAll
contract ERC721_K_isApprovedForAll_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721_K internal sut;

    function setUp() public {
        sut = new ERC721_K();
        sut.mint(address(0xAAAA), 10);
    }

    function test_isApprovedForAll() view public {
        sut.isApprovedForAll(address(0xAAAA), address(0xBBBB));
    }
}
