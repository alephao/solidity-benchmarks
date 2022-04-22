# ERC20 Benchmarks

Benchmarks for implementations of the ERC20 standard.

- [Open Zeppelin](https://github.com/OpenZeppelin/openzeppelin-contracts)
- [Solmate](https://github.com/rari-capital/solmate)

## Methods TODO

- [x] transfer
- [x] transferFrom
- [x] approve
- [x] totalSupply
- [x] balanceOf
- [ ] allowance

## Write methods

### transfer

How much gas to transfer tokens?

#### To a wallet that already owns a token

<!-- Start transferToOwner Table -->
|Implementation|  -- |
|--------------|-----|
| Open Zeppelin|20917|
|    Solmate   |20590|
<!-- End transferToOwner Table -->

#### To a wallet that owns no token

<!-- Start transferToNonOwner Table -->
|Implementation|  -- |
|--------------|-----|
| Open Zeppelin|37995|
|    Solmate   |37668|
<!-- End transferToNonOwner Table -->

### transferFrom

How much gas to transfer tokens?

#### To a wallet that already owns a token

<!-- Start transferFromToOwner Table -->
|Implementation|  -- |
|--------------|-----|
| Open Zeppelin|28413|
|    Solmate   |26167|
<!-- End transferFromToOwner Table -->

#### To a wallet that owns no token

<!-- Start transferFromToNonOwner Table -->
|Implementation|  -- |
|--------------|-----|
| Open Zeppelin|45535|
|    Solmate   |43289|
<!-- End transferFromToNonOwner Table -->

### approve

<!-- Start approve Table -->
|Implementation|  -- |
|--------------|-----|
| Open Zeppelin|32649|
|    Solmate   |32547|
<!-- End approve Table -->

## View methods

### totalSupply

<!-- Start totalSupply Table -->
|Implementation| -- |
|--------------|----|
| Open Zeppelin|7542|
|    Solmate   |7556|
<!-- End totalSupply Table -->

### balanceOf

<!-- Start balanceOf Table -->
|Implementation| -- |
|--------------|----|
| Open Zeppelin|7690|
|    Solmate   |7692|
<!-- End balanceOf Table -->

### allowance

<!-- Start allowance Table -->
TBD
<!-- End allowance Table -->


