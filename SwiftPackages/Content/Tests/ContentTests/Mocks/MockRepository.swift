import Foundation
import DataModels

class MockRepository: DataRepository {
    typealias ResultType = Earthquakes

    public func fetch() async throws -> ResultType {
        Earthquakes(earthquakes: [
            .init(source: "", longitude: 0, latitude: 0, date: "", magnitude: 0),
            .init(source: "", longitude: 0, latitude: 0, date: "", magnitude: 0),
            .init(source: "", longitude: 0, latitude: 0, date: "", magnitude: 0)
        ])
    }
}
