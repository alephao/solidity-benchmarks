# ERC20 Benchmarks

Benchmarks for implementations of the ERC20 standard.

Note: When comparing, keep in mind that Solmate and Maple implements ERC-2612 permit so it's more fairt to compare them against Open Zeppelin Permit and not the raw Open Zeppelin implementation.

- [Open Zeppelin](https://github.com/OpenZeppelin/openzeppelin-contracts)
- [Open Zeppelin Permit](https://github.com/OpenZeppelin/openzeppelin-contracts)
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
|       Implementation       |  --  |
|----------------------------|------|
|            Maple           |671903|
|Open Zeppelin Permit (draft)|880591|
|        Open Zeppelin       |553819|
|           Solmate          |656435|
<!-- End deploy Table -->

## Write methods

### transfer

How much gas to transfer tokens?

#### To a wallet that already owns a token

<!-- Start transferToOwner Table -->
|       Implementation       |  -- |
|----------------------------|-----|
|            Maple           |20657|
|Open Zeppelin Permit (draft)|20737|
|        Open Zeppelin       |20781|
|           Solmate          |20590|
<!-- End transferToOwner Table -->

#### To a wallet that owns no token

<!-- Start transferToNonOwner Table -->
|       Implementation       |  -- |
|----------------------------|-----|
|            Maple           |37735|
|Open Zeppelin Permit (draft)|37815|
|        Open Zeppelin       |37859|
|           Solmate          |37668|
<!-- End transferToNonOwner Table -->

### transferFrom

How much gas to transfer tokens?

#### To a wallet that already owns a token

<!-- Start transferFromToOwner Table -->
|       Implementation       |  -- |
|----------------------------|-----|
|            Maple           |28136|
|Open Zeppelin Permit (draft)|28233|
|        Open Zeppelin       |28277|
|           Solmate          |26167|
<!-- End transferFromToOwner Table -->

#### To a wallet that owns no token

<!-- Start transferFromToNonOwner Table -->
|       Implementation       |  -- |
|----------------------------|-----|
|            Maple           |45258|
|Open Zeppelin Permit (draft)|45355|
|        Open Zeppelin       |45399|
|           Solmate          |43289|
<!-- End transferFromToNonOwner Table -->

### approve

How much gas to approve an address to spend some amount of tokens?

<!-- Start approve Table -->
|       Implementation       |  -- |
|----------------------------|-----|
|            Maple           |32598|
|Open Zeppelin Permit (draft)|32672|
|        Open Zeppelin       |32649|
|           Solmate          |32547|
<!-- End approve Table -->

## View methods

How much gas to check the total supply of tokens?

### totalSupply

<!-- Start totalSupply Table -->
|       Implementation       | -- |
|----------------------------|----|
|            Maple           |7579|
|Open Zeppelin Permit (draft)|7565|
|        Open Zeppelin       |7542|
|           Solmate          |7556|
<!-- End totalSupply Table -->

### balanceOf

How much gas to check the balance of a wallet?

<!-- Start balanceOf Table -->
|       Implementation       | -- |
|----------------------------|----|
|            Maple           |7692|
|Open Zeppelin Permit (draft)|7713|
|        Open Zeppelin       |7690|
|           Solmate          |7692|
<!-- End balanceOf Table -->

### allowance

How much gas to check gow much a wallet can spend on behalf of another wallet?

<!-- Start allowance Table -->
|       Implementation       | -- |
|----------------------------|----|
|            Maple           |7927|
|Open Zeppelin Permit (draft)|7972|
|        Open Zeppelin       |7994|
|           Solmate          |7927|
<!-- End allowance Table -->
