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

@testable import WeatherCompanyData
@testable import RestKit

import Foundation
import XCTest

public class WeatherCompanyDataTests: XCTestCase {

    static var allTests : [(String, (WeatherCompanyDataTests) -> () throws -> Void)] {
		return [
            ("testGet10DayForecast", testGet10DayForecast),
            ("testGet24HourForecast", testGet24HourForecast),
            ("testGetCurrentForecast", testGetCurrentForecast),
            ("testGetTimeSeries", testGetTimeSeries)
	    ]
	}

    /// Timeout for an asynchronous call to return before failing the unit test
    private let timeout: TimeInterval = 60.0
    
    private var username = ""
    private var password = ""
    
    func testGet10DayForecast() {

        let username = Credentials.weatherUsername
        let password = Credentials.weatherPassword
    
        let expect = expectation(description: "Test Get10DayForecast")
        
        let weatherCompanyData = WeatherCompanyData(username: username, password: password)
        let failure = { (error: RestError) in print(error) }
        
        weatherCompanyData.get10DayForecast(
            units: "e",
            latitude: "30.402",
            longitude: "-97.71",
            language: "en-US",
            failure: failure)
        {
            response in
            XCTAssertGreaterThanOrEqual(response.forecasts.count, 10)
            expect.fulfill()
        }
        
        waitForExpectations( timeout: timeout) { error in XCTAssertNil(error, "Timeout") }
    }

    func testGet24HourForecast() {

        let username = Credentials.weatherUsername
        let password = Credentials.weatherPassword

        let expect = expectation(description: "Test Get24HourForecast")
        
        let weatherCompanyData = WeatherCompanyData(username: username, password: password)
        let failure = { (error: RestError) in print(error) }
        
        weatherCompanyData.get48HourForecast(
            units: "e",
            latitude: "30.402",
            longitude: "-97.71",
            language: "en-US",
            failure: failure)
        {
            response in
            XCTAssertGreaterThanOrEqual(response.forecasts.count, 24)
            expect.fulfill()
        }
        
        waitForExpectations( timeout: timeout) { error in XCTAssertNil(error, "Timeout") }
    }

    func testGetCurrentForecast() {

        let username = Credentials.weatherUsername
        let password = Credentials.weatherPassword

        let expect = expectation(description: "Test GetCurrentWeather")
        
        let weatherCompanyData = WeatherCompanyData(username: username, password: password)
        let failure = { (error: RestError) in print(error) }
        
        weatherCompanyData.getCurrentForecast(
            units: "e",
            latitude: "30.402",
            longitude: "-97.71",
            language: "en-US",
            failure: failure)
        {
            response in
            XCTAssertGreaterThanOrEqual(response.observation.measurement!.temp, -50)
            expect.fulfill()
        }
        
        waitForExpectations( timeout: timeout) { error in XCTAssertNil(error, "Timeout") }
    }

    func testGetTimeSeries() {

        let username = Credentials.weatherUsername
        let password = Credentials.weatherPassword

        let expect = expectation(description: "Test GetCurrentWeather")
        
        let weatherCompanyData = WeatherCompanyData(username: username, password: password)
        let failure = { (error: RestError) in print(error) }
        
        weatherCompanyData.getTimeSeries(
            units: "e",
            latitude: "30.402",
            longitude: "-97.71",
            language: "en-US",
            failure: failure)
        {
            response in
            XCTAssertGreaterThanOrEqual(response.observation.count, 10)
            expect.fulfill()
        }
        
        waitForExpectations( timeout: timeout) { error in XCTAssertNil(error, "Timeout") }
    }
}
