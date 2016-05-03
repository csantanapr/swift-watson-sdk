
import Foundation
import XCTest

@testable import InsightsForWeather


class TestWeather : XCTestCase {

    
    func testGetWeather () {
        
        let weather = Weather(username: "91784f91-1470-4ab8-bd5e-8f994decbde2", password: "0DDWvS44Im")
        let failure = { (error: NSError) in print(error) }
        
        weather.getCurrentWeather(units: "e", geocode: "24.53,84.50", language: "en-US", failure: failure) { response in
            print(response)
        }
        
    }
    
}