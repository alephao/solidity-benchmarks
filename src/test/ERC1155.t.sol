// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.4;

import {DSTest} from "@ds-test/test.sol";
import {Vm} from "@forge-std/Vm.sol";
import {ERC1155_OZ} from "$/ERC1155_OZ.sol";
import {ERC1155_Solmate} from "$/ERC1155_Solmate.sol";

// deploy
contract ERC1155_OZ_deploy_Test is DSTest {
    function test_deploy() public {
        ERC1155_OZ sut = new ERC1155_OZ();
    }
}

// mint
contract ERC1155_OZ_mint_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC1155_OZ internal sut;

    function setUp() public {
        sut = new ERC1155_OZ();
    }

    function test_mint() public {
        sut.mint(address(0xAAAA), 1, 1);
    }
}

// mintBatch
contract ERC1155_OZ_mintBatch_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC1155_OZ internal sut;

    function setUp() public {
        sut = new ERC1155_OZ();
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
        ids[5] = 6;
        ids[6] = 7;
        ids[7] = 8;
        ids[8] = 9;
        ids[9] = 10;

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

// safeTransferFrom
contract ERC1155_OZ_safeTransferFrom_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC1155_OZ internal sut;

    function setUp() public {
        sut = new ERC1155_OZ();
        sut.mint(address(0xAAAA), 1, 1);
    }

    function test_safeTransferFrom() public {
        HEVM.prank(address(0xAAAA));
        sut.safeTransferFrom(address(0xAAAA), address(0xBBBB), 1, 1, "");
    }
}

// deploy
contract ERC1155_Solmate_deploy_Test is DSTest {
    function test_deploy() public {
        ERC1155_Solmate sut = new ERC1155_Solmate();
    }
}

// mint
contract ERC1155_Solmate_mint_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC1155_Solmate internal sut;

    function setUp() public {
        sut = new ERC1155_Solmate();
    }

    function test_mint() public {
        sut.mint(address(0xAAAA), 1, 1);
    }
}

// mintBatch
contract ERC1155_Solmate_mintBatch_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC1155_Solmate internal sut;

    function setUp() public {
        sut = new ERC1155_Solmate();
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
        ids[5] = 6;
        ids[6] = 7;
        ids[7] = 8;
        ids[8] = 9;
        ids[9] = 10;

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

// safeTransferFrom
contract ERC1155_Solmate_safeTransferFrom_Test is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC1155_Solmate internal sut;

    function setUp() public {
        sut = new ERC1155_Solmate();
        sut.mint(address(0xAAAA), 1, 1);
    }

    function test_safeTransferFrom() public {
        HEVM.prank(address(0xAAAA));
        sut.safeTransferFrom(address(0xAAAA), address(0xBBBB), 1, 1, "");
    }
}
