import SwiftyJSON

// Insight for Weather 10DayForecast request object
public struct ForecastDaily {

    /// Data identifier.
    public let data_class: String

    /// Expiration time in UNIX seconds.
    public let expire_time_gmt: Int

    /// Time forecast is valid in UNIX seconds.
    public let fcst_valid: Double

    /// Time forecast is valid in local apparent time.
    public let fcst_valid_local: String

    /// The sequential number that identifies each of the forecasted days in
    /// the API. They start on day 1, which is the forecast for the current
    /// day. Then the forecast for tomorrow uses number 2, then number 3 for
    /// the day after tomorrow, and so forth.
    public let num: Int?

    /// Daily maximum temperature.
    public let max_temp: Int

    /// Daily minimum temperature.
    public let min_temp: Int

    /// The estimate of the likelihood of tornado activity during a given
    /// 24-hour forecast period.
    public let torcon: Int?

    /// The estimate of the likelihood of winter storm activity during a given
    /// 24-hour forecast period.
    public let stormcon: Int?

    /// A handwritten local or regional text forecast created by a
    /// meteorologist to supplement the system generated forecast.
    public let blurb: String

    /// The name initials of the meteorologist who authored the forecast blurb.
    public let blurb_author: String

    /// Day of week.
    public let dow: String

    /// Three character short code for lunar phases.
    public let lunar_phase_code: String

    /// Description phrase for the current lunar phase.
    public let lunar_phase: String

    /// Day number within monthly lunar cycle.
    public let lunar_phase_day: Int

    /// The local time of the sunrise. This field reflects any local daylight
    /// savings conventions. For a few Arctic and Antarctic regions, the
    /// sunrise and sunset data values may be the same (each with a value of
    /// 12:01am) to reflect conditions where a sunrise or sunset does not
    /// occur.
    public let sunrise: String

    /// The local time of the sunet. This field reflects any local daylight
    /// savings conventions. For a few Arctic and Antarctic regions, the
    /// sunrise and sunset data values may be the same (each with a value of
    /// 12:01am) to reflect conditions where a sunrise or sunset does not
    /// occur.
    public let sunset: String

    /// First moonrise in local time. This field reflects daylight savings
    /// time conventions.
    public let moonrise: String

    /// First moonset in local time. This field reflects daylight savings
    /// time conventions.
    public let moonset: String

    /// A code for special forecasted weather criteria for the 12- and 24-hour
    /// day parts.
    public let qualifier_code: String

    /// A phrase associated with the qualifier_code that describes special
    /// forecasted weather criteria for the 12- and 24-hour day parts.
    public let qualifier: String

    /// The narrative forecast for the 24-hour period.
    public let narrative: String

    /// The forecasted measurable precipitation (liquid or liquid equivalent)
    /// during the 12- or 24-hour forecast period.
    public let qpf: Double

    /// The forecasted measureable precipitation as snow during the 12- or
    /// 24-hour forecast period.
    public let snow_qpf: Double?

    /// The expected amount of residual snow for the 12- or 24-hour forecast
    /// period.
    public let snow_range: String?

    /// A shortened text description of the forecasted snow accumulation
    /// during the 12- or 24-hour forecast period.
    public let snow_phrase: String?

    /// Residual snow accumulation code for the 12- or 24-hour forecast period.
    public let snow_code: String?

    /// Daily - Daytime.
    public let day: Daily?

    /// Daily - Nighttime.
    public let night: Daily?

    /// Used internally to initialize a `CurrentObservation` model from JSON.
    public init(json: JSON) {
        data_class = json["class"].stringValue
        expire_time_gmt = json["expire_time_gmt"].intValue
        fcst_valid = json["fcst_valid"].doubleValue
        fcst_valid_local = json["fcst_valid_local"].stringValue
        num = json["num"].int
        max_temp = json["max_temp"].intValue
        min_temp = json["min_temp"].intValue
        torcon = json["torcon"].int
        stormcon = json["stormcon"].int
        blurb = json["blurb"].stringValue
        blurb_author = json["blurb_author"].stringValue
        dow = json["dow"].stringValue
        lunar_phase_code = json["lunar_phase_code"].stringValue
        lunar_phase = json["lunar_phase"].stringValue
        lunar_phase_day = json["lunar_phase_day"].intValue
        sunrise = json["sunrise"].stringValue
        sunset = json["sunset"].stringValue
        moonrise = json["moonrise"].stringValue
        moonset = json["moonset"].stringValue
        qualifier_code = json["qualifier_code"].stringValue
        qualifier = json["qualifier"].stringValue
        narrative = json["narrative"].stringValue
        qpf = json["qpf"].doubleValue
        snow_qpf = json["snow_qpf"].double
        snow_range = json["snow_range"].string
        snow_phrase = json["snow_phrase"].string
        snow_code = json["snow_code"].string
        day = Daily(json: json["day"])
        night = Daily(json: json["night"])
    }
}
