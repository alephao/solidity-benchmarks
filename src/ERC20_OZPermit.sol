// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.4;

import {ERC20, ERC20Permit} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";

contract ERC20_OZPermit is ERC20, ERC20Permit {
    constructor() ERC20("Token", "TK") ERC20Permit("Token") {}

    function mint(address to, uint256 amount) external {
        _mint(to, amount);
    }
}
