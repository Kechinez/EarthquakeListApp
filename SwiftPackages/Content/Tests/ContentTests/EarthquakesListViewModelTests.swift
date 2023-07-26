import XCTest
@testable import Content

final class EarthquakesListViewModelTests: XCTestCase {
    private var sut: EarthquakesListViewModel!

    override func setUp() {
        super.setUp()
        sut = EarthquakesListViewModel(repository: MockRepository())
    }

    func testFetchData() async throws {
        XCTAssertEqual(sut.numberOfRows, 0)

        try await sut.fetchData()
        XCTAssertEqual(sut.numberOfRows, 3)
    }

    func testCellViewModelCache() async throws {
        XCTAssertNil(sut.cellViewModel(for: IndexPath(row: 0, section: 0)))
        XCTAssertNil(sut.cellViewModel(for: IndexPath(row: 2, section: 0)))

        try await sut.fetchData()

        XCTAssertNotNil(sut.cellViewModel(for: IndexPath(row: 0, section: 0)))
        XCTAssertNotNil(sut.cellViewModel(for: IndexPath(row: 2, section: 0)))

        // invalid IndexPath
        XCTAssertNil(sut.cellViewModel(for: IndexPath(row: 100, section: 3)))
        XCTAssertNil(sut.cellViewModel(for: IndexPath(row: -20, section: 0)))
    }

    func testReuseIdentifier() {
        XCTAssertEqual(sut.cellReuseIdentifier(for: IndexPath(row: 0, section: 0)), EarthquakeTableViewCell.reuseIdentifier)
        XCTAssertEqual(sut.cellReuseIdentifier(for: IndexPath(row: 100, section: 4)), EarthquakeTableViewCell.reuseIdentifier)
    }

    func testBuildCellModel() async throws {
        try await sut.fetchData()

        XCTAssertNotNil(sut.cellModel(for: IndexPath(row: 0, section: 0)))
        XCTAssertNotNil(sut.cellModel(for: IndexPath(row: 2, section: 0)))

        // invalid IndexPath
        XCTAssertNil(sut.cellModel(for: IndexPath(row: 100, section: 3)))
        XCTAssertNil(sut.cellModel(for: IndexPath(row: -20, section: 0)))
    }
}

