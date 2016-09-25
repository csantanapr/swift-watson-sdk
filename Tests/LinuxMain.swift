import XCTest

@testable import WeatherCompanyDataTests
@testable import ToneAnalyzerTests
@testable import AlchemyVisionTests
@testable import ConversationTests
@testable import NaturalLanguageClassifierTests
@testable import PersonalityInsightsTests

XCTMain([
	testCase(WeatherCompanyDataTests.allTests),
	testCase(ToneAnalyzerTests.allTests),
	testCase(AlchemyVisionTests.allTests),
	testCase(ConversationTests.allTests),
	testCase(NaturalLanguageClassifierTests.allTests),
	testCase(PersonalityInsightsTests.allTests)
])
