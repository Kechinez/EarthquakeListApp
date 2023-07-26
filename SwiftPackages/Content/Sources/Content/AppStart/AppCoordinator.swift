import UIKit
import Networking
import Swinject
import DataModels

final public class AppCoordinator: Coordinator {
    // MARK: - Public variables

    public let navigationController: UINavigationController

    // MARK: - Private variables

    private let container: Container
    private var childCoordinator: Coordinator?

    // MARK: - Init

    public init(container: Container, navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.container = container
    }

    // MARK: - Public methods

    public func setup() {
        let coordinator = EarthquakeListCoordinator(container: container, navigationController: navigationController)
        childCoordinator = coordinator
        coordinator.setup()
    }
}
