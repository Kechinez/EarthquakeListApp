import Foundation
import Networking
import DataModels
import MapKit

final public class EarthquakeDetailsViewModel {
    // MARK: - Private variables

    private let model: Earthquake
    private let regionRadius: CLLocationDistance = 1000000

    // MARK: - Internal variables

    var coordinateRegion: MKCoordinateRegion {
        let location = CLLocation(latitude: model.latitude, longitude: model.longitude)
        return MKCoordinateRegion(
          center: location.coordinate,
          latitudinalMeters: regionRadius,
          longitudinalMeters: regionRadius)
    }

    var chartViewModel: ChartViewModel {
        ChartViewModel.init(magnitude: .init(richterScaleWith: model.magnitude))
    }

    // MARK: - Init

    public init(model: Earthquake) {
        self.model = model
    }
}
