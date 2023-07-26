import Foundation

public protocol Session: AnyObject {
    func data(from url: URL, delegate: (URLSessionTaskDelegate)?) async throws -> (Data, URLResponse)
}

// MARK: - URLSession conformance
extension URLSession: Session {}
