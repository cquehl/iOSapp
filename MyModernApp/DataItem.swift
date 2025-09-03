import Foundation
import SwiftData

@Model
final class DataItem {
    var timestamp: Date

    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}