import UIKit

/// Custom colors
public extension UIColor {
    private static var fallbackColor: UIColor = .black
    
    static var earthquakeCellShadow: UIColor { .init(named: "earthquakeCellShadow", in: .module, compatibleWith: nil) ?? fallbackColor }
    static var charBorder: UIColor { .init(named: "charBorder", in: .module, compatibleWith: nil) ?? fallbackColor }
    static var chartInfo: UIColor { .init(named: "chartinfo", in: .module, compatibleWith: nil) ?? fallbackColor }
    static var highRangeColor: UIColor { .init(named: "highRangeColor", in: .module, compatibleWith: nil) ?? fallbackColor }
    static var lowRangeColor: UIColor { .init(named: "lowRangeColor", in: .module, compatibleWith: nil) ?? fallbackColor }
    static var mediumRangeColor: UIColor { .init(named: "mediumRangeColor", in: .module, compatibleWith: nil) ?? fallbackColor }
    static var standardWhite: UIColor { .init(named: "standardWhite", in: .module, compatibleWith: nil) ?? fallbackColor }
}
