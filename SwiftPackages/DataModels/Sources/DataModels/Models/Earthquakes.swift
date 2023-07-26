import Foundation

/// Earthquakes model
public struct Earthquakes: ContentElementProtocol {
    public let earthquakes: [Earthquake]
    
#if DEBUG

    public init(earthquakes: [Earthquake]) {
        self.earthquakes = earthquakes
    }

#endif
}

