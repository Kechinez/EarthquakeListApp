import UIKit
import DataModels
import Localization

final public class EarthquakesTableViewController: UITableViewController {
    // MARK: - Private variables

    private let viewModel: EarthquakesListViewModel
    private weak var navigatingDelegate: ContentNavigating?
    private weak var activityIndicator: UIActivityIndicatorView?
    private var dataSource: EarthquakesDataSource?

    // MARK: - Init

    public init(viewModel: EarthquakesListViewModel, navigatingDelegate: ContentNavigating) {
        self.viewModel = viewModel
        self.navigatingDelegate = navigatingDelegate

        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    public override func viewDidLoad() {
        fetchData()
        title = Localization.listTitle
        configureTableView()
    }

    // MARK: - Private methods

    private func fetchData() {
        showActivityIndicator()

        Task {
            do {
                try await viewModel.fetchData()

                dismissActivityIndicator()
                tableView.reloadData()
            } catch {
                dismissActivityIndicator()
                handleError(error)
            }
        }
    }

    private func handleError(_ error: Error) {
        let alertController = UIAlertController(title: Localization.networkErrorTitle, message: error.localizedDescription, preferredStyle: .alert)
        let retryAction = UIAlertAction(title: Localization.networkErrorButtonTitle, style: .default) { [weak self] _ in
            self?.fetchData()
        }

        alertController.addAction(retryAction)
        present(alertController, animated: true)
    }

    private func showActivityIndicator() {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(indicator)
        view.bringSubviewToFront(indicator)

        indicator.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        indicator.startAnimating()
        activityIndicator = indicator
    }

    private func dismissActivityIndicator() {
        activityIndicator?.removeFromSuperview()
    }

    private func configureTableView() {
        dataSource = EarthquakesDataSource(viewModel: viewModel)

        tableView.dataSource = dataSource
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "EarthquakeTableViewCell", bundle: .module), forCellReuseIdentifier: EarthquakeTableViewCell.reuseIdentifier)
    }
}

// MARK: - UITableViewDelegate

extension EarthquakesTableViewController {
    override public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let model = viewModel.cellModel(for: indexPath) else { return }
        navigatingDelegate?.didSelect(model)
    }
}
