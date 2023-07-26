import UIKit

/// Coordinator interface
public protocol Coordinator {
    var navigationController: UINavigationController { get }
    func setup()
}
