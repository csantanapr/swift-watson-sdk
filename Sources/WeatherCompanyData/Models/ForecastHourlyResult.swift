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
