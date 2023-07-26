import Foundation
import Networking
import DataModels

final public class EarthquakesListViewModel {
    // MARK: - Public variables

    public var numberOfRows: Int {
        models.count
    }

    // MARK: - Private variables

    private let repository: any DataRepository
    private var models: [ContentElementProtocol] = []
    private var viewModelCache: [IndexPath: CellViewModelProtocol] = [:]

    // MARK: - Init

    public init(repository: any DataRepository) {
        self.repository = repository
    }

    // MARK: - Public methods

    public func fetchData() async throws {
        let result: Earthquakes = try await repository.fetch().result()

        await MainActor.run {
            models = result.earthquakes
        }
    }

    public func cellViewModel(for indexPath: IndexPath) -> CellViewModelProtocol? {
        guard indexPath.row < models.count && indexPath.row >= 0 else { return nil }

        if let viewModel = viewModelCache[indexPath] {
            return viewModel
        } else if let viewModel = EarthquakeCellViewModel(model: models[indexPath.row]) {
            viewModelCache[indexPath] = viewModel
            return viewModel
        } else {
            return nil
        }
    }

    public func cellReuseIdentifier(for indexPath: IndexPath) -> String {
        EarthquakeTableViewCell.reuseIdentifier
    }

    public func cellModel(for indexPath: IndexPath) -> ContentElementProtocol? {
        guard indexPath.row < models.count && indexPath.row >= 0 else { return nil }
        return models[indexPath.row]
    }
}
