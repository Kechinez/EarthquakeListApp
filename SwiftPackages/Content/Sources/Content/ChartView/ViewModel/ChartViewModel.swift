import UIKit
import DataModels
import Localization
import Design

public class ChartViewModel {
    // MARK: - Private variables

    private let magnitude: MagnitudeChart

    // MARK: - Public variables

    public var allValues: [String] {
        var values: [String] = []

        for value in magnitude.minValue...magnitude.maxValue {
            values.append(String(value))
        }

        return values.reversed()
    }

    public var coloredChartPartViewHeightRatio: CGFloat {
        CGFloat(magnitude.maxValue) / CGFloat(allValues.count)
    }

    public var givenMagnitudeHeightRatio: CGFloat {
        CGFloat(magnitude.givenValue) / CGFloat(magnitude.maxValue)
    }

    public var gradientColors: [CGColor] {
        [UIColor.highRangeColor, UIColor.mediumRangeColor, UIColor.lowRangeColor].map { $0.cgColor }
    }

    public var gradientLocation: [NSNumber] {
        let lowPoint = NSNumber(value: magnitude.lowRange.upperBound / 10.0)
        let middlePoint = NSNumber(value: magnitude.mediumRange.upperBound / 10.0)
        let maxPoint = NSNumber(value: magnitude.highRange.upperBound / 10.0)

        return [0.0, lowPoint, middlePoint, maxPoint, 1]
    }

    public var info: String {
        Localization.magnitudeChartInfo + magnitude.usedScaleName
    }

    // MARK: - Init

    public init(magnitude: MagnitudeChart) {
        self.magnitude = magnitude
    }
}
