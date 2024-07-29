import SwiftData
import Foundation
import SemanticVersioning

@Model
public final class CheckForUpdatesHistory: Identifiable {
    @Attribute(.unique)
    public var name: String
    
    public var version: SemanticVersion
    
    public var checkedAt: Date
    
    public init(name: String) {
        self.name = name
        self.version = .zero
        self.checkedAt = .now
    }
}

@ModelActor
public actor CheckForUpdatesHistoryActor {
    public var count: Int {
        get async throws {
            try modelContext.fetchCount(FetchDescriptor<CheckForUpdatesHistory>())
        }
    }

    public func save(_ item: CheckForUpdatesHistory) throws {
        item.checkedAt = .now
        modelContext.insert(item)
        try modelContext.save()
    }
    
    public func find(name: String, expiredIn: TimeInterval = 86_400) throws -> CheckForUpdatesHistory? {
        let expiredDate = Date.now.addingTimeInterval(-expiredIn)
        let predicate = #Predicate<CheckForUpdatesHistory> { item in
            item.name == name && item.checkedAt > expiredDate
        }
        var descriptor = FetchDescriptor(
            predicate: predicate
        )
        descriptor.fetchLimit = 1
        return try modelContext.fetch(descriptor).first
    }

    public func deleteAll() throws {
        try modelContext.delete(model: CheckForUpdatesHistory.self)
        try modelContext.save()
    }
}
