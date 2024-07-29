import XCTest
@testable import RemoteConfigurationCore
import SemanticVersioning

final class RemoteConfigurationTests: XCTestCase {
    func testCodable() throws {
        let remoteConfiguration = RemoteConfiguration(
            version: SemanticVersion(major: 1, minor: 0, patch: 1),
            minimumApplicationVersion: SemanticVersion(major: 1, minor: 0, patch: 0),
            stableApplicationVersion: SemanticVersion(major: 1, minor: 0, patch: 0),
            appstoreURL: URL(string: "https://apps.apple.com/app/id1668645019")!
        )

        // export process
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.sortedKeys, .prettyPrinted, .withoutEscapingSlashes]

        let data = try encoder.encode(remoteConfiguration)

        let decoder = JSONDecoder()
        let decoded = try decoder.decode(RemoteConfiguration.self, from: data)
        
        XCTAssertEqual(decoded.appstoreURL, remoteConfiguration.appstoreURL)
    }
}
