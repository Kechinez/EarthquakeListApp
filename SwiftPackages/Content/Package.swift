// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Content",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "Content",
            targets: ["Content"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Swinject/Swinject.git", exact: "2.8.3"),
        .package(path: "../Networking"),
        .package(path: "../DataModels"),
        .package(path: "../Utils"),
        .package(path: "../Design"),
        .package(path: "../Localization")
    ],
    targets: [
        .target(
            name: "Content",
            dependencies: [.product(name: "Swinject", package: "Swinject"), "Networking", "DataModels", "Utils", "Design", "Localization"]),
        .testTarget(
            name: "ContentTests",
            dependencies: ["Content"]),
    ]
)
