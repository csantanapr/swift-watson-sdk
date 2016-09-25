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

import XCTest

@testable import PersonalityInsights
@testable import RestKit
import Foundation

class PersonalityInsightsTests: XCTestCase {

    static var allTests : [(String, (PersonalityInsightsTests) -> () throws -> Void)] {
        return [
            ("testProfile", testProfile),
            ("testContentItem", testContentItem),
            ("testProfileWithShortText", testProfileWithShortText)
        ]
    }
    
    /// Timeout for an asynchronous call to return before failing the unit test
    private let timeout: TimeInterval = 60.0
    
    
    private var username = ""
    private var password = ""
    
    private var personalityInsights: PersonalityInsights!
    
    // MARK: - Test Configuration

    /** Set up for each test by loading text files and instantiating the service. */
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
    }

    /** Fail false negatives. */
    func failWithError(error: NSError) {
        XCTFail("Positive test failed with error: \(error)")
    }

    /** Fail false positives. */
    func failWithResult<T>(result: T) {
        XCTFail("Negative test returned a result.")
    }

    /** Wait for expectations. */
    func waitForExpectations() {
        waitForExpectations(timeout: timeout) { error in
            XCTAssertNil(error, "Timeout")
        }
    }
    
    // MARK: - Positive Tests
    
    /** Analyze the text of Kennedy's speech. */
    func testProfile() {
        
        let username = Credentials.PersonalityInsightsUsername
        let password = Credentials.PersonalityInsightsPassword
        
        let expect = expectation(description: "Test Profile")
        
        let personalityInsights = PersonalityInsights(username: username, password: password)
        let failure = { (error: RestError) in print(error) }
        
        personalityInsights.getProfile(text: KennedyTest.speech, failure: failure) { profile in
            XCTAssertEqual("root", profile.tree.name, "Tree root should be named root")
            expect.fulfill()
        }
        waitForExpectations()
    }
    
    
    /** Analyze content items. */
    func testContentItem() {
        let username = Credentials.PersonalityInsightsUsername
        let password = Credentials.PersonalityInsightsPassword
        
        let expect = expectation(description: "Test ContentItem")
        
        let personalityInsights = PersonalityInsights(username: username, password: password)
        let failure = { (error: RestError) in print(error) }
        
        let contentItem = ContentItem(
            id: "245160944223793152",
            userID: "Bob",
            sourceID: "Twitter",
            created: 1427720427,
            updated: 1427720427,
            contentType: "text/plain",
            language: "en",
            content: KennedyTest.speech,
            parentID: "",
            reply: false,
            forward: false
        )

        let contentItems = [contentItem, contentItem]
        personalityInsights.getProfile(contentItems: contentItems, failure: failure) {
            profile in
            XCTAssertEqual("root", profile.tree.name, "Tree root should be named root")
            expect.fulfill()
        }
        waitForExpectations()
    }

    // MARK: - Negative Tests
    
    /** Test getProfile() with text that is too short (less than 100 words). */
    func testProfileWithShortText() {
        let username = Credentials.PersonalityInsightsUsername
        let password = Credentials.PersonalityInsightsPassword
        
        let expect = expectation(description: "Test ContentItem")
    
        let personalityInsights = PersonalityInsights(username: username, password: password)

        let failure = { (error: RestError) in
            XCTAssertTrue(String(describing: error).contains("400"))
            expect.fulfill()
        }

        personalityInsights.getProfile(
            text: MobyDickTest.text,
            failure: failure,
            success: failWithResult
        )
        waitForExpectations()
    }
}
