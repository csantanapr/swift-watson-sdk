import SwiftyJSON

// Insight for Weather request object
public struct Metadata {

    /// The version number of the API.
    public let version: String

    /// Transcation id for this call of the API.
    public let transaction_id: String

    /// Echo parameter displaying the requested latitude for a location's
    /// forecast. Only populated when the API is called for geocode.
    public let latitude: Double
    
    /// Echo parameter displaying the requested longitude for a location's
    /// forecast. Only populated when the API is called for geocode.
    public let longitude: Double

    /// Echo parameter displaying the default or requested translation
    /// language for response text.
    public let language: String

    /// Echo parameter displaying the default or requested units of measure
    /// (UOM) for various numeric values.
    public let units: String

    /// Used internally to initialize a `CurrentObservation` model from JSON.
    public init(json: JSON) {
        version = json["version"].stringValue
        transaction_id = json["transaction_id"].stringValue
        latitude = json["latitude"].doubleValue
        longitude = json["longitude"].doubleValue
        language = json["language"].stringValue
        units = json["units"].stringValue
    }
}
