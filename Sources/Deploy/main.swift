import Foundation
import RemoteConfigurationCore
import SemanticVersioning

// EditMe
let developRemoteConfiguration = RemoteConfiguration(
    version: SemanticVersion(major: 1, minor: 0, patch: 0),
    minimumApplicationVersion: SemanticVersion(major: 1, minor: 0, patch: 0),
    stableApplicationVersion: SemanticVersion(major: 1, minor: 0, patch: 0),
    appstoreURL: URL(string: "https://apps.apple.com/app/id1668645019")!
)

// export process
let encoder = JSONEncoder()
encoder.outputFormatting = .sortedKeys

let developData = try encoder.encode(developRemoteConfiguration)
let currentFilePath = URL(filePath: FileManager.default.currentDirectoryPath)
let url = currentFilePath.appending(
    components: "output", "develop.json"
)
try developData.write(to: url)

