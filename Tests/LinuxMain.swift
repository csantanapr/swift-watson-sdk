import XCTest

@testable import WeatherCompanyDataTests
@testable import ToneAnalyzerTests

XCTMain([
	testCase(WeatherCompanyDataTests.allTests),
	testCase(ToneAnalyzerTests.allTests)
])
