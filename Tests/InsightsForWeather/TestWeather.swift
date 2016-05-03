
import Foundation
import XCTest

@testable import InsightsForWeather


class TestWeather : XCTestCase {

    func testGetWeather () {
        
        let username = Credentials.weatherUsername
        let password = Credentials.weatherPassword
        
        let weather = Weather(username: username, password: password)
        let failure = { (error: NSError) in print(error) }
        
        weather.getCurrentWeather(units: "e", geocode: "24.53,84.50", language: "en-US", failure: failure) {
            response in
            
            print(response)
            
            
            XCTAssertNotNil(response)
        }
        
    }
    
}