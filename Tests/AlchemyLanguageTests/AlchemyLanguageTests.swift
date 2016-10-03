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

@testable import AlchemyLanguage
@testable import RestKit

import Foundation
import XCTest

public class AlchemyLanguageTests: XCTestCase {

    static var allTests : [(String, (AlchemyLanguageTests) -> () throws -> Void)] {
		return [
            ("testGetRankedKeywordsText", testGetRankedKeywordsText)
	    ]
	}

    /// Timeout for an asynchronous call to return before failing the unit test
    private let timeout: TimeInterval = 60.0
    
    private var apiKey = ""

    private let testUrl = "http://arstechnica.com/gadgets/2016/05/android-instant-apps-will-blur-the-lines-between-apps-and-mobile-sites/"
    
    private var testText =  "Romancing SaGa 2 is out on iOS and Android May 26, according to the game's official website. The enhanced mobile port of the Super Famicom game marks the first time the game is available in English.  Square Enix announced that the Romancing SaGa 2 remake was heading stateside in April. Alongside the English translation are revamped visuals, new classes, a gardening mini-game and a New Game Plus feature.  The role-playing game will cost $17.99 at launch. Japanese fans received the mobile port back in March, alongside a Vita release. Gamers stateside will have to make do with the version for smartphones for now. Check out the trailer for the game above to see how Romancing SaGa 2 looks in English, 23 years after its original Japanese release."
    
    
    func testGetRankedKeywordsText() {
        
        let apiKey = Credentials.alchemyAPI
        
        let expect = expectation(description: "Test GetRankedKeywordsText")
        
        let alchemyLanguage = AlchemyLanguage(apiKey: apiKey)
        let failure = { (error: RestError) in print(error) }
        
        let input = "http://www.ibm.com"
        var imputEncoded = testText.addingPercentEncoding( withAllowedCharacters: .urlHostAllowed)
        
        var url = URL(string: imputEncoded!)
        
        alchemyLanguage.getRankedKeywords(forURL: imputEncoded!, knowledgeGraph: QueryParam.Included, sentiment: QueryParam.Included, failure: failure) { keywords in
            XCTAssertNotNil(keywords, "Response should not be nil")
            XCTAssertNotNil(keywords.keywords, "Keywords should not be nil")
            expect.fulfill()
        }
        
        waitForExpectations( timeout: timeout) { error in XCTAssertNil(error, "Timeout") }
    }

    func testGetRankedKeywordsURL() {
        
        let apiKey = Credentials.alchemyAPI
        
        let expect = expectation(description: "Test GetRankedKeywordsURL")
        
        let alchemyLanguage = AlchemyLanguage(apiKey: apiKey)
        let failure = { (error: RestError) in print(error) }
        
        alchemyLanguage.getRankedKeywords(forURL: testUrl, failure: failure) { keywords in
            XCTAssertNotNil(keywords, "Response should not be nil")
            XCTAssertNotNil(keywords.keywords, "Keywords should not be nil")
            expect.fulfill()
        }
        waitForExpectations( timeout: timeout) { error in XCTAssertNil(error, "Timeout") }
    }
    
//    func testGetRankedImageKeywords() {
//
//        let apiKey = Credentials.alchemyAPI
//
//        let expect = expectation(description: "Test GetRankedImageKeywords")
//        
//        let alchemyVision = AlchemyVision(apiKey: apiKey)
//        let failure = { (error: RestError) in print(error) }
//        
//        let urlString = "http://hdwplan.com/wp-content/uploads/2016/01/super-sunset-wallpaper-hd.jpeg"
//        
//        alchemyVision.getRankedImageKeywords(url: urlString, forceShowAll: true, knowledgeGraph: true, failure: failure) { (response) in
//            XCTAssertGreaterThanOrEqual(response.imageKeywords.count, 6)
//            expect.fulfill()
//        }
//        
//        waitForExpectations( timeout: timeout) { error in XCTAssertNil(error, "Timeout") }
//    }
}
