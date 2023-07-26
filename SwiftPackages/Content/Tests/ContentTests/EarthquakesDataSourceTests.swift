import XCTest
@testable import Content

final class EarthquakesDataSourceTests: XCTestCase {
    private var sut: EarthquakesDataSource!

    @MainActor
    override func setUp() async throws {
        try await super.setUp()
        
        let viewModel = EarthquakesListViewModel(repository: MockRepository())
        try await viewModel.fetchData()
        sut = EarthquakesDataSource(viewModel: viewModel)
    }

    func testNumberOfRows() {
        XCTAssertEqual(sut.tableView(UITableView(frame: .zero), numberOfRowsInSection: 0), 3)
    }
}
