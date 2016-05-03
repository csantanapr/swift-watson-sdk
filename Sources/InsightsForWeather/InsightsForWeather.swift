import RestKit
import KituraNet
import SwiftyJSON

import Foundation

public class Weather {

    private let username: String
    private let password: String

    private let serviceURL = "https://twcservice.mybluemix.net/api/weather"
    private let domain = "com.ibm.swift.weather"

    public init(username: String, password: String) {
        self.username = username
        self.password = password
    }

    public func getCurrentWeather(
        units: String,
        geocode: String,
        language: String,
        failure: (NSError -> Void)? = nil,
        success: ObservationResult -> Void)
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
        request.execute() { r in
            guard let response = r where response.statusCode == HttpStatusCode.OK else {
                let failureReason = "Response status code was unacceptable: \(r?.statusCode)."
                let userInfo = [NSLocalizedFailureReasonErrorKey: failureReason]
                let error = NSError(domain: self.domain, code: 0, userInfo: userInfo)
                failure?(error)
                return
            }

            do {
                let body = NSMutableData()
                try response.readAllData(into: body)
                let json = JSON(data: body)
                let observationResult = ObservationResult(json: json)
                success(observationResult)
            } catch {
                let failureReason = "Could not parse response data."
                let userInfo = [NSLocalizedFailureReasonErrorKey: failureReason]
                let error = NSError(domain: self.domain, code: 0, userInfo: userInfo)
                failure?(error)
                return
            }
        }
    }
}
