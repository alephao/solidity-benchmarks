# ERC20 Benchmarks (WIP)

Benchmarks for implementations of the ERC20 standard.

- [Open Zeppelin](https://github.com/OpenZeppelin/openzeppelin-contracts)

### Transfer

How much gas to transfer tokens?

#### To a wallet that already owns a token from the collection

<!-- Start transferToOwner Table -->
|Implementation|  -- |
|--------------|-----|
| Open Zeppelin|20917|
<!-- End transferToOwner Table -->

#### To a wallet that owns no token from the collection

<!-- Start transferToNonOwner Table -->
|Implementation|  -- |
|--------------|-----|
| Open Zeppelin|37995|
<!-- End transferToNonOwner Table -->
