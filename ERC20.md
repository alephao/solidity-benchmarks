# ERC20 Benchmarks

Benchmarks for implementations of the ERC20 standard.

- [Open Zeppelin](https://github.com/OpenZeppelin/openzeppelin-contracts)
- [Open Zeppelin Permit](https://github.com/OpenZeppelin/openzeppelin-contracts)
- [Solmate](https://github.com/rari-capital/solmate)
- [Maple](https://github.com/maple-labs/erc20) * using [this fork](http://github.com/alephao/erc20) instead of the original codebase until [this PR](https://github.com/maple-labs/erc20/pull/42) is merged

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
|            Maple           |672309|
|Open Zeppelin Permit (draft)|926489|
|        Open Zeppelin       |568857|
|           Solmate          |656844|
<!-- End deploy Table -->

## Write methods

### transfer

How much gas to transfer tokens?

#### To a wallet that already owns a token

<!-- Start transferToOwner Table -->
|       Implementation       |  -- |
|----------------------------|-----|
|            Maple           |20657|
|Open Zeppelin Permit (draft)|20873|
|        Open Zeppelin       |20917|
|           Solmate          |20590|
<!-- End transferToOwner Table -->

#### To a wallet that owns no token

<!-- Start transferToNonOwner Table -->
|       Implementation       |  -- |
|----------------------------|-----|
|            Maple           |37735|
|Open Zeppelin Permit (draft)|37951|
|        Open Zeppelin       |37995|
|           Solmate          |37668|
<!-- End transferToNonOwner Table -->

### transferFrom

How much gas to transfer tokens?

#### To a wallet that already owns a token

<!-- Start transferFromToOwner Table -->
|       Implementation       |  -- |
|----------------------------|-----|
|            Maple           |28136|
|Open Zeppelin Permit (draft)|28369|
|        Open Zeppelin       |28413|
|           Solmate          |26167|
<!-- End transferFromToOwner Table -->

#### To a wallet that owns no token

<!-- Start transferFromToNonOwner Table -->
|       Implementation       |  -- |
|----------------------------|-----|
|            Maple           |45258|
|Open Zeppelin Permit (draft)|45491|
|        Open Zeppelin       |45535|
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
