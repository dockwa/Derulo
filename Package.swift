// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "Derulo",
    products: [
        .library(
            name: "Derulo",
            targets: ["Derulo"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Derulo",
            dependencies: []),
        .testTarget(
            name: "DeruloTests",
            dependencies: ["Derulo"]),
    ]
)
