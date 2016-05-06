import SwiftyJSON

public struct ForecastDailyResult {

    public let metadata: Metadata
    public let forecasts: [ForecastDaily]

    public init(json: JSON) {
        metadata = Metadata(json: json["metadata"])
        forecasts = json["forecasts"].arrayValue.map(ForecastDaily.init)
    }
}
