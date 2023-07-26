import Foundation

/// Earthquake model
public struct Earthquake: ContentElementProtocol {
    public let source: String
    public let longitude: Double
    public let latitude: Double
    public let date: String
    public let magnitude: Double

    private enum CodingKeys: String, CodingKey {
        case source = "src"
        case longitude = "lng"
        case latitude = "lat"
        case date = "datetime"
        case magnitude
    }

    public init(source: String, longitude: Double, latitude: Double, date: String, magnitude: Double) {
        self.source = source
        self.longitude = longitude
        self.latitude = latitude
        self.date = date
        self.magnitude = magnitude
    }
}
