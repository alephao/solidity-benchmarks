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

| Implementation | approve | totalSupply | deploy | balanceOf | transferToNonOwner | allowance | transferToOwner | transferFromToNonOwner | transferFromToOwner |
| - | - | - | - | - | - | - | - | - | - |
| OZPermit | 32562 | 7490 | 833229 | 7747 | 37896 | 8049 | 20825 | 43266 | 26144 |
| OZ | 32524 | 7490 | 452958 | 7725 | 37830 | 7961 | 20759 | 43266 | 26144 |
| Solmate | 32485 | 7487 | 640959 | 7744 | 37764 | 8025 | 20693 | 43114 | 25992 |
| Maple | 32530 | 7487 | 675231 | 7788 | 37864 | 8091 | 20793 | 45055 | 27933 |
