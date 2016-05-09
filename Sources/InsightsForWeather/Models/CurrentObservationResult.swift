import SwiftyJSON

// Insight for Weather CurrentForecast request object
public struct CurrentObservationResult {

    /// A specific set of properties that span accross all weather calls.
    public let metadata: Metadata
    
    /// An object representing the CurrentForecast request
    public let observation: CurrentObservation

    /// Used internally to initialize a `CurrentObservationResult` model from JSON.
    public init(json: JSON) {
        metadata = Metadata(json: json["metadata"])
        observation = CurrentObservation(json: json["observation"])
    }
}
