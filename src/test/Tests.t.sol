// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

import {DSTest} from "@ds-test/test.sol";
import {Vm} from "@forge-std/Vm.sol";
import { ERC721OZMinimal } from "$/ERC721OZMinimal.sol";
import { ERC721AMinimal } from "$/ERC721AMinimal.sol";

contract ERC721OZMintTest is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721OZMinimal internal sut;

    function setUp() public {
        sut = new ERC721OZMinimal();
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

contract ERC721OZTransferTest is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721OZMinimal internal sut;

    function setUp() public {
        sut = new ERC721OZMinimal();
        sut.mint(address(0xAAAA), 100);
        sut.mint(address(0xBBBB), 100);
    }

    function test_transfer_toOwner_id1() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xBBBB), 1);
    }

    function test_transfer_toNonOwner_id1() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xCCCC), 1);
    }
    function test_transfer_toOwner_id10() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xBBBB), 10);
    }

    function test_transfer_toNonOwner_id10() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xCCCC), 10);
    }
    function test_transfer_toOwner_id50() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xBBBB), 50);
    }

    function test_transfer_toNonOwner_id50() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xCCCC), 50);
    }
    function test_transfer_toOwner_id100() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xBBBB), 100);
    }

    function test_transfer_toNonOwner_id100() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xCCCC), 100);
    }
}

contract ERC721AMintTest is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721AMinimal internal sut;

    function setUp() public {
        sut = new ERC721AMinimal();
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

contract ERC721ATransferTest is DSTest {
    Vm internal constant HEVM = Vm(HEVM_ADDRESS);

    ERC721AMinimal internal sut;

    function setUp() public {
        sut = new ERC721AMinimal();
        sut.mint(address(0xAAAA), 100);
        sut.mint(address(0xBBBB), 100);
    }

    function test_transfer_toOwner_id1() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xBBBB), 1);
    }

    function test_transfer_toNonOwner_id1() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xCCCC), 1);
    }
    function test_transfer_toOwner_id10() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xBBBB), 10);
    }

    function test_transfer_toNonOwner_id10() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xCCCC), 10);
    }
    function test_transfer_toOwner_id50() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xBBBB), 50);
    }

    function test_transfer_toNonOwner_id50() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xCCCC), 50);
    }
    function test_transfer_toOwner_id100() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xBBBB), 100);
    }

    function test_transfer_toNonOwner_id100() public {
        HEVM.prank(address(0xAAAA));
        sut.transferFrom(address(0xAAAA), address(0xCCCC), 100);
    }
}

