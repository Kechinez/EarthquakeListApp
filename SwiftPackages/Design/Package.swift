// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Design",
    products: [
        .library(
            name: "Design",
            targets: ["Design"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Design",
            dependencies: [],
            resources: [.process("Resources")])
    ]
)
