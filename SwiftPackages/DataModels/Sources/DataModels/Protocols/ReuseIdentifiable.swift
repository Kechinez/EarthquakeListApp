import UIKit

/// Protocol to help identify re-usable elements
public protocol ReuseIdentifiable: AnyObject {
    static var reuseIdentifier: String { get }
}

public extension ReuseIdentifiable {
    /// Return type name as reuseIdentifier
    static var reuseIdentifier: String {
        String(describing: self)
    }
}

extension UITableViewCell: ReuseIdentifiable {}
