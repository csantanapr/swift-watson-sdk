import InsightsForWeather

import Foundation
import XCTest

class TestWeather: XCTestCase {

    func testGet10DayForecast() {
        
        let username = Credentials.weatherUsername
        let password = Credentials.weatherPassword
        
        let insightsForWeather = InsightsForWeather(username: username, password: password)
        let failure = { (error: NSError) in print(error) }
        
        insightsForWeather.get10DayForecast(
            units: "e",
            geocode: "24.53,84.50",
            language: "en-US",
            failure: failure)
        {
            response in
            print(response)
        }
    }

    func testGet24HourForecast() {
        
        let username = Credentials.weatherUsername
        let password = Credentials.weatherPassword
        
        let insightsForWeather = InsightsForWeather(username: username, password: password)
        let failure = { (error: NSError) in print(error) }
        
        insightsForWeather.get24HourForecast(
            units: "e",
            geocode: "24.53,84.50",
            language: "en-US",
            failure: failure)
        {
            response in
            print(response)
        }
    }

    func testGetCurrentForecast() {
        
        let username = Credentials.weatherUsername
        let password = Credentials.weatherPassword
        
        let insightsForWeather = InsightsForWeather(username: username, password: password)
        let failure = { (error: NSError) in print(error) }
        
        insightsForWeather.getCurrentForecast(
            units: "e",
            geocode: "24.53,84.50",
            language: "en-US",
            failure: failure)
        {
            response in
            print(response)
        }
    }

    func testGetTimeSeries() {
        
        let username = Credentials.weatherUsername
        let password = Credentials.weatherPassword
        
        let insightsForWeather = InsightsForWeather(username: username, password: password)
        let failure = { (error: NSError) in print(error) }
        
        insightsForWeather.getTimeSeries(
            units: "e",
            geocode: "24.53,84.50",
            language: "en-US",
            failure: failure)
        {
            response in
            print(response)
        }
    }
}
