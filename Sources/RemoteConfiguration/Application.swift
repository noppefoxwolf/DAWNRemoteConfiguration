import Foundation
import SemanticVersioning

public struct Application {
    public static let current = Application()
    
    public var version: SemanticVersion {
        get throws {
            let versionString = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
            let decoder = SemanticVersioningDecoder()
            let version = try decoder.decode(from: versionString)
            return version
        }
    }
}
