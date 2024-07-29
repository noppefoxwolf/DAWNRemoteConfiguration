import Foundation
import RemoteConfigurationCore
import SemanticVersioning

// EditMe
let remoteConfiguration = RemoteConfiguration(
    version: SemanticVersion(major: 1, minor: 0, patch: 0),
    minimumApplicationVersion: SemanticVersion(major: 1, minor: 0, patch: 0),
    stableApplicationVersion: SemanticVersion(major: 1, minor: 0, patch: 0),
    appstoreURL: URL(string: "https://apps.apple.com/app/id1668645019")!
)

// export process
let encoder = JSONEncoder()
encoder.outputFormatting = .sortedKeys
let data = try encoder.encode(remoteConfiguration)

print(String(data: data, encoding: .utf8)!)
