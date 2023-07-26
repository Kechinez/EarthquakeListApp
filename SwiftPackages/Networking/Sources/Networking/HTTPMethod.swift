import Foundation

/// HTTPMethods
public enum HTTPMethod: String {
  case get = "GET"
  case post = "POST"
  case put = "PUT"
}

public typealias Parameters = [String: Any]
