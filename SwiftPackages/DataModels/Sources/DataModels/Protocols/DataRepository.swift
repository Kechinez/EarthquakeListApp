import Foundation

/// interface for Repository
public protocol DataRepository<ResultType> {
    /// `ResultType` is response type that would be returned from source after processing
    associatedtype ResultType: ContentElementProtocol

    /// Fetches data of type `ResultType`
    func fetch() async throws -> ResultType
}
