# ERC20 Benchmarks

Benchmarks for implementations of the ERC20 standard.

Note: When comparing, keep in mind that Solmate and Maple implements ERC-2612 permit so it's more fairt to compare them against OpenZeppelin Permit and not the raw OpenZeppelin implementation.

- [OpenZeppelin](https://github.com/OpenZeppelin/openzeppelin-contracts)
- [OpenZeppelin Permit](https://github.com/OpenZeppelin/openzeppelin-contracts)
- [Solmate](https://github.com/rari-capital/solmate)
- [Maple](https://github.com/maple-labs/erc20)

## Methods

### Write Methods
- [x] deploy: How much gas to deploy the contract as is?
- [x] transfer (toOwner): How much gas to transfer tokens to an account that already owns more than 0 tokens?
- [x] transfer (toNonOwner): How much gas to transfer tokens to an account that owns 0 tokens?
- [x] transferFrom (toOwner): How much gas for an operator to transfer tokens from one account to another that already owns more than 0 tokens?
- [x] transferFrom (toNonOwner): How much gas for an operator to transfer tokens from one account to another that owns 0 tokens?
- [x] approve: How much gas to approve an account to spend x amount of tokens?

### Read Methods
- [x] totalSupply: How much gas to check the total supply of tokens?
- [x] balanceOf: How much gas to check the balance of an account?
- [x] allowance: How much gas to check how many tokens an operator can spend on behalf of another account?

## Table

| Implementation | allowance | transferFromToOwner | transferToOwner | transferToNonOwner | approve | deploy | balanceOf | transferFromToNonOwner | totalSupply |
| - | - | - | - | - | - | - | - | - | - |
| OZ | 7960 | 26617 | 20935 | 38013 | 32764 | 463270 | 7690 | 43739 | 7542 |
| OZPermit | 7960 | 26573 | 20913 | 37991 | 32787 | 870240 | 7691 | 43695 | 7565 |
| Solmate | 7927 | 26183 | 20599 | 37677 | 32548 | 654881 | 7692 | 43305 | 7556 |
| Maple | 7927 | 28152 | 20666 | 37744 | 32599 | 670317 | 7692 | 45274 | 7579 |
