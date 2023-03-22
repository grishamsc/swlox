// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swlox",
    dependencies: [],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .executableTarget(
            name: "swlox",
            dependencies: []),
        .testTarget(name: "swlox_tests",
                    dependencies: ["swlox"],
                    path: "Tests/")
    ]
)
