import UIKit

/// Scene delegate interface
public protocol SceneDelegating: AnyObject {
    func startApp(with window: UIWindow?)
}
