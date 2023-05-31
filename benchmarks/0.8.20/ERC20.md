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
|           Maple           |669717|
|OpenZeppelin Permit (draft)|878192|
|        OpenZeppelin       |551833|
|          Solmate          |654281|
<!-- End deploy Table -->

## Write methods

### transfer

How much gas to transfer tokens?

#### To a wallet that already owns a token

<!-- Start transferToOwner Table -->
|       Implementation      |  -- |
|---------------------------|-----|
|           Maple           |20666|
|OpenZeppelin Permit (draft)|20741|
|        OpenZeppelin       |20785|
|          Solmate          |20599|
<!-- End transferToOwner Table -->

#### To a wallet that owns no token

<!-- Start transferToNonOwner Table -->
|       Implementation      |  -- |
|---------------------------|-----|
|           Maple           |37744|
|OpenZeppelin Permit (draft)|37819|
|        OpenZeppelin       |37863|
|          Solmate          |37677|
<!-- End transferToNonOwner Table -->

### transferFrom

How much gas to transfer tokens?

#### To a wallet that already owns a token

<!-- Start transferFromToOwner Table -->
|       Implementation      |  -- |
|---------------------------|-----|
|           Maple           |28152|
|OpenZeppelin Permit (draft)|28233|
|        OpenZeppelin       |28277|
|          Solmate          |26183|
<!-- End transferFromToOwner Table -->

#### To a wallet that owns no token

<!-- Start transferFromToNonOwner Table -->
|       Implementation      |  -- |
|---------------------------|-----|
|           Maple           |45274|
|OpenZeppelin Permit (draft)|45355|
|        OpenZeppelin       |45399|
|          Solmate          |43305|
<!-- End transferFromToNonOwner Table -->

### approve

How much gas to approve an address to spend some amount of tokens?

<!-- Start approve Table -->
|       Implementation      |  -- |
|---------------------------|-----|
|           Maple           |32599|
|OpenZeppelin Permit (draft)|32676|
|        OpenZeppelin       |32653|
|          Solmate          |32548|
<!-- End approve Table -->

## View methods

How much gas to check the total supply of tokens?

### totalSupply

<!-- Start totalSupply Table -->
|       Implementation      | -- |
|---------------------------|----|
|           Maple           |7579|
|OpenZeppelin Permit (draft)|7565|
|        OpenZeppelin       |7542|
|          Solmate          |7556|
<!-- End totalSupply Table -->

### balanceOf

How much gas to check the balance of a wallet?

<!-- Start balanceOf Table -->
|       Implementation      | -- |
|---------------------------|----|
|           Maple           |7692|
|OpenZeppelin Permit (draft)|7713|
|        OpenZeppelin       |7690|
|          Solmate          |7692|
<!-- End balanceOf Table -->

### allowance

How much gas to check gow much a wallet can spend on behalf of another wallet?

<!-- Start allowance Table -->
|       Implementation      | -- |
|---------------------------|----|
|           Maple           |7927|
|OpenZeppelin Permit (draft)|7972|
|        OpenZeppelin       |7994|
|          Solmate          |7927|
<!-- End allowance Table -->
