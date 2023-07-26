import UIKit

public enum ConstraintAnchors {
    case top
    case bottom
    case leading
    case trailing
}

public extension UIView {
    func setupConstraints(with view: UIView, anchorsTypes: [ConstraintAnchors], insets: UIEdgeInsets) {
        translatesAutoresizingMaskIntoConstraints = false
        view.translatesAutoresizingMaskIntoConstraints = false

        for anchor in anchorsTypes {
            switch anchor {
            case .top: topAnchor.constraint(equalTo: view.topAnchor, constant: insets.top).isActive = true
            case .bottom: bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: insets.bottom).isActive = true
            case .leading: leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: insets.left).isActive = true
            case .trailing: trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: insets.right).isActive = true
            }
        }
    }

    var isRegular: Bool {
        traitCollection.horizontalSizeClass == .regular && traitCollection.verticalSizeClass == .regular
    }
}
