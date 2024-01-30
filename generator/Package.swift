// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "solbench",
    platforms: [
        .macOS(.v13),
    ],
    products: [
        .executable(name: "solbench", targets: ["Cmd"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.2.0"),
        .package(url: "https://github.com/pointfreeco/swift-prelude.git", branch: "main"),
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing", from: "1.15.2"),
    ],
    targets: [
        .executableTarget(
            name: "Cmd",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .byName(name: "SolbenchKit")
            ]
        ),
        .target(
            name: "SolbenchKit",
            dependencies: [
                .product(name: "Prelude", package: "swift-prelude")
            ]
        ),
        .testTarget(
            name: "SolbenchKitTests",
            dependencies: [
                .byName(name: "SolbenchKit"),
                .product(name: "InlineSnapshotTesting", package: "swift-snapshot-testing"),
            ]
        )
    ]
)
