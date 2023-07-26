import UIKit
import DataModels

final public class EarthquakeTableViewCell: UITableViewCell, CellContentUpdating {
    // MARK: - IBOutlets

    @IBOutlet weak private var containerView: UIView!
    @IBOutlet weak private var magnitudeContainerView: UIView!
    @IBOutlet weak private var magnitudeLabel: UILabel!
    @IBOutlet weak private var dateLabel: UILabel!
    @IBOutlet weak private var sourceLabel: UILabel!

    // MARK: - Public variables

    public override var reuseIdentifier: String? {
        Self.reuseIdentifier
    }

    // MARK: - Lifecycle

    public override func awakeFromNib() {
        super.awakeFromNib()
        selectedBackgroundView = UIView()
        setupShadow()
    }

    // MARK: - Public methods

    public func setContent(_ viewModel: CellViewModelProtocol) {
        guard let viewModel = viewModel as? EarthquakeCellViewModel else { return }

        magnitudeLabel.text = viewModel.magnitude
        dateLabel.text = viewModel.date
        sourceLabel.text = viewModel.source
        magnitudeContainerView.backgroundColor = viewModel.magnitudeColor
    }

    // MARK: - Private methods

    private func setupShadow() {
        containerView.layer.cornerRadius = 5
        containerView.layer.shadowOpacity = 0.3
        containerView.layer.shadowOffset = .zero
        containerView.layer.shadowColor = UIColor.earthquakeCellShadow.cgColor

        containerView.layer.shouldRasterize = true
        containerView.layer.rasterizationScale = UIScreen.main.scale
    }
}
