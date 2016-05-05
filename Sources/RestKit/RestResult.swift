import Foundation

public enum Result<Value, Error: ErrorProtocol> {
    case success(Value)
    case failure(Error)
}