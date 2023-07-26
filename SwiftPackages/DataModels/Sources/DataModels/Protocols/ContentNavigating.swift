import Foundation

/// Interface to navigate to specific content
public protocol ContentNavigating: AnyObject {
    func didSelect(_ model: ContentElementProtocol)
}
