import SwiftyJSON

// Insight for Weather TimeSeries request object
public struct TimeSeriesResult {

    /// A specific set of properties that span accross all weather calls.
    public let metadata: Metadata
    public let observation: TimeSeriesObservation

    /// Used internally to initialize a `CurrentObservation` model from JSON.
    public init(json: JSON) {
        metadata = Metadata(json: json["metadata"])
        observation = TimeSeriesObservation(json: json["observation"])
    }
}
