import XCTest
@testable import Networking

final class NetworkServiceTests: XCTestCase {
    func test_MakingSuccessfulRequest() async throws {
        let sut = NetworkService(session: SessionMock(shouldFail: false))

        let result = try await sut.request(endpoint: Endpoint<[ObjectMock]>(path: "about:blank"))
        XCTAssertEqual(result.count, 3)
    }
    
    func test_MakingFailingRequest() async throws {
        let sut = NetworkService(session: SessionMock(shouldFail: true))

        do {
            _ = try await sut.request(endpoint: Endpoint<[ObjectMock]>(path: "about:blank"))
            XCTFail("Shouldn't get any result!")
        } catch {
        }
    }

    func test_whenInvalidEndpoint_then_throwsError() async throws {
        let sut = NetworkService(session: SessionMock(shouldFail: false))

        do {
            _ = try await sut.request(endpoint: Endpoint<[ObjectMock]>(path: "some invalid url"))
            XCTFail("Shouldn't get any result!")
        } catch {
        }
    }
}

private struct ObjectMock: Decodable {
    let lng: Double
    let lat: Double
}
