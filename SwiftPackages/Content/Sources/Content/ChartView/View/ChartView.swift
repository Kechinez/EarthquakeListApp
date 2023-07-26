import UIKit
import DataModels
import Utils
import Design

/// ChartView displays vertical chart for a given data
final public class ChartView: UIView {
    // MARK: - Private variables

    private let viewModel: ChartViewModel
    private var infoLabel: UILabel!

    // MARK: - Init

    public init(viewModel: ChartViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)

        setupChart()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods

    private func setupChart() {
        // ContainerView

        let containerView = UIView()
        addSubview(containerView)
        containerView.layer.cornerRadius = 4
        containerView.layer.borderWidth = 0.5
        containerView.layer.borderColor = UIColor.charBorder.cgColor

        containerView.setupConstraints(with: self, anchorsTypes: [.bottom, .leading, .trailing], insets: .zero)

        // LabelsStackView
        let figuresFont: CGFloat = isRegular ? 19 : 12
        let figureLabels: [UILabel] = viewModel.allValues.map { figure in
            let label = UILabel()
            label.text = figure
            label.font = .systemFont(ofSize: figuresFont)
            return label
        }

        let labelsStackView = UIStackView(arrangedSubviews: figureLabels)
        labelsStackView.axis = .vertical
        labelsStackView.distribution = .fillEqually
        labelsStackView.alignment = .trailing
        addSubview(labelsStackView)

        labelsStackView.setupConstraints(with: containerView, anchorsTypes: [.bottom, .top, .leading], insets: .init(top: 3, left: 3, bottom: -3, right: 0))

        // Gradient view

        let gradientView = GradientView(colors: viewModel.gradientColors, locations: viewModel.gradientLocation)
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(gradientView)

        gradientView.leadingAnchor.constraint(equalTo: labelsStackView.trailingAnchor, constant: 3).isActive = true
        gradientView.centerYAnchor.constraint(equalTo: labelsStackView.centerYAnchor).isActive = true
        gradientView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -1).isActive = true
        gradientView.heightAnchor.constraint(equalTo: labelsStackView.heightAnchor, multiplier: viewModel.coloredChartPartViewHeightRatio).isActive = true

        // Covering view

        let coveringView = UIView()
        coveringView.backgroundColor = .standardWhite
        gradientView.addSubview(coveringView)
        
        coveringView.setupConstraints(with: gradientView, anchorsTypes: [.top, .leading, .trailing], insets: .zero)
        coveringView.heightAnchor.constraint(equalTo: gradientView.heightAnchor, multiplier: 1 - viewModel.givenMagnitudeHeightRatio).isActive = true

        // InfoLabel

        let infoLabel = UILabel()
        infoLabel.numberOfLines = 0
        infoLabel.text = viewModel.info
        infoLabel.textColor = .chartInfo
        infoLabel.font = isRegular ? .systemFont(ofSize: 20) : .systemFont(ofSize: 13)
        addSubview(infoLabel)

        infoLabel.setupConstraints(with: self, anchorsTypes: [.top, .leading, .trailing], insets: .zero)
        infoLabel.bottomAnchor.constraint(equalTo: containerView.topAnchor, constant: -5).isActive = true
        self.infoLabel = infoLabel
    }
}
