import UIKit
import Swinject
import Networking
import DataModels
import Utils

final public class EarthquakeListCoordinator: Coordinator {
    // MARK: - Public variables

    public let navigationController: UINavigationController

    // MARK: - Private variables

    private let container: Container

    // MARK: - Init

    public init(container: Container, navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.container = container
    }

    // MARK: - Public methods

    public func setup() {
        guard let networkService = container.resolve(NetworkServicing.self) else { return }
        let repository = EarthquakesRepository(networkService: networkService)
        let controller = EarthquakesTableViewController(viewModel: EarthquakesListViewModel(repository: repository), navigatingDelegate: self)
        navigationController.pushViewController(controller, animated: false)
    }

    // MARK: - Private methods

    private func showDetails(_ model: ContentElementProtocol) {
        guard let earthquake = model as? Earthquake else { return }

        let viewModel = EarthquakeDetailsViewModel(model: earthquake)
        let viewController = EarthquakeDetailsViewController.instantiateViewController(.module)
        viewController.setupViewModel(viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
}

// MARK: - ContentNavigating

extension EarthquakeListCoordinator: ContentNavigating {
    public func didSelect(_ model: ContentElementProtocol) {
        showDetails(model)
    }
}
