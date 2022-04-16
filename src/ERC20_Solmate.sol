// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.4;

import {ERC20} from "@solmate/tokens/ERC20.sol";

contract ERC20_Solmate is ERC20 {
    constructor() ERC20("Token", "TK", 18) {}

    function mint(address to, uint256 amount) external {
        _mint(to, amount);
    }
}
