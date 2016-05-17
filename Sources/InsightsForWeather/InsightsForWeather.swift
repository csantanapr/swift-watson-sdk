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

import RestKit
import KituraNet
import SwiftyJSON

import Foundation

/**
 IBM Insights for Weather to integrate historical and real-time weather data from The Weather Company 
 into your IBM Bluemix applications. This service lets you retrieve weather data for an area specified 
 by a geolocation. The data allows you to forecast, detect, and visualize disruptive weather events 
 that might affect decision making in your application.
*/
public class InsightsForWeather {

    private let username: String
    private let password: String

    private let serviceURL = "https://twcservice.mybluemix.net/api/weather"
    private let domain = "com.ibm.swift.weather"

    /// Used to initialize a `InsightsForWeather` object using username and password for authentication.
    public init(username: String, password: String) {
        self.username = username
        self.password = password
    }

    /**
     Returns weather forecasts for the current day and the next nine days for a geolocation. Each 
     daily forecast can contain a daytime forecast and a nighttime forecast.  These segments are 
     separate objects in the JSON responses. Daytime forecast data of the daily forecast are no 
     longer available after 3:00 PM local time.  At 3:00 pm local time, your application must no 
     longer display the day forecast.
     
     - parameter units:    The optional units to return the response in. The API supports English (e), 
     Metric (m), and UK-Hybrid (h) units of measure. If you supply the units of measure but don't 
     supply a value, the API returns the data in the unit of measure that corresponds to the language 
     code. The default or requested unit of measure is returned in the units parameter in the metadata 
     of the response.
     - parameter geocode:  The optional latitude and longitude, for example, "45.4214,75.6919" 
     represents Ottawa, Canada. If you supply a geocode coordinate, the API returns data for the 
     closest location available. Periods are used as decimal separators and commas are used to 
     separate latitude and longitude values. If you supply a geocode, the actual latitude and 
     longitude values that are used are returned in the metadata of the response.
     - parameter language: The language to return the response in. The default is en-US. The default or 
     requested translation language is returned in the language parameter in the metadata of the response.
     - parameter failure: A function executed if an error occurs.
     - parameter success: A function executed with the list of available standard and custom models.
     */
    public func get10DayForecast(
        units: String?,
        geocode: String?,
        language: String,
        failure: (RestError -> Void)? = nil,
        success: ForecastDailyResult -> Void)
    {
        // construct query parameters
        var queryParameters = [NSURLQueryItem]()
        if let units = units {queryParameters.append(NSURLQueryItem(name: "units", value: units))}
        if let geocode = geocode {queryParameters.append(NSURLQueryItem(name: "geocode", value: geocode))}
        queryParameters.append(NSURLQueryItem(name: "language", value: language))

        // construct REST request
        let request = RestRequest(
            method: .GET,
            url: serviceURL + "/v2/forecast/daily/10day",
            contentType: "application/json",
            queryParameters: queryParameters,
            username: username,
            password: password)

        // execute REST request
        request.responseJSON { response in
            switch response {
            case .success(let json): success(ForecastDailyResult(json: json))
            case .failure(let error): failure?(error)
            }
        }
    }

    /**
     Returns an hourly forecast for the current day and the next 24 hours for a geolocation. The hourly 
     forecast data can contain up to 24 hourly forecasts for each location.  You must discard all 
     previous hourly forecasts for a location when new data is received
     
     - parameter units:    The optional units to return the response in. The API supports English (e),
     Metric (m), and UK-Hybrid (h) units of measure. If you supply the units of measure but don't
     supply a value, the API returns the data in the unit of measure that corresponds to the language
     code. The default or requested unit of measure is returned in the units parameter in the metadata
     of the response.
     - parameter geocode:  The optional latitude and longitude, for example, "45.4214,75.6919"
     represents Ottawa, Canada. If you supply a geocode coordinate, the API returns data for the
     closest location available. Periods are used as decimal separators and commas are used to
     separate latitude and longitude values. If you supply a geocode, the actual latitude and
     longitude values that are used are returned in the metadata of the response.
     - parameter language: The language to return the response in. The default is en-US. The default or
     requested translation language is returned in the language parameter in the metadata of the response.
     - parameter failure: A function executed if an error occurs.
     - parameter success: A function executed with the list of available standard and custom models.
     */
    public func get24HourForecast(
        units: String?,
        geocode: String?,
        language: String,
        failure: (RestError -> Void)? = nil,
        success: ForecastHourlyResult -> Void)
    {
        // construct query parameters
        var queryParameters = [NSURLQueryItem]()
        if let units = units {queryParameters.append(NSURLQueryItem(name: "units", value: units))}
        if let geocode = geocode {queryParameters.append(NSURLQueryItem(name: "geocode", value: geocode))}
        queryParameters.append(NSURLQueryItem(name: "language", value: language))

        // construct REST request
        let request = RestRequest(
            method: .GET,
            url: serviceURL + "/v2/forecast/hourly/24hour",
            contentType: "application/json",
            queryParameters: queryParameters,
            username: username,
            password: password)

        // execute REST request
        request.responseJSON { response in
            switch response {
            case .success(let json): success(ForecastHourlyResult(json: json))
            case .failure(let error): failure?(error)
            }
        }
    }

    /**
     Returns the current weather conditions for a geolocation. These recent observations are retained 
     in the database up to 10 minutes on specific reporting stations and 24 hours of observations 
     per station. The recent observations data is continuously updated and replaced with a 
     first-in / first-out methodology (rotating data with newest observation and moving the oldest 
     observations to the archive storage) based on date/time stamping of the observations.
     
     - parameter units:    The optional units to return the response in. The API supports English (e),
     Metric (m), and UK-Hybrid (h) units of measure. If you supply the units of measure but don't
     supply a value, the API returns the data in the unit of measure that corresponds to the language
     code. The default or requested unit of measure is returned in the units parameter in the metadata
     of the response.
     - parameter geocode:  The optional latitude and longitude, for example, "45.4214,75.6919"
     represents Ottawa, Canada. If you supply a geocode coordinate, the API returns data for the
     closest location available. Periods are used as decimal separators and commas are used to
     separate latitude and longitude values. If you supply a geocode, the actual latitude and
     longitude values that are used are returned in the metadata of the response.
     - parameter language: The language to return the response in. The default is en-US. The default or
     requested translation language is returned in the language parameter in the metadata of the response.
     - parameter failure: A function executed if an error occurs.
     - parameter success: A function executed with the list of available standard and custom models.
     */
    public func getCurrentForecast(
        units: String?,
        geocode: String?,
        language: String,
        failure: (RestError -> Void)? = nil,
        success: CurrentObservationResult -> Void)
    {
        // construct query parameters
        var queryParameters = [NSURLQueryItem]()
        if let units = units {queryParameters.append(NSURLQueryItem(name: "units", value: units))}
        if let geocode = geocode {queryParameters.append(NSURLQueryItem(name: "geocode", value: geocode))}
        queryParameters.append(NSURLQueryItem(name: "language", value: language))

        // construct REST request
        let request = RestRequest(
            method: .GET,
            url: serviceURL + "/v2/observations/current",
            contentType: "application/json",
            queryParameters: queryParameters,
            username: username,
            password: password)

        // execute REST request
        request.responseJSON { response in
            switch response {
            case .success(let json): success(CurrentObservationResult(json: json))
            case .failure(let error): failure?(error)
            }
        }
    }

    /**
     Returns both the current observations and up to 24 hours of past observations, from the current 
     date and time, for a geolocation. Weather observations are gathered from physical devices 
     deployed worldwide, and the current weather observations.
     
     - parameter units:    The optional units to return the response in. The API supports English (e),
     Metric (m), and UK-Hybrid (h) units of measure. If you supply the units of measure but don't
     supply a value, the API returns the data in the unit of measure that corresponds to the language
     code. The default or requested unit of measure is returned in the units parameter in the metadata
     of the response.
     - parameter geocode:  The optional latitude and longitude, for example, "45.4214,75.6919"
     represents Ottawa, Canada. If you supply a geocode coordinate, the API returns data for the
     closest location available. Periods are used as decimal separators and commas are used to
     separate latitude and longitude values. If you supply a geocode, the actual latitude and
     longitude values that are used are returned in the metadata of the response.
     - parameter language: The language to return the response in. The default is en-US. The default or
     requested translation language is returned in the language parameter in the metadata of the response.
     - parameter failure: A function executed if an error occurs.
     - parameter success: A function executed with the list of available standard and custom models.
     */
    public func getTimeSeries(
        units: String?,
        geocode: String?,
        language: String,
        failure: (RestError -> Void)? = nil,
        success: TimeSeriesResult -> Void)
    {
        // construct query parameters
        var queryParameters = [NSURLQueryItem]()
        if let units = units {queryParameters.append(NSURLQueryItem(name: "units", value: units))}
        if let geocode = geocode {queryParameters.append(NSURLQueryItem(name: "geocode", value: geocode))}
        queryParameters.append(NSURLQueryItem(name: "language", value: language))

        // construct REST request
        let request = RestRequest(
            method: .GET,
            url: serviceURL + "/v2/observations/timeseries/24hour",
            contentType: "application/json",
            queryParameters: queryParameters,
            username: username,
            password: password)

        // execute REST request
        request.responseJSON { response in
            switch response {
            case .success(let json): success(TimeSeriesResult(json: json))
            case .failure(let error): failure?(error)
            }
        }
    }
}
