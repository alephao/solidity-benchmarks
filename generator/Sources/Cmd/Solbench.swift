import ArgumentParser
import SolbenchKit

@main
struct Solbench: ParsableCommand {
    static var configuration: CommandConfiguration = .init(
        commandName: "solbench",
        abstract: "An utility to generate the readmes for solidity-benchamarks",
        subcommands: [ERC20Command.self]
    )
}

extension Solbench {
    struct ERC20Command: ParsableCommand {
        static var configuration: CommandConfiguration = .init(
            commandName: "erc20",
            abstract: "Generate ERC20 readmes for solidity-benchmarks"
        )

        @Argument(help: "path to data.json")
        var jsonPath: String

        @Argument(help: "path to benchmarks folder")
        var benchmarksPath: String

        func run() throws {
            try generateERC20Readmes(jsonPath: jsonPath, benchmarksPath: benchmarksPath)
        }
    }
}

