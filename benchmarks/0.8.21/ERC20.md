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

| Implementation | transferFromToNonOwner | transferToNonOwner | transferToOwner | allowance | balanceOf | transferFromToOwner | totalSupply | approve | deploy |
| - | - | - | - | - | - | - | - | - | - |
| Maple | 45274 | 37744 | 20666 | 7927 | 7692 | 28152 | 7579 | 32599 | 669717 |
| OZPermit | 43695 | 37991 | 20913 | 7960 | 7691 | 26573 | 7565 | 32787 | 869640 |
| OZ | 43739 | 38013 | 20935 | 7960 | 7690 | 26617 | 7542 | 32764 | 463064 |
| Solmate | 43305 | 37677 | 20599 | 7927 | 7692 | 26183 | 7556 | 32548 | 654281 |
