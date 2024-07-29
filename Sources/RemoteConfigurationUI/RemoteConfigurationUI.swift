import SemanticVersioning
import Foundation
import SwiftData
import RemoteConfigurationCore
import RemoteConfiguration

func testRemoteConfigurationService() async throws {
    
    
//    let modelContainer = try ModelContainer(for: CheckForUpdatesHistory.self)
//    let historyStore = CheckForUpdatesHistoryActor(modelContainer: modelContainer)
//    
//    if let history = try await historyStore.find(name: "") {
//        return
//    } else {
//        
//        let history = CheckForUpdatesHistory(name: "")
//        history.version = remoteConfiguration.version
//        try await historyStore.save(history)
//    }
}

enum CheckForUpdatesResult {
    case unavailable
    case notStable
    case available
}

func checkForUpdates() async throws -> CheckForUpdatesResult {
    let name = "development"
    
    let url = URL(
        string: "https://github.com/noppefoxwolf/DAWNRemoteConfiguration/blob/main/output/"
    )!
    let service = RemoteConfigurationService(url: url)
    let remoteConfiguration = try await service.remoteConfiguration(name: name)
    
    // return if exists
    let appVersion = try Application.current.version
    if appVersion < remoteConfiguration.minimumApplicationVersion {
        return .unavailable
    }
    if appVersion < remoteConfiguration.stableApplicationVersion {
        return .notStable
    }
    return .available
}
