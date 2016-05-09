import SwiftyJSON

// Insight for Weather TimeSeries request object
public struct TimeSeriesObservation {

    /// Primary data field to group or access data for. Range: Same as observation station id.
    public let key: String

    /// Data identifier.
    public let data_class: String

    /// Absolute expiration time that is used to implement a common, system-wide method of data
    /// and cache expiration.
    public let expire_time_gmt: Double

    /// Observation station id.
    public let obs_id: String

    /// Observation station name.
    public let obs_name: String

    /// Valid time of observation as a Unix epoch value (seconds since start of 1970, UTC).
    public let valid_time_gmt: Double

    /// Daytime or nighttime of the local apparent time of the location. Range: D = Day, N = Night,
    /// X = Missing (for extreme northern and southern hemisphere).
    public let day_ind: String?

    /// The two-digit number that represents the observed weather conditions. Range: 0 to 48.
    public let wx_icon: Int

    /// The four-digit number that represents the observed weather conditions.
    public let icon_extd: Int

    /// The temperature of the air, at the time of the observation, measured by a thermometer
    /// 1.5 meters (4.5 feet) above the ground that is shaded from the other elements.
    public let temp: Int

    /// High temperature in the last 24 hours.
    public let max_temp: Int?

    /// Low temperature in the last 24 hours.
    public let min_temp: Int?

    /// The temperature that air must be cooled at constant pressure to reach saturation. The dew
    /// point is also an indirect measure of the humidity of the air. The dew point will never
    /// exceed the temperature. When the dew point and temperature and equal, clouds or fog will
    /// typically form. The closer the values of temperature and dew point, the higher the
    /// relative humidity.
    public let dewpt: Int?

    /// The relative humidity of the air, which is defined as the ratio of the amount of water
    /// vapor in the air to the amount of vapor required to bring the air to saturation at a
    /// constant temperature. Relative humidity is always expressed as a percentage.
    public let rh: Int?

    /// An apparent temperature that represents what the air temperature feels like on exposed
    /// human skin due to the combined effect of the wind chill or heat index. When the temperature
    /// is 40ºF or lower the "feels like" value represents the computed wind chill so display the
    /// wind chill value. When the temperature is 70ºF or higher, the "feels like" value represents
    /// the computed heat index so display the heat index value. For temperature between 40ºF and
    /// 70ºF, the "feels like" value and temperature are the same, regardless of wind speed and
    /// humidity, so display the temperature value.
    public let feels_like: Int?

    /// An apparent temperature that represents what the air temperature feels like on exposed
    /// human skin due to the combined effect of warm temperatures and high humidity. When the
    /// temperature is 70ºF or higher, the "feels like" value represents the computed heat index.
    /// For temperatures between 40ºF and 70ºF, the "feels like" value and temperature are the
    /// same, regardless of wind speed and humidity, so use the temperature value.
    public let heat_index: Int?

    /// An apparent temperature. It represents what the air temperature feels like on exposed
    /// human skin due to the combined effect of the cold temperatures and wind speed. When the
    /// temperature is 61ºF or lower, the "feels_like" value represents the computed wind chill
    /// so display the wind chill value. For temperatures between 61ºF and 75ºF, the "feels like"
    /// value and temperature and the same, regardless of wind speed and humidity, so display the
    /// temperature value.
    public let wc: Int?

    /// A text description of the observed weather conditions at the reporting station.
    public let wx_phrase: String?

    /// Weather description qualifier code.
    public let qualifier: String?

    /// Weather description qualifier severity.
    public let qualifier_svrty: String?

    /// Weather description qualifier short phrase.
    public let blunt_phrase: String?

    /// Weather description qualifier terse phrase.
    public let terse_phrase: String?

    /// Barometric pressure is the pressure exerted by the atmosphere at the earth's surface,
    /// due to the weight of the air. This value is read directly from an instrument called a
    /// mercury barometer and its units are expressed in millibars (equivalent to HectoPascals).
    public let pressure: Double?

    /// A phrase describing the change in the barometric pressure reading over the last hour.
    /// Range: Steady, Rising, Rapidly Rising, Falling, Rapidly Falling
    public let pressure_desc: String?

    /// The change in the barometric pressure reading over the last hour expressed as an integer.
    /// 0 = Steady, 1 = Rising or Rapidly Rising, 2 = Falling or Rapidly Falling
    public let pressure_tend: Int?

    /// Cloud cover description code. Range: SKC, CLR, SCT, FEW, BKN, OVC
    public let clds: String?

    /// The horizontal visibility at the observation point. Visibilities can be reported as
    /// fractional values particularly when visibility is less than 2 miles. Visibilities greater
    /// than 10 statue miles (16.1 kilometers) that are considered unlimited are reported as
    /// 999 in your feed. You can also find visibility values that equal zero. This occurrence
    /// is not wrong. Dense fogs and heavy snows can produce values near zero. Fog, smoke, heavy
    /// rain and other weather phenomena can reduce visibility to near zero miles or kilometers.
    public let vis: Double?

    /// Wind speed. The wind is treated as a vector, therefore, winds must have direction and
    /// magnitude (speed). The wind information reported in the hourly current conditions
    /// corresponds to a 10-minute average called the sustained wind speed. Sudden or brief
    /// variations in the wind speed are known as wind gusts and are reported in a separate
    /// data field. Wind directions are always expressed as "from whence the wind blows." For
    /// example, a North wind blows from North to South. If you face North in a North wind the
    /// wind is at your face. Face southward and the North wind is at your back.
    public let wspd: Int?

    /// Wind gust speed. This data field contains information about sudden and temporary
    /// variations of the average wind speed. The report always shows the maximum wind gust
    /// speed recorded during the observation period. If wind speed is shown, this field must
    /// be displayed. The speed of the gust can be expressed in miles per hour or kilometers per
    /// hour.
    public let gust: Int?

    /// The direction from which the wind blows, expressed in degrees. The magnetic direction
    /// varies from 0 to 359 degrees, where 0º indicates the North, 90º the East, 180º the South,
    /// 270º the West, and so forth.
    public let wdir: Int?

    /// The cardinal direction from which the wind blows in an abbreviated form. Wind directions
    /// are always expressed as "from whence the wind blows." For example, a North wind blows from
    /// North to South. If you face North in a North wind, the wind is at your face. Face southward
    /// and the North wind is at your back.
    public let wdir_cardinal: String

    /// Precipitation amount in the last 24 hours.
    public let precip_total: Double?

    /// Precipitation for the last hour.
    public let precip_hrly: Double?

    /// Snow increasing rapidly in inches or centimeters per hour depending on whether or not
    /// the snowfall is reported by METAR or TECCI (synthetic observations). METAR snow
    /// accumulation for the last hour is in inches and TECCI is in centimeters. Range: 0 to 15.
    public let snow_hrly: Double?

    /// Ultraviolet index. Range: 0 to 11 and 999.
    public let uv_index: Int?

    /// Ultraviolet index description.
    /// Range: Extreme, High, Low, Minimal, Moderate, No Report, Not Available.
    public let uv_desc: String?

    /// Used internally to initialize a `CurrentObservation` model from JSON.
    public init(json: JSON) {
        key = json["key"].stringValue
        data_class = json["class"].stringValue
        expire_time_gmt = json["expire_time_gmt"].doubleValue
        obs_id = json["obs_id"].stringValue
        obs_name = json["obs_name"].stringValue
        valid_time_gmt = json["valid_time_gmt"].doubleValue
        day_ind = json["day_ind"].string
        wx_icon = json["wx_icon"].intValue
        icon_extd = json["icon_extd"].intValue
        temp = json["temp"].intValue
        max_temp = json["max_temp"].int
        min_temp = json["min_temp"].int
        dewpt = json["dewpt"].int
        rh = json["rh"].int
        feels_like = json["feels_like"].int
        heat_index = json["heat_index"].int
        wc = json["wc"].int
        wx_phrase = json["wx_phrase"].string
        qualifier = json["qualifier"].string
        qualifier_svrty = json["qualifier_svrty"].string
        blunt_phrase = json["blunt_phrase"].string
        terse_phrase = json["terse_phrase"].string
        pressure = json["pressure"].double
        pressure_desc = json["pressure_desc"].string
        pressure_tend = json["pressure_tend"].int
        clds = json["clds"].string
        vis = json["vis"].double
        wspd = json["wspd"].int
        gust = json["gust"].int
        wdir = json["wdir"].int
        wdir_cardinal = json["wdir_cardinal"].stringValue
        precip_total = json["precip_total"].double
        precip_hrly = json["precip_hrly"].double
        snow_hrly = json["snow_hrly"].double
        uv_index = json["uv_index"].int
        uv_desc = json["uv_desc"].string
    }
}
