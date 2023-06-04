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
|           Maple           |734229|
|OpenZeppelin Permit (draft)|919202|
|        OpenZeppelin       |626558|
|          Solmate          |709059|
<!-- End deploy Table -->

## Write methods

### transfer

How much gas to transfer tokens?

#### To a wallet that already owns a token

<!-- Start transferToOwner Table -->
|       Implementation      |  -- |
|---------------------------|-----|
|           Maple           |20861|
|OpenZeppelin Permit (draft)|21152|
|        OpenZeppelin       |21108|
|          Solmate          |20758|
<!-- End transferToOwner Table -->

#### To a wallet that owns no token

<!-- Start transferToNonOwner Table -->
|       Implementation      |  -- |
|---------------------------|-----|
|           Maple           |37939|
|OpenZeppelin Permit (draft)|38230|
|        OpenZeppelin       |38186|
|          Solmate          |37836|
<!-- End transferToNonOwner Table -->

### transferFrom

How much gas to transfer tokens?

#### To a wallet that already owns a token

<!-- Start transferFromToOwner Table -->
|       Implementation      |  -- |
|---------------------------|-----|
|           Maple           |28009|
|OpenZeppelin Permit (draft)|28395|
|        OpenZeppelin       |28395|
|          Solmate          |26223|
<!-- End transferFromToOwner Table -->

#### To a wallet that owns no token

<!-- Start transferFromToNonOwner Table -->
|       Implementation      |  -- |
|---------------------------|-----|
|           Maple           |45123|
|OpenZeppelin Permit (draft)|45509|
|        OpenZeppelin       |45509|
|          Solmate          |43337|
<!-- End transferFromToNonOwner Table -->

### approve

How much gas to approve an address to spend some amount of tokens?

<!-- Start approve Table -->
|       Implementation      |  -- |
|---------------------------|-----|
|           Maple           |32655|
|OpenZeppelin Permit (draft)|32777|
|        OpenZeppelin       |32777|
|          Solmate          |32633|
<!-- End approve Table -->

## View methods

How much gas to check the total supply of tokens?

### totalSupply

<!-- Start totalSupply Table -->
|       Implementation      | -- |
|---------------------------|----|
|           Maple           |7507|
|OpenZeppelin Permit (draft)|7507|
|        OpenZeppelin       |7507|
|          Solmate          |7507|
<!-- End totalSupply Table -->

### balanceOf

How much gas to check the balance of a wallet?

<!-- Start balanceOf Table -->
|       Implementation      | -- |
|---------------------------|----|
|           Maple           |7808|
|OpenZeppelin Permit (draft)|7786|
|        OpenZeppelin       |7764|
|          Solmate          |7764|
<!-- End balanceOf Table -->

### allowance

How much gas to check gow much a wallet can spend on behalf of another wallet?

<!-- Start allowance Table -->
|       Implementation      | -- |
|---------------------------|----|
|           Maple           |8148|
|OpenZeppelin Permit (draft)|8126|
|        OpenZeppelin       |8060|
|          Solmate          |8082|
<!-- End allowance Table -->
