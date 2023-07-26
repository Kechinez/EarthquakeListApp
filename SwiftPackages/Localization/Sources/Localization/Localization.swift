import Foundation

/// App localization
public enum Localization {
    // MARK: - Private variables

    private typealias LocalizedData = [String: String]
    private static var localizationData = LocalizedData()

    // MARK: - Public methods

    public static func loadData() {
        if let url = Bundle.module.url(forResource: "Localization", withExtension: "json"),
           let localizedData = try? String(contentsOf: url) {
            loadData(from: localizedData)
        }
    }

    // MARK: - Private methods

    private static func value(for key: String) -> String {
        if let localizedString = localizationData[key] {
            return localizedString
        }

        return ""
    }

    private static func loadData(from source: String?) {
        do {
            if let data = source?.data(using: .utf8),
               let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? LocalizedData {
                Self.localizationData = json
            }
        } catch {
            print("Error: Localization not loaded")
        }
    }

    // MARK: - Localization values

    public static let magnitudeChartInfo = value(for: "magnitudeChartInfo")
    public static let detailsTitle = value(for: "detailsTitle")
    public static let listTitle = value(for: "listTitle")
    public static let networkErrorTitle = value(for: "networkErrorTitle")
    public static let networkErrorButtonTitle = value(for: "networkErrorTitle")
    public static let earthquakeSource = value(for: "earthquakeSource")
}
