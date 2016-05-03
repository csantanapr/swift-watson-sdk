import SwiftyJSON

public struct ObservationResult {

    public let metadata: Metadata
    public let observation: Observation

    public init(json: JSON) {
        metadata = Metadata(json: json["metadata"])
        observation = Observation(json: json["observation"])
    }
}
