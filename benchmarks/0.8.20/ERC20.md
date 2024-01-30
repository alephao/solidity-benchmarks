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

| Implementation | allowance | approve | balanceOf | deploy | totalSupply | transferFromToNonOwner | transferFromToOwner | transferToNonOwner | transferToOwner |
| - | - | - | - | - | - | - | - | - | - |
| 7927 | 32599 | 7692 | 669717 | 7579 | 45274 | 28152 | 37744 | 20666 |
| 7960 | 32764 | 7690 | 463064 | 7542 | 43739 | 26617 | 38013 | 20935 |
| 7960 | 32787 | 7691 | 869640 | 7565 | 43695 | 26573 | 37991 | 20913 |
| 7927 | 32548 | 7692 | 654281 | 7556 | 43305 | 26183 | 37677 | 20599 |
