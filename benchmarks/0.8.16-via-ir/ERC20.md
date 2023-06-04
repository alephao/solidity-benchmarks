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
|       Implementation      |  --  |
|---------------------------|------|
|           Maple           |675434|
|OpenZeppelin Permit (draft)|845481|
|        OpenZeppelin       |564376|
|          Solmate          |640162|
<!-- End deploy Table -->

## Write methods

### transfer

How much gas to transfer tokens?

#### To a wallet that already owns a token

<!-- Start transferToOwner Table -->
|       Implementation      |  -- |
|---------------------------|-----|
|           Maple           |20785|
|OpenZeppelin Permit (draft)|20828|
|        OpenZeppelin       |20784|
|          Solmate          |20685|
<!-- End transferToOwner Table -->

#### To a wallet that owns no token

<!-- Start transferToNonOwner Table -->
|       Implementation      |  -- |
|---------------------------|-----|
|           Maple           |37843|
|OpenZeppelin Permit (draft)|37886|
|        OpenZeppelin       |37842|
|          Solmate          |37743|
<!-- End transferToNonOwner Table -->

### transferFrom

How much gas to transfer tokens?

#### To a wallet that already owns a token

<!-- Start transferFromToOwner Table -->
|       Implementation      |  -- |
|---------------------------|-----|
|           Maple           |27925|
|OpenZeppelin Permit (draft)|27977|
|        OpenZeppelin       |27977|
|          Solmate          |25984|
<!-- End transferFromToOwner Table -->

#### To a wallet that owns no token

<!-- Start transferFromToNonOwner Table -->
|       Implementation      |  -- |
|---------------------------|-----|
|           Maple           |45047|
|OpenZeppelin Permit (draft)|45099|
|        OpenZeppelin       |45099|
|          Solmate          |43106|
<!-- End transferFromToNonOwner Table -->

### approve

How much gas to approve an address to spend some amount of tokens?

<!-- Start approve Table -->
|       Implementation      |  -- |
|---------------------------|-----|
|           Maple           |32509|
|OpenZeppelin Permit (draft)|32541|
|        OpenZeppelin       |32541|
|          Solmate          |32464|
<!-- End approve Table -->

## View methods

How much gas to check the total supply of tokens?

### totalSupply

<!-- Start totalSupply Table -->
|       Implementation      | -- |
|---------------------------|----|
|           Maple           |7479|
|OpenZeppelin Permit (draft)|7482|
|        OpenZeppelin       |7482|
|          Solmate          |7479|
<!-- End totalSupply Table -->

### balanceOf

How much gas to check the balance of a wallet?

<!-- Start balanceOf Table -->
|       Implementation      | -- |
|---------------------------|----|
|           Maple           |7780|
|OpenZeppelin Permit (draft)|7761|
|        OpenZeppelin       |7739|
|          Solmate          |7736|
<!-- End balanceOf Table -->

### allowance

How much gas to check gow much a wallet can spend on behalf of another wallet?

<!-- Start allowance Table -->
|       Implementation      | -- |
|---------------------------|----|
|           Maple           |8083|
|OpenZeppelin Permit (draft)|8063|
|        OpenZeppelin       |7997|
|          Solmate          |8017|
<!-- End allowance Table -->
