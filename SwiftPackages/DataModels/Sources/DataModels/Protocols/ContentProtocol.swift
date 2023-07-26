import Foundation

/// Empty Protocol that has to be implemented by the models.
public protocol ContentElementProtocol: Decodable {}

public extension ContentElementProtocol {
    /// Casts result to specific type
    func result<Type>() -> Type {
        if let self = self as? Type {
            return self
        } else {
            fatalError()
        }
    }
}
