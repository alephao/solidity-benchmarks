// The Swift Programming Language
// https://docs.swift.org/swift-book
// 
// Swift Argument Parser
// https://swiftpackageindex.com/apple/swift-argument-parser/documentation

import ArgumentParser

@main
struct generator: ParsableCommand {
    @Argument(help: "path to data.json")
    var jsonPath: String

    @Argument(help: "path to benchmarks folder")
    var benchmarksPath: String

    mutating func run() throws {
        erc20(jsonPath: jsonPath, benchmarksPath: benchmarksPath)
    }
}
