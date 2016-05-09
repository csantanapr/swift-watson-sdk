import SwiftyJSON

// Insight for Weather 24HourForecast request object
public struct ForecastHourly {

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

    /// Indicates whether it is daytime or nightime based on the local apparent
    /// time of the location. Range: D = Day, N = Night, X = missing (for
    /// extreme northern and southern hemisphere).
    public let day_ind: String?

    /// The temperature of the air, measured by a thermometer 1.5 meters (4.5
    /// feet) above the ground that is shaded from the other elements. You
    /// will receive this data field in Fahrenheit degrees or Celsius degrees.
    public let temp: Int

    /// The temperature that air must be cooled at constant pressure to reach
    /// saturation. The dew point is also an indirect measure of the humidity
    /// of the air. The dew point will never exceed the temperature. When
    /// a dew point and temperature are equal, clouds or fog will typically
    /// form. The closer the values of temperature and dew point, the higher
    /// the relative humidity.
    public let dewpt: Int?

    /// An apparent temperature that represents what the air temperature "feels
    /// like" on exposed human skin due to the combined effect of warm
    /// temperatures and high humidity. When the temperature is 70ºF or higher,
    /// the "feels like" value represents the computed heat index. For
    /// temperatures between 40ºF and 70ºF, the "feels like" value and
    /// temperature are the same, regardless of wind speed and humidity, so
    /// use the temperature value.
    public let hi: Int?

    /// An apparent temperature that represents what the air temperature "feels
    /// like" on exposed human skin due to the combined effect of the cold
    /// temperatures and wind speed. When the temperature is 61ºF or lower the
    /// "feels like" value represents the computed wind shill so display the
    /// wind chill value. For temperatures between 61ºF and 75ºF, the "feels
    /// like" value and temperature are the same, regardless of wind speed
    /// and humidity, so display the temperature value.
    public let wc: Int?

    /// An apparent temperature that represents what the air temperature "feels
    /// like" on exposed human skin due to the combined effect of the wind
    /// chill or heat index.
    public let feels_like: Int?

    /// Code representing explicit full set sensible weather.
    public let icon_extd: Int

    /// The Weather Man animation code. Based upon the current weather and
    /// the current temperature (TWC use only).
    public let wxman: String?

    /// The key to the weather icon lookup. The data field shows the icon
    /// number that is matched to represent the observed weather conditions.
    public let icon_code: Int

    /// Day of week.
    public let dow: String

    /// 12-character phrase that accompanies the icon_extd. This field is
    /// null for all languages other than US English (en_US).
    public let phrase_12char: String

    /// 22-character phrase that accompanies the icon_extd. This field is
    /// null for all languages other than US English (en_US).
    public let phrase_22char: String

    /// 32-character phrase that accompanies the icon_extd. This field is
    /// translated for all supported langauges.
    public let phrase_32char: String

    /// Part 1 of 3-part hourly sensible weather phrase.
    public let subphrase_pt1: String?

    /// Part 2 of 3-part hourly sensible weather phrase.
    public let subphrase_pt2: String?

    /// Part 3 of 3-part hourly sensible weather phrase.
    public let subphrase_pt3: String?

    /// Hourly maximum probability of precipitation.
    public let pop: Int

    /// The short text describing the expected type of accumulation associated
    /// with the probability of precipitation (POP) display for the hour.
    public let precip_type: String

    /// The forecasted measurable precipitation (liquid or liquid equivalent)
    /// during the hour.
    public let qpf: Double?

    /// The forecasted hourly snow accumulation during the hour.
    public let snow_qpf: Double?

    /// The relative humidity of the air, which is defined as the ratio of the
    /// amount of wator vapor in the air to the amount of vapor required to
    /// bring the air to saturation at a constant temperature. Relative
    /// humidity is always expressed as a percentage.
    public let rh: Int

    /// The wind is treated as a vector, therefore, winds must have direction
    /// and magnitude (speed). The wind information reported in the hourly
    /// current conditions corresponds to a 10-minute average called the
    /// sustained wind speed. Sudden or brief variations in the wind speed
    /// are known as "wind gusts" and are reported in a separate data field.
    /// Wind dorections are always expressed as "from whence the wind blows"
    /// meaning that a North wind blows from North to South. If you face
    /// North in a North wind the wind is at your face. Face southward and the
    /// North wind is at your back.
    public let wspd: Int

    /// The direction from which the wind blows expressed in degrees. The
    /// magnetic direction varies from 0 to 359 degrees, where 0 degrees
    /// indicates the North, 90 degrees the East, 180 degrees the South,
    /// 270 degrees the West, and so forth.
    public let wdir: Int

    /// The cardinal direction from which the wind blows in an abbreviated
    /// form. Wind directions are always expressed as "from whence the wind
    /// blows" meaning that a North wind blows from North to South. If you
    /// face North in a North wind, the wind is at your face. Face southward
    /// and the North wind is at your back.
    public let wdir_cardinal: String

    /// This data field contains information about sudden and temporary
    /// variations of the average wind speed. The report always shows the
    /// maximum wind gust speed recorded during the observation period. It is
    /// a required display field if wind speed is shown. The speed of the gust
    /// can be expressed in miles per hour or kilometers per hour.
    public let gust: Int

    /// Cloud cover description code.
    public let clds: Int?

    /// Prevailing hourly visibility.
    public let vis: Double?

    /// Mean sea level pressure in millibars.
    public let mslp: Double

    /// The nontruncated UV index, which is the intensity of the solar
    /// radiation based on a number of factors.
    public let uv_index_raw: Double?

    /// Hourly maximum UV index.
    public let uv_index: Int?

    /// The UV index description, which complements the UV index value by
    /// providing an associated level of risk of skin damage due to exposure.
    public let uv_desc: String?

    /// A UV warning based on a UV index of 11 or greater.
    public let uv_warning: Int?
    
    /// Expresses the weather conditions for playing golf on a scale of 0 to
    /// 10. Not applicable at night.
    public let golf_index: Int?

    /// The golf index category expressed as a worded phrase for the weather
    /// conditions for playing gold.
    public let golf_category: String?

    /// A number denoting how impactful the forecasted weather is for this
    /// hour. Can be used to determine the graphical treatment of the weather
    /// display such as using red font on weather.com.
    public let severity: Int?

    /// Used internally to initialize a `CurrentObservation` model from JSON.
    public init(json: JSON) {
        data_class = json["class"].stringValue
        expire_time_gmt = json["expire_time_gmt"].intValue
        fcst_valid = json["fcst_valid"].doubleValue
        fcst_valid_local = json["fcst_valid_local"].stringValue
        num = json["num"].int
        day_ind = json["day_ind"].string
        temp = json["temp"].intValue
        dewpt = json["dewpt"].int
        hi = json["hi"].int
        wc = json["wc"].int
        feels_like = json["feels_like"].int
        icon_extd = json["icon_extd"].intValue
        wxman = json["wxman"].string
        icon_code = json["icon_code"].intValue
        dow = json["dow"].stringValue
        phrase_12char = json["phrase_12char"].stringValue
        phrase_22char = json["phrase_22char"].stringValue
        phrase_32char = json["phrase_32char"].stringValue
        subphrase_pt1 = json["subphrase_pt1"].string
        subphrase_pt2 = json["subphrase_pt2"].string
        subphrase_pt3 = json["subphrase_pt3"].string
        pop = json["pop"].intValue
        precip_type = json["precip_type"].stringValue
        qpf = json["qpf"].double
        snow_qpf = json["snow_qpf"].double
        rh = json["rh"].intValue
        wspd = json["wspd"].intValue
        wdir = json["wdir"].intValue
        wdir_cardinal = json["wdir_cardinal"].stringValue
        gust = json["gust"].intValue
        clds = json["clds"].int
        vis = json["vis"].double
        mslp = json["mslp"].doubleValue
        uv_index_raw = json["uv_index_raw"].double
        uv_index = json["uv_index"].int
        uv_desc = json["uv_desc"].string
        uv_warning = json["uv_warning"].int
        golf_index = json["golf_index"].int
        golf_category = json["golf_category"].string
        severity = json["severity"].int
    }
}
