import Foundation

/// Endpoint object
public struct Endpoint<ResponseValue> {
    /// Endpoint path
    public let path: String
    
    /// HTTP method for this endpoint
    public let method: HTTPMethod
    
    /// The request parameters
    public let parameters: Parameters?

    public init(
        path: String,
        method: HTTPMethod = .get,
        parameters: Parameters? = nil
    ) {
        self.path = path
        self.method = method
        self.parameters = parameters
    }

    public func request() -> URL? {
        URL(string: path)
    }
}
