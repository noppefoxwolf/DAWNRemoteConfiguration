// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DAWNRemoteConfiguration",
    platforms: [.iOS(.v17), .macOS(.v14)],
    products: [
        .library(
            name: "RemoteConfigurationUI",
            targets: ["RemoteConfigurationUI"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/noppefoxwolf/SemanticVersioning", from: "0.0.6"),
        .package(url: "https://github.com/mxcl/Path.swift", from: "1.4.1"),
    ],
    targets: [
        .target(
            name: "RemoteConfigurationCore",
            dependencies: [
                "SemanticVersioning",
            ]
        ),
        .executableTarget(
            name: "Deploy",
            dependencies: [
                "RemoteConfigurationCore",
                "SemanticVersioning",
                .product(name: "Path", package: "Path.swift"),
            ]
        ),
        .target(
            name: "RemoteConfigurationUI",
            dependencies: [
                "RemoteConfiguration"
            ]
        ),
        .target(
            name: "RemoteConfiguration",
            dependencies: [
                "RemoteConfigurationCore"
            ]
        ),
        .testTarget(
            name: "RemoteConfigurationTests",
            dependencies: ["RemoteConfiguration"]
        ),
    ]
)
