import Foundation
import DataModels

public protocol NetworkRepository<ResultType> {
    /// `ResultType` is response type that would be returned from source after processing
    associatedtype ResultType: ContentElementProtocol

    /// `Endpoint` object for resolving network path and result type at time of request.
    var endPoint: Endpoint<ResultType> { get async }

    /// `NetworkService` object is used to make network request call.
    var networkService: NetworkService { get }

    func fetch() async throws -> ResultType //func download(to destination: URL, progressHandler: @escaping (Progress) -> Void) async throws
}
