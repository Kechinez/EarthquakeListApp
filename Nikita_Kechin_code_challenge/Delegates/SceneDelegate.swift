import UIKit
import DataModels
import Content

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    private var defaultSceneDelegate: SceneDelegating?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)
        defaultSceneDelegate = DefaultSceneDelegate()
        defaultSceneDelegate?.startApp(with: window)
    }
}
