import Foundation

public class NetworkService: NetworkServicing {
    public func request<T: Decodable>(endpoint: Endpoint<T>) async throws -> T {
        do {
            let response = try await URLSession.shared.data(from: URL(string: "")!)
            return try JSONDecoder().decode(T.self, from: response.0)

        } catch {
            throw error
        }
    }
}
