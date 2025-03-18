// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LegalSystem",
    platforms: [
        .macOS(.v15)
    ],
    products: [
        .executable(name: "LegalSystem", targets: ["LegalSystem"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "LegalSystem"),
        .testTarget(
            name: "LegalSystemTests",
            dependencies: ["LegalSystem"]
        ),
    ]
)
