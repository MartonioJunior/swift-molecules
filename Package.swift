// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// MARK: - Utilities
public enum UpcomingFeatures: String, CaseIterable {
    case existentialAny
    case fullTypedThrows
    case internalImportsByDefault
    case memberImportVisibility
    case nonescapableTypes
    case nonisolatedNonsendingByDefault
    case inferIsolatedConformances
    case valueGenerics

    var asSetting: SwiftSetting { .enableUpcomingFeature(rawValue.capitalized) }
}

public extension Array where Element == SwiftSetting {
    static var upcomingFeatures: Self { UpcomingFeatures.allCases.map(\.asSetting) }
}

// MARK: - Targets
let targets: [Target] = [
    .target(
        name: "SwiftMolecules",
        swiftSettings: .upcomingFeatures
    )
]

let testTargets: [Target] = targets.map {
    .testTarget(name: "\($0.name)Tests", dependencies: [Target.Dependency(stringLiteral: $0.name)] + $0.dependencies)
}

// MARK: - Products
let products: [Product] = [
    .library(
        name: "SwiftMolecules",
        targets: ["SwiftMolecules"]
    )
]

// MARK: - PackageDescription
let package = Package(
    name: "SwiftMolecules",
    products: products,
    targets: targets + testTargets,
    swiftLanguageModes: [.v6]
)
