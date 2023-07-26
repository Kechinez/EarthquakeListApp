import UIKit

/// Gradient View
final public class GradientView: UIView {
    // MARK: - Private variables

    private let colors: [CGColor]
    private let locations: [NSNumber]
    private var gradient: CAGradientLayer!

    // MARK: - Init

    public init(colors: [CGColor], locations: [NSNumber]) {
        self.colors = colors
        self.locations = locations
        super.init(frame: .zero)

        setupGradient()
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    public override func layoutSubviews() {
        super.layoutSubviews()
        gradient.frame = bounds
    }

    // MARK: - Private methods

    private func setupGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.locations = locations
        layer.insertSublayer(gradientLayer, at: 0)
        gradient = gradientLayer
    }
}
