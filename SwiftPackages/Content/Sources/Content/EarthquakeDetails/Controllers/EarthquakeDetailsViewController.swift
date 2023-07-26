import UIKit
import DataModels
import Localization
import Utils
import MapKit

final public class EarthquakeDetailsViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet weak private var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak private var mapViewContainer: UIView!
    @IBOutlet weak private var magnitudeChartContainer: UIView!

    // MARK: - Private variables

    private var viewModel: EarthquakeDetailsViewModel!
    private weak var mapView: MKMapView?
    private weak var chartView: ChartView?

    // MARK: - Lyfecycle

    public override func viewDidLoad() {
        title = Localization.detailsTitle
        setupChartView()
        activityIndicator.startAnimating()
    }

    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupMap()
        configureMap()
    }

    // MARK: - Public methods

    public func setupViewModel(_ viewModel: EarthquakeDetailsViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - Private methods

    private func setupMap() {
        let mapView = MKMapView()
        mapView.delegate = self
        mapViewContainer.addSubview(mapView)
        mapViewContainer.setupConstraints(with: mapView, anchorsTypes: [.bottom, .top, .leading, .trailing], insets: .zero)
        self.mapView = mapView
    }

    private func setupChartView() {
        let horisontalMargin: CGFloat = view.isRegular ? 25 : 8
        let chartView = ChartView(viewModel: viewModel.chartViewModel)
        magnitudeChartContainer.addSubview(chartView)
        magnitudeChartContainer.setupConstraints(with: chartView, anchorsTypes: [.top, .bottom, .leading, .trailing], insets: .init(top: -10, left: -horisontalMargin, bottom: 5, right: horisontalMargin))
        self.chartView = chartView
    }

    private func configureMap() {
        let marker = Marker(coordinate: viewModel.coordinateRegion.center)
        mapView?.setRegion(viewModel.coordinateRegion, animated: false)
        mapView?.addAnnotation(marker)
    }
}

extension EarthquakeDetailsViewController: MKMapViewDelegate {
    public func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        activityIndicator.stopAnimating()
    }
}
