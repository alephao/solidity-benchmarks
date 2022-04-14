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

<!-- Start Mint Table -->
|Implementation|  1  |  2  |   3  |   4  |   5  |  10  |   50  |  100  |
|--------------|-----|-----|------|------|------|------|-------|-------|
| Open Zeppelin|74565|99466|124412|149337|174194|298682|1294807|2539883|
|    Solmate   |74461|99258|124100|148921|173674|297642|1289607|2529483|
|    ERC721A   |57340|59303| 61311| 63298| 65217| 75015| 153620| 251796|
|    ERC721B   |52206|54410| 56659| 58887| 61047| 72050| 160295| 270521|
|    ERC721K   |57328|59291| 61299| 63286| 65205| 75003| 153608| 251784|
<!-- End Mint Table -->

#### safeMint

<!-- Start safeMint Table -->
|Implementation|  1  |   2  |   3  |   4  |   5  |  10  |   50  |  100  |
|--------------|-----|------|------|------|------|------|-------|-------|
| Open Zeppelin|77429|102715|127890|153155|178374|304386|1313258|2574252|
|    Solmate   |77193|102246|127188|152220|177206|302053|1301600|2550928|
|    ERC721A   |60085| 62115| 64034| 66043| 68006| 77738| 156365| 254543|
|    ERC721B   |55167| 57438| 59598| 61848| 64052| 74989| 163256| 273484|
|    ERC721K   |60061| 62091| 64010| 66019| 67982| 77714| 156341| 254519|
<!-- End safeMint Table -->

### Transfer

How much gas to transfer the `nth` token id if you own all tokens from 1 to 100?

#### To a wallet that already owns a token from the collection

<!-- Start Transfer Owner Table -->
|Implementation|   1  |  10  |  50  |  100 |
|--------------|------|------|------|------|
| Open Zeppelin| 31458| 31481| 31525| 31503|
|    Solmate   | 28369| 28392| 28436| 28414|
|    ERC721A   | 55639| 94154|189364|308378|
|    ERC721B   |296020|274695|179859| 44137|
|    ERC721K   | 55916| 94431|189641|308655|
<!-- End Transfer Owner Table -->

#### To a wallet that owns no token from the collection

<!-- Start Transfer Non Owner Table -->
|Implementation|   1  |  10  |  50  |  100 |
|--------------|------|------|------|------|
| Open Zeppelin| 48647| 48646| 48602| 48624|
|    Solmate   | 45558| 45557| 45513| 45535|
|    ERC721A   | 72828|111319|206441|325499|
|    ERC721B   |296109|274760|179836| 44158|
|    ERC721K   | 73105|111596|206718|325776|
<!-- End Transfer Non Owner Table -->

### Approval

How much gas for `setApprovalForAll`?

<!-- Start setApprovalForAll Table -->
|Implementation|  _  |
|--------------|-----|
| Open Zeppelin|32651|
|    Solmate   |32550|
|    ERC721A   |32593|
|    ERC721B   |32615|
|    ERC721K   |32593|
<!-- End setApprovalForAll Table -->

How much gas to approve the `nth` token id if you own all tokens from 1 to 100?

<!-- Start approve Table -->
|Implementation|   1  |  10  |  50  |  100 |
|--------------|------|------|------|------|
| Open Zeppelin| 35194| 35149| 35216| 35172|
|    Solmate   | 34762| 34717| 34784| 34740|
|    ERC721A   | 37500| 58847|154080|273072|
|    ERC721B   |272396|251003|156190| 37546|
|    ERC721K   | 37497| 58844|154077|273069|
<!-- End approve Table -->

## Contributing

### How to add a contract

1. Create a minimal implementation on `src/`, the contract name and file name should follow the convention `ERC721<Variation>Minimal`.
2. Implement the mint interface `function mint(address to, uint256 amount) external payable`
3. Add an entry to the `contracts` property on [test-cases.yml](test-cases.yml), following the examples there. E.g.:

```yml
contracts:
  - name: ERC721XMinimal
    type: ERC721X
```

4. Add an entry to [tables.py](tables.py)'s `variants` var following the examples there. E.g.:

```py
{
    "name": "ERC721X",
    "short": "X"
}
```


5. Run the following commands:

```console
make codegen
make snapshot
make readme
```

6. Add the contract to the list at the top of this README.
