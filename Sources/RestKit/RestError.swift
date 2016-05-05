import Foundation

public enum RestError: ErrorProtocol {
    case badResponse(String)
    case badData(String)
    case unknown
}