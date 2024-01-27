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

| Implementation | transferToOwner | totalSupply | deploy | transferToNonOwner | approve | transferFromToNonOwner | balanceOf | transferFromToOwner | allowance |
| - | - | - | - | - | - | - | - | - | - |
| OZPermit | 20825 | 7490 | 836042 | 37896 | 32562 | 43266 | 7747 | 26144 | 8049 |
| Maple | 20793 | 7487 | 681038 | 37864 | 32530 | 45055 | 7788 | 27933 | 8091 |
| Solmate | 20693 | 7487 | 646771 | 37764 | 32485 | 43114 | 7744 | 25992 | 8025 |
| OZ | 20759 | 7490 | 452958 | 37830 | 32524 | 43266 | 7725 | 26144 | 7961 |
