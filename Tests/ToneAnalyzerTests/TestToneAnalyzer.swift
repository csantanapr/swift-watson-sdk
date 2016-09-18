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

@testable import ToneAnalyzer
@testable import RestKit

import Foundation
import XCTest

public class TestToneAnalyzer: XCTestCase {
    
    static var allTests : [(String, TestToneAnalyzer -> () throws -> Void)] {
        return [
            ("testGetToneWithDefaultParameters", testGetToneWithDefaultParameters),
            ("testGetToneWithCustomParameters", testGetToneWithCustomParameters)
        ]
    }
    
    /// Timeout for an asynchronous call to return before failing the unit test
    private let timeout: NSTimeInterval = 60.0
    
    
    private var username = ""
    private var password = ""
    
    let text = "I know the times are difficult! Our sales have been disappointing for " +
        "the past three quarters for our data analytics product suite. We have a " +
        "competitive data analytics product suite in the industry. But we need " +
        "to do our job selling it! "

    
    func testGetToneWithDefaultParameters() {
        
        let username = Credentials.ToneAnalyzerUsername
        let password = Credentials.ToneAnalyzerPassword
        
        let expect = expectation(withDescription: "Test GetToneWithDefaultParameters")
        
        let toneAnalyzer = ToneAnalyzer(username: username, password: password, version: "2016-05-10")
        let failure = { (error: RestError) in print(error) }
        
        toneAnalyzer.getTone(text: text, failure: failure) { toneAnalysis in
            
            for emotionTone in toneAnalysis.documentTone[0].tones {
                XCTAssertNotNil(emotionTone.name)
                XCTAssertNotNil(emotionTone.id)
                XCTAssert(emotionTone.score <= 1.0 && emotionTone.score >= 0.0)
            }
            
            for writingTone in toneAnalysis.documentTone[1].tones {
                XCTAssertNotNil(writingTone.name)
                XCTAssertNotNil(writingTone.id)
                XCTAssert(writingTone.score <= 1.0 && writingTone.score >= 0.0)
            }
            
            for socialTone in toneAnalysis.documentTone[2].tones {
                XCTAssertNotNil(socialTone.name)
                XCTAssertNotNil(socialTone.id)
                XCTAssert(socialTone.score <= 1.0 && socialTone.score >= 0.0)
            }
            
            guard let sentenceTones = toneAnalysis.sentencesTones else {
                XCTFail("Sentence tones should not be nil.")
                return
            }
            
            for sentence in sentenceTones {
                XCTAssert(sentence.sentenceID >= 0)
                XCTAssertNotEqual(sentence.text, "")
                XCTAssert(sentence.inputFrom >= 0)
                XCTAssert(sentence.inputTo > sentence.inputFrom)
                
                for emotionTone in toneAnalysis.documentTone[0].tones {
                    XCTAssertNotNil(emotionTone.name)
                    XCTAssertNotNil(emotionTone.id)
                    XCTAssert(emotionTone.score <= 1.0 && emotionTone.score >= 0.0)
                }
                
                for writingTone in toneAnalysis.documentTone[1].tones {
                    XCTAssertNotNil(writingTone.name)
                    XCTAssertNotNil(writingTone.id)
                    XCTAssert(writingTone.score <= 1.0 && writingTone.score >= 0.0)
                }
                
                for socialTone in toneAnalysis.documentTone[2].tones {
                    XCTAssertNotNil(socialTone.name)
                    XCTAssertNotNil(socialTone.id)
                    XCTAssert(socialTone.score <= 1.0 && socialTone.score >= 0.0)
                }
            }
            
            expect.fulfill()
        }

        
        waitForExpectations( withTimeout: timeout) { error in XCTAssertNil(error, "Timeout") }
    }
    
    /** Analyze the tone of the given text with custom parameters. */
    func testGetToneWithCustomParameters() {
        
        let username = Credentials.ToneAnalyzerUsername
        let password = Credentials.ToneAnalyzerPassword
        
        let expect = expectation(withDescription: "Test GetToneWithDefaultParameters")
        
        let toneAnalyzer = ToneAnalyzer(username: username, password: password, version: "2016-05-10")
        let failure = { (error: RestError) in print(error) }
        
        let tones = ["emotion", "writing"]
        toneAnalyzer.getTone(text: text, tones: tones, sentences: false, failure: failure) {
            toneAnalysis in
            
            for emotionTone in toneAnalysis.documentTone[0].tones {
                XCTAssertNotNil(emotionTone.name)
                XCTAssertNotNil(emotionTone.id)
                XCTAssert(emotionTone.score <= 1.0 && emotionTone.score >= 0.0)
            }
            
            for writingTone in toneAnalysis.documentTone[1].tones {
                XCTAssertNotNil(writingTone.name)
                XCTAssertNotNil(writingTone.id)
                XCTAssert(writingTone.score <= 1.0 && writingTone.score >= 0.0)
            }
            
            for tone in toneAnalysis.documentTone {
                XCTAssert(tone.name != "Social Tone", "Social tone should not be included")
            }
            
            XCTAssert(toneAnalysis.sentencesTones?.count == 0)
            
            expect.fulfill()
        }
         waitForExpectations( withTimeout: timeout) { error in XCTAssertNil(error, "Timeout") }
    }
}
