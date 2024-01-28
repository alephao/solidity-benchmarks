import Foundation
import Prelude

typealias SolidityVersion = String
enum ERC20Method: String, CaseIterable {
    case allowance
    case approve
    case balanceOf
    case deploy
    case totalSupply
    case transferFromToNonOwner
    case transferFromToOwner
    case transferToNonOwner
    case transferToOwner
}
enum ERC20Implementation: String, CaseIterable {
    case Maple = "Maple"
    case OpenZeppelin = "OZ"
    case OpenZeppelinPermit = "OZPermit"
    case Solmate = "Solmate"
}
typealias ERC20Dict = [
    SolidityVersion: [
        ERC20Method.RawValue: [ERC20Implementation.RawValue: String]
    ]
]

struct GasSnapshots: Decodable {
    let ERC20: ERC20Dict
}

func erc20Readme(table: String) -> String {
"""
# ERC20 Benchmarks

Benchmarks for implementations of the ERC20 standard.

Note: When comparing, keep in mind that Solmate and Maple implements ERC-2612 permit so it's more fairt to compare them against OpenZeppelin Permit and not the raw OpenZeppelin implementation.

- [OpenZeppelin](https://github.com/OpenZeppelin/openzeppelin-contracts)
- [OpenZeppelin Permit](https://github.com/OpenZeppelin/openzeppelin-contracts)
- [Solmate](https://github.com/rari-capital/solmate)
- [Maple](https://github.com/maple-labs/erc20)

## Methods

### Write Methods
- [x] deploy: How much gas to deploy the contract as is?
- [x] transfer (toOwner): How much gas to transfer tokens to an account that already owns more than 0 tokens?
- [x] transfer (toNonOwner): How much gas to transfer tokens to an account that owns 0 tokens?
- [x] transferFrom (toOwner): How much gas for an operator to transfer tokens from one account to another that already owns more than 0 tokens?
- [x] transferFrom (toNonOwner): How much gas for an operator to transfer tokens from one account to another that owns 0 tokens?
- [x] approve: How much gas to approve an account to spend x amount of tokens?

### Read Methods
- [x] totalSupply: How much gas to check the total supply of tokens?
- [x] balanceOf: How much gas to check the balance of an account?
- [x] allowance: How much gas to check how many tokens an operator can spend on behalf of another account?

## Table

\(table)

"""
}

struct ReadFile {
    let path: String
}

struct WriteFile {
    let path: String
    let contents: String
}

func read(_ rf: ReadFile) -> Data { try! Data(contentsOf: URL(filePath: rf.path)) }
func write(_ wf: WriteFile) -> Void {
    try! wf.contents.write(
        to: URL(filePath: wf.path),
        atomically: true,
        encoding: .utf8
    )
}

func joinWithColumnSeparator(_ cols: [String]) -> String { cols.joined(separator: " | ") }
func joinWithLinebreak(_ lines: [String]) -> String { lines.joined(separator: "\n") }
func addTableEdge(_ str: String) -> String { "| \(str) |" }

func dictToTableComponents(_ dict: [ERC20Method.RawValue: [ERC20Implementation.RawValue: String]]) -> (head: [String], body: [String]) {
    let head = ["Implementation"] + ERC20Method.allCases.map(\.rawValue)
    let body = ERC20Implementation.allCases.flatMap { impl in
        ERC20Method.allCases.map { method in dict[method.rawValue]![impl.rawValue]! }
    }
    return (head, body)
}


func tableComponentsToString(_ components: (head: [String], body: [String])) -> String {
    [
        components.head,
        components.head |> map { _ in "-" }, // separator
        components.body
    ]
    |> map(joinWithColumnSeparator >>> addTableEdge)
    >>> joinWithLinebreak
}

func decodeGasSnapshot(data: Data) -> GasSnapshots {
    try! JSONDecoder().decode(GasSnapshots.self, from: data)
}

func erc20ReadmePath(base: String, version: String) -> String {
    "\(base)/\(version)/ERC20.md"
}

func writeERC20Readme(
    base: String
) -> (String, [ERC20Method.RawValue: [ERC20Implementation.RawValue: String]]) -> WriteFile {
    { version, dict in
        WriteFile(
            path: erc20ReadmePath(base: base, version: version),
            contents: dict
            |> dictToTableComponents
            >>> tableComponentsToString
            >>> erc20Readme
        )
    }
}

func erc20(jsonPath: String, benchmarksPath: String) {
    ReadFile(path: jsonPath)
    |> read
    >>> decodeGasSnapshot(data:)
    >>> \.ERC20
    >>> map(writeERC20Readme(base: benchmarksPath))
    >>> forEach(write)
}
