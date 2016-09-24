import XCTest

@testable import WeatherCompanyDataTests
@testable import ToneAnalyzerTest

XCTMain([
	testCase(WeatherCompanyDataTests.allTests)
	testCase(ToneAnalyzerTest.allTests)
])
