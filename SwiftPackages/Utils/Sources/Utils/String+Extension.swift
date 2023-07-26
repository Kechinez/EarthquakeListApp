import Foundation

public extension String {
    func convertToDateString() -> String {
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.formatOptions = [.withSpaceBetweenDateAndTime, .withFullDate]

        guard let date = dateFormatter.date(from: self) else { return "" }
        
        let toStringFormatter = DateFormatter()
        toStringFormatter.dateFormat = "d MMMM, YYYY"
        
        return toStringFormatter.string(from: date)
    }
}
