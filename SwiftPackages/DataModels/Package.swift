// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DataModels",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "DataModels",
            targets: ["DataModels"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "DataModels",
            dependencies: [])
    ]
)
