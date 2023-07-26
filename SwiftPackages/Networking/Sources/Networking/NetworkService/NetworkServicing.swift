import Foundation

public protocol NetworkServicing {
    /// Performs a network request, expecting value of type T in response
    func request<T: Decodable>(endpoint: Endpoint<T>) async throws -> T
    init(session: Session)
}
