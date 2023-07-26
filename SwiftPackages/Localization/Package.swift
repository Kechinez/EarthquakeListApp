// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Localization",
    products: [
        .library(
            name: "Localization",
            targets: ["Localization"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Localization",
            dependencies: [],
            resources: [.process("Resources")]),
    ]
)
