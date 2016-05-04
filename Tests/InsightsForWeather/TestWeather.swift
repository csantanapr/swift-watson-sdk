import InsightsForWeather

import Foundation
import XCTest

class TestWeather: XCTestCase {

    /// Timeout for an asynchronous call to return before failing the unit test
    private let timeout: NSTimeInterval = 60.0
    
    private let ibmAustinGeocode = "30.401633699999998,-97.7143924"
    
    private var username = ""
    private var password = ""
    
    override func setUp() {
        super.setUp()
        username = Credentials.weatherUsername
        password = Credentials.weatherPassword
    }
    
    func testGet10DayForecast() {

        let expect = expectation(withDescription: "Test Get10DayForecast")
        
        let insightsForWeather = InsightsForWeather(username: username, password: password)
        let failure = { (error: NSError) in print(error) }
        
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

        let expect = expectation(withDescription: "Test Get24HourForecast")
        
        let insightsForWeather = InsightsForWeather(username: username, password: password)
        let failure = { (error: NSError) in print(error) }
        
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

        let expect = expectation(withDescription: "Test GetCurrentWeather")
        
        let insightsForWeather = InsightsForWeather(username: username, password: password)
        let failure = { (error: NSError) in print(error) }
        
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

        let expect = expectation(withDescription: "Test GetCurrentWeather")
        
        let insightsForWeather = InsightsForWeather(username: username, password: password)
        let failure = { (error: NSError) in print(error) }
        
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
