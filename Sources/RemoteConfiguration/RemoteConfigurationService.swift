import Foundation
import RemoteConfigurationCore

public struct RemoteConfigurationService: Sendable {
    let url: URL
    
    public init(url: URL) {
        self.url = url
    }
    
    public func remoteConfiguration(
        session: URLSession = URLSession(configuration: .ephemeral),
        name: String
    ) async throws -> RemoteConfiguration {
        let request = URLRequest(url: url.appending(path: "\(name).json"))
        let (data, _) = try await URLSession.shared.data(for: request)
        let decoder = JSONDecoder()
        let remoteConfiguration = try decoder.decode(RemoteConfiguration.self, from: data)
        return remoteConfiguration
    }
}
