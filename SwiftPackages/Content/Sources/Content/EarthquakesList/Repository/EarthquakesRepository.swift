import Foundation
import Networking
import DataModels

final public class EarthquakesRepository: DataRepository {
    public typealias ResultType = Earthquakes

    // MARK: - Private variables

    private var endPoint: Endpoint<ResultType> {
        Endpoint(path: "http://api.geonames.org/earthquakesJSON?formatted=true&north=44.1&south=-9.9&east=-22.4&west=55.2&username=mkoppelman")
    }

    private let networkService: NetworkServicing

    // MARK: - Init

    public init(networkService: NetworkServicing) {
        self.networkService = networkService
    }

    // MARK: - Public methods

    public func fetch() async throws -> ResultType {
        return try await networkService.request(endpoint: endPoint)
    }
}
