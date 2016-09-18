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


// Insight for Weather CurrentForecast request object
public struct CurrentObservation {
    
    /// Data identifier.
    public let data_class: String
    
    /// Expiration time in UNIX seconds.
    public let expire_time_gmt: Int
    
    /// Time observation is valid.
    public let obs_time: Int
    
    /// Time observation is valid in local, but at top of next UTC hour.
    public let obs_time_local: String
    
    /// Day of week.
    public let dow: String
    
    /// The cardinal direction from which the wind blows in an abbreviated
    /// form. Wind directions are always expressed as "from whence the wind
    /// blows" meaning that a North wind blows from North to South. If you
    /// face North in a North wind, the wind is at your face. Face southward
    /// and the North wind is at your back.
    public let wdir_cardinal: String
    
    /// The direction from which the wind blows expressed in degrees. The
    /// magnetic direction varies from 0 to 359 degrees, where 0 degrees
    /// indicates the North, 90 degrees the East, 180 degrees the South,
    /// 270 degrees the West, and so forth.
    public let wdir: Int?
    
    /// The key to the weather icon lookup. The data field shows the icon
    /// number that is matched to represent the observed weather conditions.
    public let icon_code: Int
    
    /// Code representing explicit full set sensible weather.
    public let icon_extd: Int
    
    /// 32-character phrase that accompanies the icon_extd. This field is
    /// translated for all supported langauges.
    public let phrase_32char: String
    
    /// 22-character phrase that accompanies the icon_extd. This field is
    /// null for all languages other than US English (en_US).
    public let phrase_22char: String
    
    /// 12-character phrase that accompanies the icon_extd. This field is
    /// null for all languages other than US English (en_US).
    public let phrase_12char: String
    
    /// Descriptive sky cover that is based on percentage of cloud cover.
    public let sky_cover: String?
    
    /// Cloud cover description code.
    public let clds: String?
    
    /// Descriptive text of pressure tendency over the past three hours.
    /// This field will be null outside of CONUS and Europe.
    public let ptend_desc: String
    
    /// Code of pressure tendency. This field will be null outside of CONUS
    /// and Europe. 0 = steady, 1 = rising, 2 = falling, 3 = rising rapidly,
    /// 4 = falling rapidly.
    public let ptend_code: Int?
    
    /// The UV index.
    public let uv_index: Int?
    
    /// A UV warning based on a UV index of 11 or greater.
    public var uv_warning: Bool?
    
    /// The UV index description, which complements the UV index value by
    /// providing an associated level of risk of skin damange due to exposure.
    public let uv_desc: String?
    
    /// The local time of the sunrise. This field reflects any local daylight
    /// savings conventions. For a few Arctic and Antarctic regions, the
    /// sunrise and sunset data values may be the same (each with a value of
    /// 12:01am) to reflect conditions where a sunrise or sunset does not
    /// occur.
    public let sunrise: String
    
    /// This local time of the sunset. This field reflects any local daylight
    /// savings conventions. For a few Arctic and Antarctic regions, the
    /// sunrise and sunset data values may be the same (each with a value of
    /// 12:01am) to reflect conditions where a sunrise or sunset does not
    /// occur.
    public let sunset: String
    
    /// Indicates whether it is daytime or nighttime based on the local
    /// apparent time of the location. D = Day, N = Night, X = missing (for
    /// extreme northern and southern hemisphere).
    public let day_ind: String?
    
    /// The Weather Man animation code. Based upon the current weather and
    /// the current temperature (TWC use only).
    public let wxman: String?
    
    /// The observation qualifier. This field provides a qualitative
    /// description of current conditions, comparing the observation to
    /// climate averages, records, precipitation reports, severe weather
    /// warnings, and so on.
    public let obs_qualifier_code: String?
    
    /// 100-character version of the observation qualifier. This observation
    /// qualifier field is unit of measure independent when populated.
    public let obs_qualifier_100char: String?
    
    /// 50-character version of the observation qualifier. This observation
    /// qualifier field is unit of measure independent when populated.
    public let obs_qualifier_50char: String?
    
    /// 32-character version of the observation qualifier. This observation
    /// qualifier field is unit of measure independent when populated.
    public let obs_qualifier_32char: String?
    
    /// An objective index or enumeration of the severity or significance
    /// of the observation qualifier. This observation qualifier field is
    /// unit of measure independent when populated.
    public let obs_qualifier_severity: Int?
    
    /// An encoded narrative forecase used for creating computer-generated
    /// audio narratives of the forecase period (TWC use only).
    public let vocal_key: String?
    
    /// The specific measurements that are based off the units type such as temperature which is 
    // different for Metric vs. English
    public let measurement:Measurement?
    
    /// The units of measure to return the data in (for example, e=Imperial(English), m=Metric, 
    /// h=Hybrid). Some APIs require the units of measure.
    private var unit:String = "imperial"
    
    /// Used internally to initialize a `CurrentObservation` model from JSON.
    public init(json: JSON) {
        data_class = json["class"].stringValue
        expire_time_gmt = json["expire_time_gmt"].intValue
        obs_time = json["obs_time"].intValue
        obs_time_local = json["obs_time_local"].stringValue
        dow = json["dow"].stringValue
        wdir_cardinal = json["wdir_cardinal"].stringValue
        wdir = json["wdir"].int
        icon_code = json["icon_code"].intValue
        icon_extd = json["icon_extd"].intValue
        phrase_32char = json["phrase_32char"].stringValue
        phrase_22char = json["phrase_22char"].stringValue
        phrase_12char = json["phrase_12char"].stringValue
        sky_cover = json["sky_cover"].string
        clds = json["clds"].string
        ptend_desc = json["ptend_desc"].stringValue
        ptend_code = json["ptend_code"].int
        uv_index = json["uv_index"].int
        uv_warning = (json["uv_warning"].int != nil && json["uv_warning"].int != 0)
        uv_desc = json["uv_desc"].string
        sunrise = json["sunrise"].stringValue
        sunset = json["sunset"].stringValue
        day_ind = json["day_ind"].string
        wxman = json["wxman"].stringValue
        obs_qualifier_code = json["obs_qualifier_code"].string
        obs_qualifier_100char = json["obs_qualifier_100char"].string
        obs_qualifier_50char = json["obs_qualifier_50char"].string
        obs_qualifier_32char = json["obs_qualifier_32char"].string
        obs_qualifier_severity = json["obs_qualifier_severity"].int
        vocal_key = json["vocal_key"].string
        
        if(json["metric"].count > 0) {
            unit = "metric"
        }
        else if (json["uk_hybrid"].count > 0) {
            unit = "uk_hybrid"
        }
        
        measurement = Measurement(json: json)
    }
}
