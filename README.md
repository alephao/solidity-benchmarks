# ERC721 Benchmarks

Benchmarks for implementations of ERC721 contracts.

- [Open Zeppelin](https://github.com/OpenZeppelin/openzeppelin-contracts)
- [Solmate](https://github.com/rari-capital/solmate)
- [ERC721A](https://github.com/chiru-labs/ERC721A)
- [ERC721B](https://github.com/beskay/ERC721B)

## Benchmarks

Benchmarks are separated by method. Check the description of each table.

### Mint

How much gas to Mint N tokens?

<!-- Start Mint Table -->

| Implementation | 1     | 2     | 3      | 4      | 5      | 10     | 50      | 100     |
| -------------- | ----- | ----- | ------ | ------ | ------ | ------ | ------- | ------- |
| Open Zeppelin  | 74480 | 99414 | 124338 | 149272 | 174098 | 298697 | 1294733 | 2539876 |
| Solmate        | 74376 | 99206 | 124026 | 148856 | 173578 | 297657 | 1289533 | 2529476 |
| ERC721A        | 57277 | 59273 | 61259  | 63255  | 65143  | 75052  | 153568  | 251811  |
| ERC721B        | 52121 | 54358 | 56585  | 58822  | 60951  | 72065  | 160221  | 270514  |
| ERC721K        | 47965 | 49961 | 51947  | 53943  | 55831  | 65740  | 144256  | 242499  |

<!-- End Mint Table -->

### Transfer

How much gas to transfer the `nth` token id if you own all tokens from 1 to 100?

#### To a wallet that already owns a token from the collection

<!-- Start Transfer Owner Table -->

| Implementation | 1      | 10     | 50     | 100    |
| -------------- | ------ | ------ | ------ | ------ |
| Open Zeppelin  | 31458  | 31481  | 31525  | 31503  |
| Solmate        | 28369  | 28392  | 28436  | 28414  |
| ERC721A        | 55661  | 94176  | 189386 | 308400 |
| ERC721B        | 296020 | 274695 | 179859 | 44137  |
| ERC721K        | 35038  | 76353  | 171563 | 290577 |

<!-- End Transfer Owner Table -->

#### To a wallet that owns no token from the collection

<!-- Start Transfer Non Owner Table -->

| Implementation | 1      | 10     | 50     | 100    |
| -------------- | ------ | ------ | ------ | ------ |
| Open Zeppelin  | 48647  | 48646  | 48602  | 48624  |
| Solmate        | 45558  | 45557  | 45513  | 45535  |
| ERC721A        | 72850  | 111341 | 206463 | 325521 |
| ERC721B        | 296109 | 274760 | 179836 | 44158  |
| ERC721K        | 57027  | 98318  | 193440 | 312498 |

<!-- End Transfer Non Owner Table -->

### Approval

How much gas for `setApprovalForAll`?

<!-- Start setApprovalForAll Table -->

| Implementation | \_    |
| -------------- | ----- |
| Open Zeppelin  | 32651 |
| Solmate        | 32550 |
| ERC721A        | 32593 |
| ERC721B        | 32615 |
| ERC721K        | 28093 |

<!-- End setApprovalForAll Table -->

How much gas to approve the `nth` token id if you own all tokens from 1 to 100?

<!-- Start approve Table -->

| Implementation | 1      | 10     | 50     | 100    |
| -------------- | ------ | ------ | ------ | ------ |
| Open Zeppelin  | 35194  | 35149  | 35216  | 35172  |
| Solmate        | 34762  | 34717  | 34784  | 34740  |
| ERC721A        | 37433  | 58780  | 154013 | 273005 |
| ERC721B        | 272396 | 251003 | 156190 | 37546  |
| ERC721K        | 28930  | 50277  | 145510 | 264502 |

<!-- End approve Table -->

## Contributing

### How to add a contract

Create a minimal implementation on `src/`, the contract name and file name should follow the convention `ERC721<Variation>Minimal`.

The implementation should implement the interface common in all contracts, currently, the interface is:

```solidity
function mint(address to, uint256 amount) external payable
```

Then add an entry to the `contracts` property on [test-cases.yml](test-cases.yml).

Then run:

```console
make codegen
make snapshot
make readme
```
