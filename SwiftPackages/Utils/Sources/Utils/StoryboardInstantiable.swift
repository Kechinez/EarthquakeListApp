import UIKit

// MARK: - StoryboardInstantiable

public protocol StoryboardInstantiable: NSObjectProtocol {
    associatedtype InstantiableType

    /// Instantiates UIViewController from Storyboard
    static func instantiateViewController(_ bundle: Bundle?) -> InstantiableType
}

// MARK: - UIViewController + StoryboardInstantiable

extension UIViewController: StoryboardInstantiable {
    public typealias InstantiableType = UIViewController

    public static func instantiateViewController(_ bundle: Bundle? = nil) -> Self {
        let fileName = String(describing: Self.self)
        let storyboard = UIStoryboard(name: fileName, bundle: bundle)

        guard let controller = storyboard.instantiateInitialViewController() as? Self else {
            fatalError("The storyboard for \(fileName) could not be found.")
        }

        return controller
    }
}
