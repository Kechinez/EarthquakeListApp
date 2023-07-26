import XCTest
import DataModels
@testable import Content

final class EarthquakeCellViewModelTests: XCTestCase {
    func testInit() {
        XCTAssertNil(EarthquakeCellViewModel(model: DummyModel()))
        XCTAssertNotNil(EarthquakeCellViewModel(model: Earthquake(source: "", longitude: 0, latitude: 0, date: "2012-04-11 06:38:37", magnitude: 8.6)))
    }

    func testProperties() throws {
        let sut = try XCTUnwrap(EarthquakeCellViewModel(model: Earthquake(source: "", longitude: 0, latitude: 0, date: "2012-04-11 06:38:37", magnitude: 8.6)))
        XCTAssertEqual(sut.magnitude, "8.6")
        XCTAssertEqual(sut.date, "11 April, 2012")
    }
}

private struct DummyModel: ContentElementProtocol {}
