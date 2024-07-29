import Foundation
import RemoteConfigurationCore
import SemanticVersioning
import Path

// EditMe
let developRemoteConfiguration = RemoteConfiguration(
    version: SemanticVersion(major: 1, minor: 0, patch: 1),
    minimumApplicationVersion: SemanticVersion(major: 1, minor: 0, patch: 0),
    stableApplicationVersion: SemanticVersion(major: 1, minor: 0, patch: 0),
    appstoreURL: URL(string: "https://apps.apple.com/app/id1668645019")!
)

// export process
let encoder = JSONEncoder()
encoder.outputFormatting = .sortedKeys

let data = try encoder.encode(developRemoteConfiguration)

let outputPath = Path.cwd/"output"
_ = try? outputPath.mkdir()
let path = outputPath/"develop.json"

try data.write(to: path)

