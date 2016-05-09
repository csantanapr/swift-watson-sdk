import SwiftyJSON

// Insight for Weather CurrentForecast request object
public struct Measurement {

    /// The wind is treated as a vector, therefore, winds must have direction
    /// and magnitude (speed). The wind information reported in the hourly
    /// current conditions corresponds to a 10-minute average called the
    /// sustained wind speed. Sudden or brief variations in the wind speed
    /// are known as "wind gusts" and are reported in a separate data field.
    /// Wind dorections are always expressed as "from whence the wind blows"
    /// meaning that a North wind blows from North to South. If you face
    /// North in a North wind the wind is at your face. Face southward and the
    /// North wind is at your back.
    public let wspd: Int?
    
    /// This data field contains information about sudden and temporary
    /// variations of the average wind speed. The report always shows the
    /// maximum wind gust speed recorded during the observation period. It is
    /// a required display field if wind speed is shown. The speed of the gust
    /// can be expressed in miles per hour or kilometers per hour.
    public let gust: Int?
    
    /// Prevailing visibility with two decimal place accuracy, zero filled.
    public let vis: Double?
    
    /// Mean sea level pressure in millibars.
    public let mslp: Double
    
    /// Barometric pressure is the pressure exerted by the atmosphere at the
    /// Earth's surface due to the weight of the air. Expressed in inches of
    /// mercury when units=a (that is, units='US'), expressed in millibars
    /// when units=Metric, Hybrid, or Metric_SI.
    public let altimeter: Double?
    
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
    
    /// The relative humidity of the air, which is defined as the ratio of the
    /// amount of wator vapor in the air to the amount of vapor required to
    /// bring the air to saturation at a constant temperature. Relative
    /// humidity is always expressed as a percentage.
    public let rh: Int?
    
    /// An apparent temperature that represents what the air temperature "feels
    /// like" on exposed human skin due to the combined effect of the cold
    /// temperatures and wind speed. When the temperature is 61ºF or lower the
    /// "feels like" value represents the computed wind shill so display the
    /// wind chill value. For temperatures between 61ºF and 75ºF, the "feels
    /// like" value and temperature are the same, regardless of wind speed
    /// and humidity, so display the temperature value.
    public let wc: Int?
    
    /// An apparent temperature that represents what the air temperature "feels
    /// like" on exposed human skin due to the combined effect of warm
    /// temperatures and high humidity. When the temperature is 70ºF or higher,
    /// the "feels like" value represents the computed heat index. For
    /// temperatures between 40ºF and 70ºF, the "feels like" value and
    /// temperature are the same, regardless of wind speed and humidity, so
    /// use the temperature value.
    public let hi: Int?
    
    /// Change in temperature compared to the report 24 hours ago. This field
    /// will be null outside of CONUS and Europe.
    public let temp_change_24hour: Int?
    
    /// Max temperature in the last 24 hours. This field will be null outside
    /// of CONUS and Europe.
    public let temp_max_24hour: Int?
    
    /// Min temperature in the last 24 hours. This field will be null outside
    /// of CONUS and Europe.
    public let temp_min_24hour: Int?
    
    /// Change in pressure in the last three hours (inches of mercury for
    /// units=US, millibars otherwise). This field will be null outside of
    /// CONUS and Europe.
    public let pchange: Double?
    
    /// An apparent temperature that represents what the air temperature "feels
    /// like" on exposed human skin due to the combined effect of the wind
    /// chill or heat index.
    public let feels_like: Int?
    
    /// Rolling one-hour snowfall amount. This field will be null outside of
    /// CONUS and Europe.
    public let snow_1hour: Double?
    
    /// Rolling six-hour snowfall amount. This field will be null outside of
    /// CONUS and Europe.
    public let snow_6hour: Double?
    
    /// Rolling twenty-four-hour snowfall amount. This field will be null
    /// outside of CONUS and Europe.
    public let snow_24hour: Double?
    
    /// The snowfall since 00Z at the beginning of the current month. This
    /// field will be null outside of CONUS.
    public let snow_mtd: Double?
    
    /// The snowfall since 00Z July 1. This field will be null outside of
    /// CONUS.
    public let snow_season: Double?
    
    /// The snowfall sinze 00Z January 1. This field will be null outside of
    /// CONUS.
    public let snow_ytd: Double?
    
    /// Rolling 48-hour snowfall amount. This field will be null outside of
    /// CONUS.
    public let snow_2day: Double?
    
    /// Rolling 72-hour snowfall amount. This field will be null outside of
    /// CONUS.
    public let snow_3day: Double?
    
    /// Rolling 7-day snowfall amount. This field will be null outside of
    /// CONUS.
    public let snow_7day: Double?
    
    /// Base of lowest Mostly Cloudy or Cloudy layer. This field can be null
    /// for any geographic location depending on weather conditions.
    public let ceiling: Int?
    
    /// Rolling 1-hour liquid precipitation amount. This field will be null
    /// outside of CONUS and Europe.
    public let precip_1hour: Double?
    
    /// Rolling 6-hour liquid precipitation amount. This field will be null
    /// outside of CONUS and Europe.
    public let precip_6hour: Double?
    
    /// Rolling 24-hour liquid precipitation amount. This field will be null
    /// outside of CONUS and Europe.
    public let precip_24hour: Double?
    
    /// Liquid precipitation since 00Z at the beginning of the current month.
    /// This field will be null outside of CONUS.
    public let precip_mtd: Double?
    
    /// Liquid precipitation since 00Z, January 1. This field will be null
    /// outside of CONUS.
    public let precip_ytd: Double?
    
    /// Rolling 48-hour liquid precipitation. This field will be null outside
    /// of CONUS.
    public let precip_2day: Double?
    
    /// Rolling 72-hour liquid precipitation. This field will be null outside
    /// of CONUS.
    public let precip_3day: Double?
    
    /// Rolling 7-day liquid precipitation. This field will be null outside
    /// of CONUS.
    public let precip_7day: Double?

    /// Used internally to initialize a `CurrentObservation` model from JSON.
    public init(json: JSON) {
        wspd = json["wspd"].int
        gust = json["gust"].int
        vis = json["vis"].double
        mslp = json["mslp"].doubleValue
        altimeter = json["altimeter"].double
        temp = json["temp"].intValue
        dewpt = json["dewpt"].int
        rh = json["rh"].int
        wc = json["wc"].int
        hi = json["hi"].int
        temp_change_24hour = json["temp_change_24hour"].int
        temp_max_24hour = json["temp_max_24hour"].int
        temp_min_24hour = json["temp_min_24hour"].int
        pchange = json["pchange"].double
        feels_like = json["feels_like"].int
        snow_1hour = json["snow_1hour"].double
        snow_6hour = json["snow_6hour"].double
        snow_24hour = json["snow_24hour"].double
        snow_mtd = json["snow_mtd"].double
        snow_season = json["snow_season"].double
        snow_ytd = json["snow_ytd"].double
        snow_2day = json["snow_2day"].double
        snow_3day = json["snow_3day"].double
        snow_7day = json["snow_7day"].double
        ceiling = json["ceiling"].int
        precip_1hour = json["precip_1hour"].double
        precip_6hour = json["precip_6hour"].double
        precip_24hour = json["precip_24hour"].double
        precip_mtd = json["precip_mtd"].double
        precip_ytd = json["precip_ytd"].double
        precip_2day = json["precip_2day"].double
        precip_3day = json["precip_3day"].double
        precip_7day = json["precip_7day"].double
    }
    
}
