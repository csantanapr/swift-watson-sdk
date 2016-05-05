import RestKit
import KituraNet
import SwiftyJSON

import Foundation

public class InsightsForWeather {

    private let username: String
    private let password: String

    private let serviceURL = "https://twcservice.mybluemix.net/api/weather"
    private let domain = "com.ibm.swift.weather"

    public init(username: String, password: String) {
        self.username = username
        self.password = password
    }

    public func get10DayForecast(
        units: String,
        geocode: String,
        language: String,
        failure: (RestError -> Void)? = nil,
        success: ForecastDailyResult -> Void)
    {
        // construct query parameters
        var queryParameters = [NSURLQueryItem]()
        queryParameters.append(NSURLQueryItem(name: "units", value: units))
        queryParameters.append(NSURLQueryItem(name: "geocode", value: geocode))
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

    public func get24HourForecast(
        units: String,
        geocode: String,
        language: String,
        failure: (RestError -> Void)? = nil,
        success: ForecastHourlyResult -> Void)
    {
        // construct query parameters
        var queryParameters = [NSURLQueryItem]()
        queryParameters.append(NSURLQueryItem(name: "units", value: units))
        queryParameters.append(NSURLQueryItem(name: "geocode", value: geocode))
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

    public func getCurrentForecast(
        units: String,
        geocode: String,
        language: String,
        failure: (RestError -> Void)? = nil,
        success: CurrentObservationResult -> Void)
    {
        // construct query parameters
        var queryParameters = [NSURLQueryItem]()
        queryParameters.append(NSURLQueryItem(name: "units", value: units))
        queryParameters.append(NSURLQueryItem(name: "geocode", value: geocode))
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

    public func getTimeSeries(
        units: String,
        geocode: String,
        language: String,
        failure: (RestError -> Void)? = nil,
        success: TimeSeriesResult -> Void)
    {
        // construct query parameters
        var queryParameters = [NSURLQueryItem]()
        queryParameters.append(NSURLQueryItem(name: "units", value: units))
        queryParameters.append(NSURLQueryItem(name: "geocode", value: geocode))
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
