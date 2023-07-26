import Foundation

/// Default NetworkService, performing network requests
final public class NetworkService: NetworkServicing {
    private let session: Session

    // MARK: - Init

    public init(session: Session = URLSession.shared) {
        self.session = session
    }

    // MARK: - Public methods

    public func request<T: Decodable>(endpoint: Endpoint<T>) async throws -> T {
        do {
            guard let url = endpoint.request() else { throw InvalidURL() }
            let response = try await session.data(from: url, delegate: nil)
            return try JSONDecoder().decode(T.self, from: response.0)

        } catch {
            throw error
        }
    }
}
