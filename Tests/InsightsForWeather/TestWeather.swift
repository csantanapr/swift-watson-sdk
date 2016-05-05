@testable import InsightsForWeather
@testable import RestKit

import Foundation
import XCTest

public class TestWeather: XCTestCase {

    static var allTests : [(String, TestWeather -> () throws -> Void)] {
		return [
            ("testGet10DayForecast", testGet10DayForecast),
            ("testGet24HourForecast", testGet24HourForecast),
            ("testGetCurrentForecast", testGetCurrentForecast),
            ("testGetTimeSeries", testGetTimeSeries)
	    ]
	}

    /// Timeout for an asynchronous call to return before failing the unit test
    private let timeout: NSTimeInterval = 60.0
    
    private let ibmAustinGeocode = "30.401633699999998,-97.7143924"
    
    private var username = ""
    private var password = ""
    
    func testGet10DayForecast() {

        let username = Credentials.weatherUsername
        let password = Credentials.weatherPassword
    
        let expect = expectation(withDescription: "Test Get10DayForecast")
        
        let insightsForWeather = InsightsForWeather(username: username, password: password)
        let failure = { (error: RestError) in print(error) }
        
        insightsForWeather.get10DayForecast(
            units: "e",
            geocode: ibmAustinGeocode,
            language: "en-US",
            failure: failure)
        {
            response in
            print(response)
            expect.fulfill()
        }
        
        waitForExpectations( withTimeout: timeout) { error in XCTAssertNil(error, "Timeout") }
    }

    func testGet24HourForecast() {

	let username = Credentials.weatherUsername
        let password = Credentials.weatherPassword

        let expect = expectation(withDescription: "Test Get24HourForecast")
        
        let insightsForWeather = InsightsForWeather(username: username, password: password)
        let failure = { (error: RestError) in print(error) }
        
        insightsForWeather.get24HourForecast(
            units: "e",
            geocode: ibmAustinGeocode,
            language: "en-US",
            failure: failure)
        {
            response in
            print(response)
            expect.fulfill()
        }
        
        waitForExpectations( withTimeout: timeout) { error in XCTAssertNil(error, "Timeout") }
    }

    func testGetCurrentForecast() {

	let username = Credentials.weatherUsername
        let password = Credentials.weatherPassword

        let expect = expectation(withDescription: "Test GetCurrentWeather")
        
        let insightsForWeather = InsightsForWeather(username: username, password: password)
        let failure = { (error: RestError) in print(error) }
        
        insightsForWeather.getCurrentForecast(
            units: "e",
            geocode: ibmAustinGeocode,
            language: "en-US",
            failure: failure)
        {
            response in
            print(response)
            expect.fulfill()
        }
        
        waitForExpectations( withTimeout: timeout) { error in XCTAssertNil(error, "Timeout") }
    }

    func testGetTimeSeries() {

	let username = Credentials.weatherUsername
        let password = Credentials.weatherPassword

        let expect = expectation(withDescription: "Test GetCurrentWeather")
        
        let insightsForWeather = InsightsForWeather(username: username, password: password)
        let failure = { (error: RestError) in print(error) }
        
        insightsForWeather.getTimeSeries(
            units: "e",
            geocode: ibmAustinGeocode,
            language: "en-US",
            failure: failure)
        {
            response in
            print(response)
            expect.fulfill()
        }
        
        waitForExpectations( withTimeout: timeout) { error in XCTAssertNil(error, "Timeout") }
    }
}
