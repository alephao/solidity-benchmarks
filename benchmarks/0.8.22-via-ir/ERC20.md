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

| Implementation | transferToOwner | deploy | allowance | transferToNonOwner | transferFromToOwner | approve | balanceOf | transferFromToNonOwner | totalSupply |
| - | - | - | - | - | - | - | - | - | - |
| OZ | 20759 | 453758 | 7961 | 37830 | 26144 | 32524 | 7725 | 43266 | 7490 |
| OZPermit | 20825 | 838842 | 8049 | 37896 | 26144 | 32562 | 7747 | 43266 | 7490 |
| Solmate | 20693 | 641359 | 8025 | 37764 | 25992 | 32485 | 7744 | 43114 | 7487 |
| Maple | 20793 | 677031 | 8091 | 37864 | 27933 | 32530 | 7788 | 45055 | 7487 |
