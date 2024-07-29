import SemanticVersioning
import Foundation

public final class RemoteConfiguration: Codable, Sendable {
    /// configuration version
    public let version: SemanticVersion
    
    /// minimum application version
    /// If app version smaller than this, user needs update app.
    public let minimumApplicationVersion: SemanticVersion
    
    /// If app version smaller than this, app notice updates.
    public let stableApplicationVersion: SemanticVersion
 
    /// Update URL
    public let appstoreURL: URL
    
    public init(version: SemanticVersion, minimumApplicationVersion: SemanticVersion, stableApplicationVersion: SemanticVersion, appstoreURL: URL) {
        self.version = version
        self.minimumApplicationVersion = minimumApplicationVersion
        self.stableApplicationVersion = stableApplicationVersion
        self.appstoreURL = appstoreURL
    }
}
