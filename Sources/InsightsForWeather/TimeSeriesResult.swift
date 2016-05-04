import SwiftyJSON

public struct TimeSeriesResult {

    public let metadata: Metadata
    public let observation: TimeSeriesObservation

    public init(json: JSON) {
        metadata = Metadata(json: json["metadata"])
        observation = TimeSeriesObservation(json: json["observation"])
    }
}
