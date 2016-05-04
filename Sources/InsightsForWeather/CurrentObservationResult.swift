import SwiftyJSON

public struct CurrentObservationResult {

    public let metadata: Metadata
    public let observation: CurrentObservation

    public init(json: JSON) {
        metadata = Metadata(json: json["metadata"])
        observation = CurrentObservation(json: json["observation"])
    }
}
