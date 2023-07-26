import UIKit
import DataModels
import Design
import Localization
import Utils
import MapKit

final public class EarthquakeCellViewModel: CellViewModelProtocol {
    // MARK: - Private variables

    private let model: Earthquake

    // MARK: - Public variables

    var source: String {
        Localization.earthquakeSource + model.source
    }

    public var magnitude: String {
        String(model.magnitude)
    }

    public var date: String {
        model.date.convertToDateString()
    }

    public var magnitudeColor: UIColor {
        switch model.magnitude {
        case 0..<3: return .lowRangeColor
        case 3..<8: return .mediumRangeColor
        default: return .highRangeColor
        }
    }

    // MARK: - Init

    public required init?(model: ContentElementProtocol) {
        guard let earthquakeModel = model as? Earthquake else { return nil }
        self.model = earthquakeModel
    }
}
