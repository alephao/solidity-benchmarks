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
| 8091 | 32530 | 7788 | 675231 | 7487 | 45055 | 27933 | 37864 | 20793 |
| 7961 | 32524 | 7725 | 452958 | 7490 | 43266 | 26144 | 37830 | 20759 |
| 8049 | 32562 | 7747 | 833229 | 7490 | 43266 | 26144 | 37896 | 20825 |
| 8025 | 32485 | 7744 | 640959 | 7487 | 43114 | 25992 | 37764 | 20693 |
