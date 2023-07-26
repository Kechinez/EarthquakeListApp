import XCTest
import DataModels
import MapKit
@testable import Content

final class EarthquakeDetailsViewModelTests: XCTestCase {
    private var sut: EarthquakeDetailsViewModel!
    private let expectedLatitude: Double = 10
    private let expectedLongitude: Double = -10

    override func setUp() {
        super.setUp()
        sut = EarthquakeDetailsViewModel(model: Earthquake(source: "", longitude: expectedLongitude, latitude: expectedLatitude, date: "", magnitude: 5))
    }

    func testCoordinateRegion() {
        XCTAssertEqual(sut.coordinateRegion.center.latitude, expectedLatitude)
        XCTAssertEqual(sut.coordinateRegion.center.longitude, expectedLongitude)
    }
}
