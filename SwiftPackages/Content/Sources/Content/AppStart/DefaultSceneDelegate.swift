import UIKit
import DataModels
import Swinject
import Networking
import Localization

final public class DefaultSceneDelegate: SceneDelegating {
    // MARK: - Private variables

    private var container: Container!
    private var appCoordinator: AppCoordinator?

    // MARK: - Init

    public init() {}

    // MARK: - Public methods

    public func startApp(with window: UIWindow?) {
        let rootController = UINavigationController()
        window?.rootViewController = rootController
        window?.makeKeyAndVisible()

        registerDependencies()
        loadLocalization()

        appCoordinator = AppCoordinator(container: container, navigationController: rootController)
        appCoordinator?.setup()
    }

    // MARK: - Private methods

    private func registerDependencies() {
        container = Container()
        container.register(NetworkServicing.self) { _ in NetworkService() }
    }

    private func loadLocalization() {
        Localization.loadData()
    }
}
