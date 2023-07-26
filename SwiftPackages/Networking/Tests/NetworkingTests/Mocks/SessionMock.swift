import Foundation
import Networking

class SessionMock: Session {
    private let shouldFail: Bool

    init(shouldFail: Bool) {
        self.shouldFail = shouldFail
    }

    func data(from url: URL, delegate: (URLSessionTaskDelegate)?) async throws -> (Data, URLResponse) {
        if shouldFail {
            throw NetworkError()
        }

        if let url = Bundle.module.url(forResource: "test_response", withExtension: "json"),
           let jsonString = try? String(contentsOf: url),
           let data = jsonString.data(using: .utf8) {
            return (data, URLResponse(url: URL(string: "about:blank")!, mimeType: "", expectedContentLength: 0, textEncodingName: ""))
        }

        throw NetworkError()
    }
}

private class NetworkError: Error {}
