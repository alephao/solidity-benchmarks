# ERC20 Benchmarks

Benchmarks for implementations of the ERC20 standard.

Note: When comparing, keep in mind that Solmate and Maple implements ERC-2612 permit so it's more fairt to compare them against OpenZeppelin Permit and not the raw OpenZeppelin implementation.

- [OpenZeppelin](https://github.com/OpenZeppelin/openzeppelin-contracts)
- [OpenZeppelin Permit](https://github.com/OpenZeppelin/openzeppelin-contracts)
- [Solmate](https://github.com/rari-capital/solmate)
- [Maple](https://github.com/maple-labs/erc20)

## Methods TODO

- [x] deploy
- [x] transfer
- [x] transferFrom
- [x] approve
- [x] totalSupply
- [x] balanceOf
- [x] allowance

## Deployment

How much gas to deploy the contract as is?

<!-- Start deploy Table -->
|    Implementation    |  --  |
|----------------------|------|
|         Maple        |681038|
|OpenZeppelin v5 Permit|836042|
|    OpenZeppelin v5   |452958|
|        Solmate       |646771|
<!-- End deploy Table -->

## Write methods

### transfer

How much gas to transfer tokens?

#### To a wallet that already owns a token

<!-- Start transferToOwner Table -->
|    Implementation    |  -- |
|----------------------|-----|
|         Maple        |20793|
|OpenZeppelin v5 Permit|20825|
|    OpenZeppelin v5   |20759|
|        Solmate       |20693|
<!-- End transferToOwner Table -->

#### To a wallet that owns no token

<!-- Start transferToNonOwner Table -->
|    Implementation    |  -- |
|----------------------|-----|
|         Maple        |37864|
|OpenZeppelin v5 Permit|37896|
|    OpenZeppelin v5   |37830|
|        Solmate       |37764|
<!-- End transferToNonOwner Table -->

### transferFrom

How much gas to transfer tokens?

#### To a wallet that already owns a token

<!-- Start transferFromToOwner Table -->
|    Implementation    |  -- |
|----------------------|-----|
|         Maple        |27933|
|OpenZeppelin v5 Permit|26144|
|    OpenZeppelin v5   |26144|
|        Solmate       |25992|
<!-- End transferFromToOwner Table -->

#### To a wallet that owns no token

<!-- Start transferFromToNonOwner Table -->
|    Implementation    |  -- |
|----------------------|-----|
|         Maple        |45055|
|OpenZeppelin v5 Permit|43266|
|    OpenZeppelin v5   |43266|
|        Solmate       |43114|
<!-- End transferFromToNonOwner Table -->

### approve

How much gas to approve an address to spend some amount of tokens?

<!-- Start approve Table -->
|    Implementation    |  -- |
|----------------------|-----|
|         Maple        |32530|
|OpenZeppelin v5 Permit|32562|
|    OpenZeppelin v5   |32524|
|        Solmate       |32485|
<!-- End approve Table -->

## View methods

How much gas to check the total supply of tokens?

### totalSupply

<!-- Start totalSupply Table -->
|    Implementation    | -- |
|----------------------|----|
|         Maple        |7487|
|OpenZeppelin v5 Permit|7490|
|    OpenZeppelin v5   |7490|
|        Solmate       |7487|
<!-- End totalSupply Table -->

### balanceOf

How much gas to check the balance of a wallet?

<!-- Start balanceOf Table -->
|    Implementation    | -- |
|----------------------|----|
|         Maple        |7788|
|OpenZeppelin v5 Permit|7747|
|    OpenZeppelin v5   |7725|
|        Solmate       |7744|
<!-- End balanceOf Table -->

### allowance

How much gas to check gow much a wallet can spend on behalf of another wallet?

<!-- Start allowance Table -->
|    Implementation    | -- |
|----------------------|----|
|         Maple        |8091|
|OpenZeppelin v5 Permit|8049|
|    OpenZeppelin v5   |7961|
|        Solmate       |8025|
<!-- End allowance Table -->
