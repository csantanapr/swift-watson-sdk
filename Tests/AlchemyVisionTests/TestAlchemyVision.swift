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

@testable import AlchemyVision
@testable import RestKit

import Foundation
import XCTest

public class TestAlchemyVision: XCTestCase {

    static var allTests : [(String, TestAlchemyVision -> () throws -> Void)] {
		return [
            ("testGetRankedImageKeywords", testGetRankedImageKeywords),
            ("testURLRecognizeFaces", testURLRecognizeFaces),
            ("testGetRankedImageSceneText", testGetRankedImageSceneText),
            ("testGetImage", testGetImage)
	    ]
	}

    /// Timeout for an asynchronous call to return before failing the unit test
    private let timeout: NSTimeInterval = 60.0
    
    private var apiKey = ""

    func testGetRankedImageKeywords() {

        let apiKey = Credentials.alchemyAPI

        let expect = expectation(withDescription: "Test GetRankedImageKeywords")
        
        let alchemyVision = AlchemyVision(apiKey: apiKey)
        let failure = { (error: RestError) in print(error) }
        
        let urlString = "http://hdwplan.com/wp-content/uploads/2016/01/super-sunset-wallpaper-hd.jpeg"
        
        alchemyVision.getRankedImageKeywords(url: urlString, forceShowAll: true, knowledgeGraph: true, failure: failure) { (response) in
            XCTAssertGreaterThanOrEqual(response.imageKeywords.count, 6)
            expect.fulfill()
        }
        
        waitForExpectations( withTimeout: timeout) { error in XCTAssertNil(error, "Timeout") }
    }
    
    func testURLRecognizeFaces(){
        
        let apiKey = Credentials.alchemyAPI
        let emptyExpectation = expectation(withDescription: "Empty")
    //    let validExpectation = expectation(withDescription: "Valid")
        
        let alchemyVision = AlchemyVision(apiKey: apiKey)
        let failure = {
            (error: RestError) in print(error)
        }
        
        let urlString = "http://img2.timeinc.net/people/i/2014/sandbox/news/140210/hats/willie-435x580.jpg"
        
        alchemyVision.getRankedImageFaceTags(url: urlString, forceShowAll: false, knowledgeGraph: false, failure: failure) { (response) in
            XCTAssertGreaterThanOrEqual(response.imageFaces.count, 1)
            emptyExpectation.fulfill()
        }
        
        waitForExpectations( withTimeout: timeout) { error in XCTAssertNil(error, "Timeout") }
    }
    
    func testGetRankedImageSceneText(){
        
        let apiKey = Credentials.alchemyAPI
        
        let expect = expectation(withDescription: "Test GetRankedImageKeywords")
        
        let alchemyVision = AlchemyVision(apiKey: apiKey)
        let failure = { (error: RestError) in print(error) }
        
        let urlString = "http://ivrl.epfl.ch/files/content/sites/ivrg/files/research/images/past_topics/FilteredTextDetection/DollarGlen.jpg"
        
        alchemyVision.getRankedImageSceneText(url: urlString, failure: failure) { (response) in
            XCTAssertGreaterThanOrEqual(response.sceneTextLines.count, 2)
            expect.fulfill()
        }
        
        waitForExpectations( withTimeout: timeout) { error in XCTAssertNil(error, "Timeout") }
    }
    
    func testGetImage(){
        
        let apiKey = Credentials.alchemyAPI
        
        let expect = expectation(withDescription: "Test GetRankedImageKeywords")
        
        let alchemyVision = AlchemyVision(apiKey: apiKey)
        let failure = { (error: RestError) in print(error) }
        
        let urlString = "http://www.espn.com"
        
        alchemyVision.getImage(url: urlString, failure: failure) { (response) in
            XCTAssertTrue(!response.url.isEmpty)
            XCTAssertTrue(!response.image.isEmpty)
            expect.fulfill()
        }
        
        waitForExpectations( withTimeout: timeout) { error in XCTAssertNil(error, "Timeout") }
    }
}
