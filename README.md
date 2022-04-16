# ERC721 Benchmarks

Benchmarks for implementations of ERC721 contracts.

- [Open Zeppelin](https://github.com/OpenZeppelin/openzeppelin-contracts)
- [Solmate](https://github.com/rari-capital/solmate)
- [ERC721A](https://github.com/chiru-labs/ERC721A)
- [ERC721B](https://github.com/beskay/ERC721B)
- [ERC721K](https://github.com/kadenzipfel/ERC721K)

## Method used

We create a minimal implementation of each contract with a function to mint tokens with a sequential ID. Then for each test, we setup the enviroment in the `setUp` function so the gas used for setting up the test won't leak to the actual test function. The test function only use `HEVM.prank` and call the function, adding the minimum amount of noise as it is currently possible. 

All gas tests are generated via the [`test-cases.yml`](test-cases.yml) and [`templates/TestTemplate.sol`](templates/TestTemplate.sol) by using [stencil-cli](https://github.com/alephao/stencil-cli) (I'm hoping to change that since it only works on macOS D:). The tables in this README.md are generated using the [`tables.py`](tables.py) script (not great code, but it works well. quick and dirty job ;D).

We use `foundry snapshot --optimize` to get gas used on each test function.

The gas used here is not 100% accurate, you might see a different gas usage in the implementations' codebases, but we're using the same setup for all contracts and in a controled environment, so it should be good enough to be able to compare the gas usage between the implementations. I'll risk saying it's probably more accurate than what each individual codebase is showing.

## Benchmarks

Benchmarks are separated by method. Check the description of each table.

### Mint

How much gas to Mint N tokens?

#### mint

<!-- Start mint Table -->
|     Implementation     |   1  |   2  |   3  |   4  |   5  |   10  |   50  |   100  |
|------------------------|------|------|------|------|------|-------|-------|--------|
|         ERC721A        | 57255| 59251| 61237| 63233| 65121| 75030 | 153546| 251789 |
|         ERC721B        | 52121| 54358| 56585| 58822| 60951| 72065 | 160221| 270514 |
|         ERC721K        | 57243| 59239| 61225| 63221| 65109| 75018 | 153534| 251777 |
|Open Zeppelin Enumerable|146047|260426|374795|489174|603445|1175269|5749105|11466498|
|      Open Zeppelin     | 74480| 99414|124338|149272|174098| 298697|1294733| 2539876|
|         Solmate        | 74376| 99206|124026|148856|173578| 297657|1289533| 2529476|
<!-- End mint Table -->

#### safeMint

<!-- Start safeMint Table -->
|     Implementation     |   1  |   2  |   3  |   4  |   5  |   10  |   50  |   100  |
|------------------------|------|------|------|------|------|-------|-------|--------|
|         ERC721A        | 60078| 61975| 63983| 65957| 67955| 77709 | 156270| 254437 |
|         ERC721B        | 55160| 57298| 59547| 61762| 64001| 74960 | 163161| 273378 |
|         ERC721K        | 60054| 61951| 63959| 65933| 67931| 77685 | 156246| 254413 |
|Open Zeppelin Enumerable|148900|263498|378207|492882|607581|1180840|5767446|11500679|
|      Open Zeppelin     | 77422|102575|127839|153069|178323| 304357|1313163| 2574146|
|         Solmate        | 77186|102106|127137|152134|177155| 302024|1301505| 2550822|
<!-- End safeMint Table -->

### Transfer

How much gas to transfer the `nth` token id if you own all tokens from 1 to 100?

#### To a wallet that already owns a token from the collection

<!-- Start transfer_toOwner Table -->
|     Implementation     |   1  |  10  |  50  |  100 |
|------------------------|------|------|------|------|
|      Open Zeppelin     | 31458| 31481| 31525| 31503|
|Open Zeppelin Enumerable| 82911| 70634| 70678| 70656|
|         Solmate        | 28369| 28392| 28436| 28414|
|         ERC721A        | 55639| 94154|189364|308378|
|         ERC721B        |296020|274695|179859| 44137|
|         ERC721K        | 55916| 94431|189641|308655|
<!-- End transfer_toOwner Table -->

#### To a wallet that owns no token from the collection

<!-- Start transfer_toNonOwner Table -->
|     Implementation     |   1  |  10  |  50  |  100 |
|------------------------|------|------|------|------|
|      Open Zeppelin     | 48647| 48646| 48602| 48624|
|Open Zeppelin Enumerable| 80200| 82999| 82955| 82977|
|         Solmate        | 45558| 45557| 45513| 45535|
|         ERC721A        | 72828|111319|206441|325499|
|         ERC721B        |296109|274760|179836| 44158|
|         ERC721K        | 73105|111596|206718|325776|
<!-- End transfer_toNonOwner Table -->

### Approval

How much gas for `setApprovalForAll`?

<!-- Start setApprovalForAll Table -->
|     Implementation     |  -- |
|------------------------|-----|
|         ERC721A        |32571|
|         ERC721B        |32593|
|         ERC721K        |32571|
|Open Zeppelin Enumerable|32651|
|      Open Zeppelin     |32629|
|         Solmate        |32528|
<!-- End setApprovalForAll Table -->

How much gas to approve the `nth` token id if you own all tokens from 1 to 100?

<!-- Start approve Table -->
|     Implementation     |   1  |  10  |  50  |  100 |
|------------------------|------|------|------|------|
|         ERC721A        | 37500| 58869|154013|273072|
|         ERC721B        |272396|251025|156123| 37546|
|         ERC721K        | 37497| 58866|154010|273069|
|Open Zeppelin Enumerable| 35261| 35238| 35216| 35239|
|      Open Zeppelin     | 35194| 35171| 35149| 35172|
|         Solmate        | 34762| 34739| 34717| 34740|
<!-- End approve Table -->

### View methods

The gas used in the methods below are important for devs who will add on-chain integrations with contracts built using the specific implementation, not for people using the contracts.

#### balanceOf

How much gas to run balanceOf in an account with N tokens.

<!-- Start balanceOf Table -->
|     Implementation     |   1   |   10  |   50  |  100  |
|------------------------|-------|-------|-------|-------|
|         ERC721A        |  7846 |  7780 |  7825 |  7792 |
|         ERC721B        |2793572|2793641|2794286|2795003|
|         ERC721K        |  7846 |  7780 |  7825 |  7792 |
|Open Zeppelin Enumerable|  7862 |  7796 |  7841 |  7808 |
|      Open Zeppelin     |  7840 |  7774 |  7819 |  7786 |
|         Solmate        |  7840 |  7774 |  7819 |  7786 |
<!-- End balanceOf Table -->

#### ownerOf

How much gas to find the owner of a token when the owner owne n tokens and the token to find is the nth token.

<!-- Start ownerOf Table -->
|     Implementation     |   1  |  10  |  50  |  100 |
|------------------------|------|------|------|------|
|         ERC721A        | 10200| 31637|126802|245785|
|         ERC721B        |245160|223857|128976| 10322|
|         ERC721K        | 10197| 31634|126799|245782|
|Open Zeppelin Enumerable| 7744 | 7789 | 7788 | 7734 |
|      Open Zeppelin     | 7722 | 7767 | 7766 | 7712 |
|         Solmate        | 7720 | 7765 | 7764 | 7710 |
<!-- End ownerOf Table -->

#### getApproved

How much gas to find the approved address of the nth token when the onwer owns 100 tokens and there is no approved addresses.

<!-- Start getApproved Table -->
|     Implementation     |   1  |  10  |  50  |  100 |
|------------------------|------|------|------|------|
|         ERC721A        | 10245| 31614|126802|245807|
|         ERC721B        |245205|223834|128976| 10344|
|         ERC721K        | 10242| 31611|126799|245804|
|Open Zeppelin Enumerable| 7789 | 7766 | 7788 | 7756 |
|      Open Zeppelin     | 7767 | 7744 | 7766 | 7734 |
|         Solmate        | 7765 | 7742 | 7764 | 7732 |
<!-- End getApproved Table -->

## Contributing

### How to add a contract

**Dependencies**

- You'll need python 3 installed to run the scripts under the `scripts` folder
- You'll need to install [stencil-cli](https://github.com/alephao/stencil-cli). This is used to code generate the tests. Unfortunately this is currently only available on macos. Quick install: `brew install alephao/formulae/stencil` 

**Instructions**

1. Create a minimal implementation on `src/`, the contract name and file name should follow the convention `ERC721_<Variation>`.
2. Implement the following functions:

```solidity
function mint(address to, uint256 amount) external payable {
    _mint(to, amount, "", false);
}

function safeMint(address to, uint256 amount) external payable {
    _safeMint(to, amount);
}
```

3. Add an entry to the `contracts.erc721.variations` property on [test-cases.yml](test-cases.yml), following the examples there. E.g.:

```yml
contracts:
  erc721:
    variations: [OZ, OZEnumerable, Solmate, A, B, K]
```

4. Add an entry to [scripts/erc721.py](scripts/erc721.py)'s `variants` var following the examples there. It should map the variant name u used in the contract `ERC721_<Variant>` to the name you want to appear on the table. E.g.:

```python
variations = {
    "OZ": "Open Zeppelin",
    "OZEnumerable": "Open Zeppelin Enumerable",
    "Solmate": "Solmate",
    "A": "ERC721A",
    "B": "ERC721B",
    "K": "ERC721K",
}
```


5. Run the following commands:

```console
make codegen
make snapshot
make readme
```

6. Add the contract to the list at the top of this README.
