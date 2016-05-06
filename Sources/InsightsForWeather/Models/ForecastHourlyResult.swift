import SwiftyJSON

public struct ForecastHourlyResult {

    public let metadata: Metadata
    public let forecasts: [ForecastHourly]

    public init(json: JSON) {
        metadata = Metadata(json: json["metadata"])
        forecasts = json["forecasts"].arrayValue.map(ForecastHourly.init)
    }
}
