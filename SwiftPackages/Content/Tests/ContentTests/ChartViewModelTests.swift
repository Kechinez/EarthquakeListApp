import XCTest
@testable import Content

final class ChartViewModelTests: XCTestCase {
    private var sut: ChartViewModel!
    private let givenValue = 7.8

    override func setUp() {
        super.setUp()
        sut = ChartViewModel(magnitude: .init(richterScaleWith: givenValue))
    }

    func testProperties() {
        XCTAssertEqual(sut.allValues, ["10", "9", "8", "7", "6", "5", "4", "3", "2", "1", "0"])
        XCTAssertEqual(sut.coloredChartPartViewHeightRatio, 0.9090909090909091)
        XCTAssertEqual(sut.givenMagnitudeHeightRatio, 0.78)
        XCTAssertEqual(sut.gradientLocation, [0, 0.5, 0.8, 1.1, 1])
    }
}
