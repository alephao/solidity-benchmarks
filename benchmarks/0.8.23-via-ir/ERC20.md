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

| Implementation | approve | transferFromToOwner | transferFromToNonOwner | totalSupply | balanceOf | allowance | deploy | transferToNonOwner | transferToOwner |
| - | - | - | - | - | - | - | - | - | - |
| Solmate | 32485 | 25992 | 43114 | 7487 | 7744 | 8025 | 641359 | 37764 | 20693 |
| Maple | 32530 | 27933 | 45055 | 7487 | 7788 | 8091 | 677031 | 37864 | 20793 |
| OZPermit | 32562 | 26144 | 43266 | 7490 | 7747 | 8049 | 838842 | 37896 | 20825 |
| OZ | 32524 | 26144 | 43266 | 7490 | 7725 | 7961 | 453758 | 37830 | 20759 |
