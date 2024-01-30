import Foundation
import Prelude

public func generateERC20Readmes(jsonPath: String, benchmarksPath: String) throws {
    ReadFile(path: jsonPath)
    |> read
    >>> decodeGasSnapshot(data:)
    >>> \.ERC20
    >>> map(ERC20.writeERC20Readme(base: benchmarksPath))
    >>> forEach(write)
}

enum ERC20 {
    enum Method: String, CaseIterable {
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

    enum Implementation: String, CaseIterable {
        case Maple = "Maple"
        case OpenZeppelin = "OZ"
        case OpenZeppelinPermit = "OZPermit"
        case Solmate = "Solmate"
    }

    typealias Dict = [
        SolidityVersion: [
            Method.RawValue: [Implementation.RawValue: String]
        ]
    ]

    static func readmePath(base: String, version: SolidityVersion) -> String {
        "\(base)/\(version)/ERC20.md"
    }

    static func readmeMarkdown(_ table: String) -> String {
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

    static func dictToTableComponents(_ dict: [Method.RawValue: [Implementation.RawValue: String]]) -> (head: [String], body: [[String]]) {
        let head = ["Implementation"] + Method.allCases.map(\.rawValue)
        let body = Implementation.allCases.map { impl in
            Method.allCases.map { method in
                dict[method.rawValue]![impl.rawValue]!
            }
        }
        return (head, body)
    }

    static func writeERC20Readme(
        base: String
    ) -> (SolidityVersion, [Method.RawValue: [Implementation.RawValue: String]]) -> WriteFile {
        { version, dict in
            WriteFile(
                path: readmePath(base: base, version: version),
                contents: dict
                |> dictToTableComponents
                >>> tableComponentsToString
                >>> readmeMarkdown
            )
        }
    }
}
