import UIKit
import DataModels

/// DataSource
final class EarthquakesDataSource: NSObject, UITableViewDataSource {
    // MARK: - Private variables

    private let viewModel: EarthquakesListViewModel

    // MARK: - Init

    init(viewModel: EarthquakesListViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - UITableViewDataSource methods

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.cellReuseIdentifier(for: indexPath), for: indexPath)

        if let updatableCell = cell as? CellContentUpdating, let viewModel = viewModel.cellViewModel(for: indexPath) {
            updatableCell.setContent(viewModel)
        }

        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }
}
