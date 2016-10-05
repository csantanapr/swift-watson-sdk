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
            ("testGetRankedKeywordsText", testGetRankedKeywordsText),
            ("testGetRankedKeywordsURL", testGetRankedKeywordsURL),
            ("testGetAuthorsURL", testGetAuthorsURL),
            ("testGetRankedConceptsURL", testGetRankedConceptsURL),
            ("testGetRankedNamedEntitiesURL", testGetRankedNamedEntitiesURL),
            ("testGetLanguageURL", testGetLanguageURL),
            ("testGetMicroformatsURL", testGetMicroformatsURL),
            ("testGetPubDateURL", testGetPubDateURL),
            ("testGetTargetedSentimentURL", testGetTargetedSentimentURL),
            ("testGetRankedTaxonomyURL", testGetRankedTaxonomyURL),
            ("testGetRawTextURL", testGetRawTextURL),
            ("testGetTextURL", testGetTextURL),
            ("testGetTitleURL", testGetRankedKeywordsURL),
            ("testDetectFeedsURL", testDetectFeedsURL),
            ("testGetEmotionURL", testGetEmotionURL)
	    ]
	}

    /// Timeout for an asynchronous call to return before failing the unit test
    private let timeout: TimeInterval = 60.0
    
    // api key for alchemy
    private var apiKey = ""

    private let testUrl = "http://arstechnica.com/gadgets/2016/05/android-instant-apps-will-blur-the-lines-between-apps-and-mobile-sites/"
    
    private var testText =  "Romancing SaGa 2 is out on iOS and Android May 26, according to the game's official website. The enhanced mobile port of the Super Famicom game marks the first time the game is available in English.  Square Enix announced that the Romancing SaGa 2 remake was heading stateside in April. Alongside the English translation are revamped visuals, new classes, a gardening mini-game and a New Game Plus feature.  The role-playing game will cost $17.99 at launch. Japanese fans received the mobile port back in March, alongside a Vita release. Gamers stateside will have to make do with the version for smartphones for now. Check out the trailer for the game above to see how Romancing SaGa 2 looks in English, 23 years after its original Japanese release."
    
    // Positive Unit Tests
    
    func testGetRankedKeywordsText() {
        
        let apiKey = Credentials.alchemyAPI
        let expect = expectation(description: "Test GetRankedKeywordsText")
        let alchemyLanguage = AlchemyLanguage(apiKey: apiKey)
        let failure = { (error: RestError) in print(error) }
    
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
    
    func testGetAuthorsURL() {
        
        let apiKey = Credentials.alchemyAPI
        let expect = expectation(description: "Test GetAuthorsURL")
        let alchemyLanguage = AlchemyLanguage(apiKey: apiKey)
        let failure = { (error: RestError) in print(error) }
        
        alchemyLanguage.getAuthors(forURL: testUrl, failure: failure) { authors in
            XCTAssertNotNil(authors, "Response should not be nil")
            XCTAssertNotNil(authors.authors, "Authors should not be nil")
            expect.fulfill()
        }
        waitForExpectations( timeout: timeout) { error in XCTAssertNil(error, "Timeout") }
    }
    
    func testGetRankedConceptsURL() {
        
        let apiKey = Credentials.alchemyAPI
        let expect = expectation(description: "Test GetRankedConceptsURL")
        let alchemyLanguage = AlchemyLanguage(apiKey: apiKey)
        let failure = { (error: RestError) in print(error) }
        
        alchemyLanguage.getRankedConcepts(forURL: testUrl, failure: failure) { concepts in
            XCTAssertNotNil(concepts, "Reponse should not be nil")
            XCTAssertNotNil(concepts.concepts, "Concepts should not be nil")
            expect.fulfill()
        }
        waitForExpectations( timeout: timeout) { error in XCTAssertNil(error, "Timeout") }
    }
    
    func testGetRankedNamedEntitiesURL() {

        let apiKey = Credentials.alchemyAPI
        let expect = expectation(description: "Test GetRankedNamedEntitiesURL")
        let alchemyLanguage = AlchemyLanguage(apiKey: apiKey)
        let failure = { (error: RestError) in print(error) }
        
        alchemyLanguage.getRankedNamedEntities(forURL: testUrl,
                                               knowledgeGraph: QueryParam.Included,
                                               disambiguateEntities: QueryParam.Included,
                                               linkedData: QueryParam.Included,
                                               sentiment: QueryParam.Included,
                                               failure: failure) { entities in
                                                
            XCTAssertNotNil(entities, "Response should not be nil")
            XCTAssertNotNil(entities.entitites, "Entities should not be nil")
            expect.fulfill()
        }
        waitForExpectations( timeout: timeout) { error in XCTAssertNil(error, "Timeout") }
    }
    
    func testGetLanguageURL() {
        
        let apiKey = Credentials.alchemyAPI
        let expect = expectation(description: "Test GetLanguageURL")
        let alchemyLanguage = AlchemyLanguage(apiKey: apiKey)
        let failure = { (error: RestError) in print(error) }
        
        alchemyLanguage.getLanguage(forURL: testUrl, failure: failure) { language in
            XCTAssertNotNil(language, "Response should not be nil")
            XCTAssertNotNil(language.language, "Language should not be nil")
            expect.fulfill()
        }
        waitForExpectations( timeout: timeout) { error in XCTAssertNil(error, "Timeout") }
    }
    
    func testGetMicroformatsURL() {
        
        let apiKey = Credentials.alchemyAPI
        let expect = expectation(description: "Test GetMicroformatsURL")
        let alchemyLanguage = AlchemyLanguage(apiKey: apiKey)
        let failure = { (error: RestError) in print(error) }

        alchemyLanguage.getMicroformatData(forURL: testUrl, failure: failure) { microformats in
            XCTAssertNotNil(microformats, "Response should not be nil")
            XCTAssertNotNil(microformats.microformats, "Microformats should not be nil")
            expect.fulfill()
        }
        waitForExpectations( timeout: timeout) { error in XCTAssertNil(error, "Timeout") }
    }
    
    func testGetPubDateURL() {
        
        let apiKey = Credentials.alchemyAPI
        let expect = expectation(description: "Test GetPubDateURL")
        let alchemyLanguage = AlchemyLanguage(apiKey: apiKey)
        let failure = { (error: RestError) in print(error) }

        alchemyLanguage.getPubDate(forURL: testUrl, failure: failure) { pubDate in
            XCTAssertNotNil(pubDate, "Response should not be nil")
            XCTAssertNotNil(pubDate.publicationDate, "Publication date should not be nil")
            expect.fulfill()
        }
        waitForExpectations( timeout: timeout) { error in XCTAssertNil(error, "Timeout") }
    }
    
    func testGetTargetedSentimentURL() {
        
        let apiKey = Credentials.alchemyAPI
        let expect = expectation(description: "Test GetTargetedSentimentURL")
        let alchemyLanguage = AlchemyLanguage(apiKey: apiKey)
        let failure = { (error: RestError) in print(error) }
        let phrase = "Developers who want to offer Instant Apps will have to modularize their apps"
        
        alchemyLanguage.getTargetedSentiment(forURL: testUrl, target: phrase, failure: failure) { sentiment in
            XCTAssertNotNil(sentiment, "Response should not be nil")
            XCTAssertNotNil(sentiment.docSentiment, "Sentiment should not be nil")
            expect.fulfill()
        }
        waitForExpectations( timeout: timeout) { error in XCTAssertNil(error, "Timeout") }
    }
    
    func testGetRankedTaxonomyURL() {
        
        let apiKey = Credentials.alchemyAPI
        let expect = expectation(description: "Test GetRankedTaxonomyURL")
        let alchemyLanguage = AlchemyLanguage(apiKey: apiKey)
        let failure = { (error: RestError) in print(error) }
        
        alchemyLanguage.getRankedTaxonomy(forURL: testUrl, failure: failure) { taxonomies in
            XCTAssertNotNil(taxonomies, "Response should not be nil")
            XCTAssertNotNil(taxonomies.taxonomy, "Taxonomies should not be nil")
            expect.fulfill()
        }
        waitForExpectations( timeout: timeout) { error in XCTAssertNil(error, "Timeout") }
    }
    
    func testGetRawTextURL() {
        
        let apiKey = Credentials.alchemyAPI
        let expect = expectation(description: "Test GetRawTextURL")
        let alchemyLanguage = AlchemyLanguage(apiKey: apiKey)
        let failure = { (error: RestError) in print(error) }

        alchemyLanguage.getRawText(forURL: testUrl, failure: failure) { rawText in
            XCTAssertNotNil(rawText, "Response should not be nil")
            XCTAssertNotNil(rawText.text, "Response should not be nil")
            expect.fulfill()
        }
        waitForExpectations( timeout: timeout) { error in XCTAssertNil(error, "Timeout") }
    }
    
    func testGetTextURL() {
        
        let apiKey = Credentials.alchemyAPI
        let expect = expectation(description: "Test GetTextURL")
        let alchemyLanguage = AlchemyLanguage(apiKey: apiKey)
        let failure = { (error: RestError) in print(error) }

        alchemyLanguage.getText(forURL: testUrl, failure: failure) { text in
            XCTAssertNotNil(text, "Response should not be nil")
            XCTAssertNotNil(text.text, "Text should not be nil")
            expect.fulfill()
        }
        waitForExpectations( timeout: timeout) { error in XCTAssertNil(error, "Timeout") }
    }
    
    func testGetTitleURL() {
        
        let apiKey = Credentials.alchemyAPI
        let expect = expectation(description: "Test GetTitleURL")
        let alchemyLanguage = AlchemyLanguage(apiKey: apiKey)
        let failure = { (error: RestError) in print(error) }

        alchemyLanguage.getTitle(forURL: testUrl, failure: failure) { title in
            XCTAssertNotNil(title, "Response should not be nil")
            XCTAssertNotNil(title.title, "Title should not be nil")
            expect.fulfill()
        }
        waitForExpectations( timeout: timeout) { error in XCTAssertNil(error, "Timeout") }
    }
    
    func testDetectFeedsURL() {
        
        let apiKey = Credentials.alchemyAPI
        let expect = expectation(description: "Test DetectFeedsURL")
        let alchemyLanguage = AlchemyLanguage(apiKey: apiKey)
        let failure = { (error: RestError) in print(error) }
        
        alchemyLanguage.getFeedLinks(forURL: testUrl, failure: failure) { feeds in
            XCTAssertNotNil(feeds, "Response should not be nil")
            XCTAssertNotNil(feeds.feeds, "Feeds should not be nil")
            expect.fulfill()
        }
        waitForExpectations( timeout: timeout) { error in XCTAssertNil(error, "Timeout") }
    }
    
    func testGetEmotionURL() {
        
        let apiKey = Credentials.alchemyAPI
        let expect = expectation(description: "Test GetEmotionURL")
        let alchemyLanguage = AlchemyLanguage(apiKey: apiKey)
        let failure = { (error: RestError) in print(error) }
        
        alchemyLanguage.getEmotion(forURL: testUrl, failure: failure) { emotion in
            XCTAssertNotNil(emotion, "Response should not be nil")
            XCTAssertNotNil(emotion.docEmotions, "Feeds should not be nil")
            expect.fulfill()
        }
        waitForExpectations( timeout: timeout) { error in XCTAssertNil(error, "Timeout") }
    }
    
    /** Fail false positives. */
    func failWithResult<T>(result: T) {
        XCTFail("Negative test returned a result.")
    }

}
