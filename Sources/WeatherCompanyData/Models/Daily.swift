/**
 * Copyright IBM Corporation 2016
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 **/

import SwiftyJSON

// Insight for Weather 10DayForecast request object
public struct Daily {

    /// Data identifier.
    public let data_class: String

    /// Expiration time in UNIX seconds.
    public let expire_time_gmt: Double

    /// Time forecast is valid in UNIX seconds.
    public let fcst_valid: Double

    /// Time forecast is valid in local apparent time.
    public let fcst_valid_local: String?

    /// Day or night indicator.
    public let day_ind: String

    /// The enumeration of thunderstorm probability within an area for a
    /// 12-hour day part. Range: 0 through 5.
    public let thunder_enum: Int?

    /// The description of probability thunderstorm activity in an area for a
    /// 12-hour day part.
    public let thunder_enum_phrase: String?

    /// The name of a 12-hour day part not including day names in the first 48
    /// hours. Range: Today, Tonight.
    public let daypart_name: String

    /// The named time frame for the valid weather forecast in an expanded
    /// format. The names time frame can be either for 12-hour periods or
    /// 24-hour periods.
    public let long_daypart_name: String?

    /// A specialized version of the dayport_name field. Certain holidays or
    /// historic events may replace the usual daypart_name.
    public let alt_daypart_name: String?

    /// The sequential number that identifies each of the forecasted days in
    /// the API. They start on day 1, which is the forecast for the current
    /// day. Then the forecast for tomorrow uses number 2, then number 3 for
    /// the day after tomorrow, and so forth.
    public let num: Int?

    /// The forecasted temperature for midpoint day (1pm) or midpoint night
    /// (1am) for a 12-hour day part.
    public let temp: Int

    /// The short phrase containing the forecasted high or low temperature for
    /// 12-hour forecast period.
    public let temp_phrase: String?

    /// Daytime maximum heat index. An apparent temperature that represents
    /// what the air temperature "feels like" on exposed human skin due to the
    /// combined effect of warm temperatures and high humidity. When the
    /// temperature is 70ºF or higher, the "feels like" value represents the
    /// computed heat index. For temperatures between 40ºF and 70ºF, the "feels
    /// like" value and temperature are the same, regardless of wind speed and
    /// humidity, so use the temperature value.
    public let hi: Int?
    
    /// Nighttime minimum wind chill. An apparent temperature that represents
    /// what the air temperature "feels like" on exposed human skin due to the
    /// combined effect of the cold temperatures and wind speed. When the
    /// temperature is 61ºF or lower the "feels like" value represents the
    /// computed wind shill so display the wind chill value. For temperatures
    /// between 61ºF and 75ºF, the "feels like" value and temperature are the
    /// same, regardless of wind speed and humidity, so display the temperature
    /// value.
    public let wc: Int?

    /// Daytime maximum probability of precipitation.
    public let pop: Int

    /// Daytime probability of precipitation phrase.
    public let pop_phrase: String?

    /// Code representing explicit full set sensible weather. Please refer
    /// to the Forecast Icon Code, Weather Phrases, and Images document.
    public let icon_extd: Int

    /// The key to the weather icon lookup. The data field shows the icon
    /// number that is matched to represent the observed weather conditions.
    /// Please refer to the Forecast Icon Code, Weather Phrases, and Images
    /// document.
    public let icon_code: Int

    /// The Weather Man animation code. Based upon the current weather and
    /// the current temperature (TWC use only).
    public let wxman: String?

    /// Daytime sensible weather phrase.
    public let phrase_32char: String

    /// Daytime sensible weather phrase.
    public let phrase_22char: String

    /// Daytime sensible weather phrase.
    public let phrase_12char: String

    /// Part 1 of 3-part daytime sensible weather phrase.
    public let subphrase_pt1: String?

    /// Part 2 of 3-part daytime sensible weather phrase.
    public let subphrase_pt2: String?

    /// Part 3 of 3-part daytime sensible weather phrase.
    public let subphrase_pt3: String?

    /// Type of precipitation to display with the probability of precipitation
    /// (POP) data element.
    public let precip_type: String

    /// The daytime relative humidity of the air, which is defined as the ratio
    /// of the amount of wator vapor in the air to the amount of vapor required
    /// to bring the air to saturation at a constant temperature. Relative
    /// humidity is always expressed as a percentage.
    public let rh: Int

    /// The maximum forecasted daytime wind speed. The wind is treated as a
    /// vector, therefore, winds must have direction and magnitude (speed).
    /// The wind information reported in the hourly current conditions
    /// corresponds to a 10-minute average called the sustained wind speed.
    /// Sudden or brief variations in the wind speed are known as "wind gusts"
    /// and are reported in a separate data field. Wind dorections are always
    /// expressed as "from whence the wind blows" meaning that a North wind
    /// blows from North to South. If you face North in a North wind the wind
    /// is at your face. Face southward and the North wind is at your back.
    public let wspd: Int

    /// Daytime average wind direction in magnetic notation.
    public let wdir: Int

    /// Daytime average wind direction in cardinal notation.
    public let wdir_cardinal: String

    /// The phrase that describes the wind direction and speed for a 12-hour
    /// day part.
    public let wind_phrase: String

    /// Daytime average cloud cover expressed as a percentage.
    public let clds: Int

    /// An abbreviated sensible weather portion of narrative forecast.
    public let shortcast: String

    /// The narrative forecast for the daytime period.
    public let narrative: String

    /// The forecasted measureable precipitation (liquid or liquid equivalent)
    /// during the 12-hour forecast period.
    public let qpf: Double?

    /// An accumulation phrase of any precipitation type in the 12-hour
    /// forecase period.
    public let accumulation_phrase: String?

    /// The forecasted measurable precipitation as snow during the 12-hour
    /// forecast period.
    public let snow_qpf: Double?

    /// Snow accumulation amount for the 12-hour forecast period.
    public let snow_range: Double?

    /// Snow accumulation phrase for the 12-hour forecast period.
    public let snow_phrase: String?

    /// Residual snow accumulation code for the 12-hour or 24-hour forecast
    /// period.
    public let snow_code: String?

    /// An encoded narrative forecast used for creating computer-generated
    /// audio narratives of the forecast period (TWC use only).
    public let vocal_key: String?

    /// A forecast qualifier that is applicable to the 12-hour forecast
    /// period.
    public let qualifier: String

    /// A code for the forecast qualifier applicable to the 12-hour forecast
    /// period.
    public let qualifier_code: String

    /// The non-truncated UV index which is the intensity of the solar
    /// radiation based on a number of factors.
    public let uv_index_raw: Double?

    /// Maximum UV index for the 12-hour forecast period.
    public let uv_index: Int?

    /// The UV index description, which complements the UV index value by
    /// providing an associated level of risk of skin damage due to exposure.
    public let uv_desc: String?

    /// The UV warning that is based on a UV index of 11 or greater.
    public let uv_warning: Int?

    /// The weather conditions for playing golf expressed on a scale of 0 to
    /// 10. Not applicable at night.
    public let golf_index: Int?

    /// The golf index category expressed as a phrase for the weather
    /// conditions for playing golf.
    public let golf_category: String?

    /// Used internally to initialize a `CurrentObservation` model from JSON.
    public init(json: JSON) {
        data_class = json["class"].stringValue
        expire_time_gmt = json["expire_time_gmt"].doubleValue
        fcst_valid = json["fcst_valid"].doubleValue
        fcst_valid_local = json["fcst_valid_local"].string
        day_ind = json["day_ind"].stringValue
        thunder_enum = json["thunder_enum"].int
        thunder_enum_phrase = json["thunder_enum_phrase"].string
        daypart_name = json["daypart_name"].stringValue
        long_daypart_name = json["long_daypart_name"].string
        alt_daypart_name = json["alt_daypart_name"].string
        num = json["num"].int
        temp = json["temp"].intValue
        temp_phrase = json["temp_phrase"].string
        hi = json["hi"].int
        wc = json["wc"].int
        pop = json["pop"].intValue
        pop_phrase = json["pop_phrase"].string
        icon_extd = json["icon_extd"].intValue
        icon_code = json["icon_code"].intValue
        wxman = json["wxman"].string
        phrase_32char = json["phrase_32char"].stringValue
        phrase_22char = json["phrase_22char"].stringValue
        phrase_12char = json["phrase_12char"].stringValue
        subphrase_pt1 = json["subphrase_pt1"].string
        subphrase_pt2 = json["subphrase_pt2"].string
        subphrase_pt3 = json["subphrase_pt3"].string
        precip_type = json["precip_type"].stringValue
        rh = json["rh"].intValue
        wspd = json["wspd"].intValue
        wdir = json["wdir"].intValue
        wdir_cardinal = json["wdir_cardinal"].stringValue
        wind_phrase = json["wind_phrase"].stringValue
        clds = json["clds"].intValue
        shortcast = json["shortcast"].stringValue
        narrative = json["narrative"].stringValue
        qpf = json["qpf"].double
        accumulation_phrase = json["accumulation_phrase"].string
        snow_qpf = json["snow_qpf"].double
        snow_range = json["snow_range"].double
        snow_phrase = json["snow_phrase"].string
        snow_code = json["snow_code"].string
        vocal_key = json["vocal_key"].string
        qualifier = json["qualifier"].stringValue
        qualifier_code = json["qualifier_code"].stringValue
        uv_index_raw = json["uv_index_raw"].double
        uv_index = json["uv_index"].int
        uv_desc = json["uv_desc"].string
        uv_warning = json["uv_warning"].int
        golf_index = json["golf_index"].int
        golf_category = json["golf_category"].string
    }
}
