import Foundation

/// Abstract interface to update cells
public protocol CellContentUpdating {
    func setContent(_ viewModel: CellViewModelProtocol)
}
