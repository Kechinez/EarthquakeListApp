import Foundation

public protocol NetworkServicing {
    func request<T: Decodable>(endpoint: Endpoint<T>) async throws -> T
}
