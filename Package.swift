// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

struct PackageMetadata {
    static let version: String = "1.0.0"
    static let checksum: String = "b50065f0814808e8a3ad730436865886a6fd634da54541ecbe0a826b7820f246"
}

let package = Package(
    name: "AdvancedFrameworkPackage",
    platforms: [
        .iOS(.v14), .tvOS(.v14)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "AdvancedFrameworkPackage", targets: ["AdvancedFrameworkPackage"]),
    ],
    dependencies: [
        .package(url: "https://github.com/bitmovin/player-ios-core.git",
                    exact:"3.40.0"),
        .package(url: "https://github.com/bitmovin/player-ios.git",
                    exact:"3.40.0"),
        .package(url: "https://github.com/bitmovin/bitmovin-analytics-collector-ios",
                 exact:"3.0.0-a.1"),
        .package(url: "https://github.com/SRGSSR/GoogleCastSDK-ios-no-bluetooth", exact: "4.7.1-beta.1")
    ],
    
    targets: [
        .target(name: "AdvancedFrameworkPackage",
                dependencies: [ "AdvancedFramework",
                    .product(name: "BitmovinPlayerCore", package: "player-ios-core"),
                    .product(name: "BitmovinPlayer", package: "player-ios"),
                    .product(name: "BitmovinCollector", package: "bitmovin-analytics-collector-ios"),
                    .product(name: "GoogleCastSDK-ios-no-bluetooth", package: "GoogleCastSDK-ios-no-bluetooth")
                    ],
                cSettings: [
                    .define("BUILD_LIBRARY_FOR_DISTRIBUTION", to: "YES")
                ]
        ),
        .binaryTarget(name: "AdvancedFramework", path: "./AdvancedFramework.xcframework")
    ]
)
