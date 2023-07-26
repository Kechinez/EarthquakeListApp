import Foundation

/// MagnitudeChart model
public struct MagnitudeChart: ContentElementProtocol {
    public let maxValue: Int
    public let minValue: Int
    public let lowRange: Range<Double>
    public let highRange: Range<Double>
    public let mediumRange: Range<Double>
    public let givenValue: Double
    public let usedScaleName: String
}

public extension MagnitudeChart {
    /// init model with Richter magnitude scale
    init(richterScaleWith value: Double) {
        maxValue = 10
        minValue = 0
        givenValue = value
        lowRange = 0..<5
        mediumRange = 5..<8
        highRange = 8..<11
        usedScaleName = "Richter magnitude scale"
    }
}
