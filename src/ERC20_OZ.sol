// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.4;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ERC20_OZ is ERC20 {
    constructor() ERC20("Token", "TK") {}

    function mint(address to, uint256 amount) external {
        _mint(to, amount);
    }
}
