import SwiftyJSON

// Insight for Weather 10DayForecast request object
public struct ForecastDailyResult {

    /// A specific set of properties that span accross all weather calls.
    public let metadata: Metadata
    
    /// An array object representing part of the 10DayForecast request
    public let forecasts: [ForecastDaily]

    /// Used internally to initialize a `CurrentObservation` model from JSON.
    public init(json: JSON) {
        metadata = Metadata(json: json["metadata"])
        forecasts = json["forecasts"].arrayValue.map(ForecastDaily.init)
    }
}
