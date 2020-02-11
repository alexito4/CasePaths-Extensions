// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "CasePaths-Extensions",
    products: [
        .library(
            name: "CasePaths-Extensions",
            targets: ["CasePaths-Extensions"]),
    ],
    dependencies: [
         .package(url: "https://github.com/pointfreeco/swift-case-paths", from: "0.1.0"),
    ],
    targets: [
        .target(
            name: "CasePaths-Extensions",
            dependencies: ["CasePaths"]),
        .testTarget(
            name: "CasePaths-ExtensionsTests",
            dependencies: ["CasePaths-Extensions"]),
    ]
)
