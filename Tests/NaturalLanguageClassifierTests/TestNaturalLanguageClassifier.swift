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

@testable import NaturalLanguageClassifier
@testable import RestKit

import Foundation
import XCTest

public class TestNaturalLanguageClassifier: XCTestCase {

    static var allTests : [(String, (TestNaturalLanguageClassifier) -> () throws -> Void)] {
		return [
            ("testGetClassifiers", testGetClassifiers),
            ("testGetClassify", testGetClassify)
	    ]
	}

    /// Timeout for an asynchronous call to return before failing the unit test
    private let timeout: TimeInterval = 60.0

    
    private var username = ""
    private var password = ""
    
    func testGetClassifiers() {

        let username = Credentials.NaturalLanguageClassifierUsername
        let password = Credentials.NaturalLanguageClassifierPassword
    
        let expect = expectation(description: "Test GetClassifiers")
        
        let naturalLanguageClassifier = NaturalLanguageClassifier(username: username, password: password)
        let failure = { (error: RestError) in print(error) }
        
        naturalLanguageClassifier.getClassifiers(failure: failure) { response in
            XCTAssertGreaterThanOrEqual(response.count, 1)
            expect.fulfill()
        }
        
        waitForExpectations( timeout: timeout) { error in XCTAssertNil(error, "Timeout") }
    }
    
    /// Figure out why this is no longer working
    func GetClassify() {
        
        let username = Credentials.NaturalLanguageClassifierUsername
        let password = Credentials.NaturalLanguageClassifierPassword
        
        let expect = expectation(description: "Test GetClassify")
        
        let naturalLanguageClassifier = NaturalLanguageClassifier(username: username, password: password)
        let failure = { (error: RestError) in print(error) }
        
        naturalLanguageClassifier.classify(classifierId: "3a84d1x62-nlc-2314", text: "how is the weather?", failure: failure) { response in
            XCTAssertNotEqual(response.text , "temperature")
            expect.fulfill()
        }
        
        waitForExpectations( timeout: timeout) { error in XCTAssertNil(error, "Timeout") }
    }

}
