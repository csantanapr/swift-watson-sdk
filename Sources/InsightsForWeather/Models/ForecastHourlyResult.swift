import SwiftyJSON

// Insight for Weather 24HourForecast request object
public struct ForecastHourlyResult {

    /// A specific set of properties that span accross all weather calls.
    public let metadata: Metadata
    public let forecasts: [ForecastHourly]

    /// Used internally to initialize a `CurrentObservation` model from JSON.
    public init(json: JSON) {
        metadata = Metadata(json: json["metadata"])
        forecasts = json["forecasts"].arrayValue.map(ForecastHourly.init)
    }
}
