import Foundation

public enum Result<Value, Error: ErrorProtocol> {
    case Success(Value)
    case Failure(Error)
}