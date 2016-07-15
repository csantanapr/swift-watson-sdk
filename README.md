# Watson Developer Cloud Swift SDK

[![Build Status](https://travis-ci.org/IBM-Swift/swift-watson-sdk.svg?branch=master)](https://travis-ci.org/IBM-Swift/swift-watson-sdk)
[![Swift 3.0](https://img.shields.io/badge/swift-3.0-orange.svg?style=flat)](https://swift.org/)
![Mac OS X](https://img.shields.io/badge/os-Mac%20OS%20X-green.svg?style=flat)
![Linux](https://img.shields.io/badge/os-linux-green.svg?style=flat)
![Apache 2](https://img.shields.io/badge/license-Apache2-blue.svg?style=flat)


> The Watson Developer Cloud Swift SDK is a collection of services to allow developers to quickly add Watson Cognitive Computing services and Analytics Insights for Weather to their Swift 3 applications.

> *The Watson Developer Cloud Swift SDK is currently in beta.*

## Table of Contents
* [Installation](#installation)
* [IBM Watson Services](#ibm-watson-services)
  - [Alchemy Vision](#alchemy-vision) (partial)
  - [Natural Language Classifier](#natural-language-classifier) (partial)
  - [Tone Analyzer](#tone-analyzer)
* [IBM Data and Analytics Services](#ibm-data-and-analytics-services)
  - [Insights For Weather](#insights-for-weather)
* [Authentication](#authentication)
* [Building and Testing](#build--test)
* [Open Source @ IBM](#open-source--ibm)
* [License](#license)
* [Contributing](#contributing)

## Installation
The Watson Developer Cloud Swift SDK requires dependencies to run correctly.  These dependencies can be found in the package manager file.  You can downloading the needed dependencies by invoking package manager with "swift build" from terminal which creates the Packages directory.  The project file can be created with "swift build -X" command invoked through terminal.

## IBM Watson Services

**Getting started with Watson Developer Cloud and Bluemix**

The IBM Watson™ Developer Cloud (WDC) offers a variety of services for developing cognitive applications. Each Watson service provides a Representational State Transfer (REST) Application Programming Interface (API) for interacting with the service. Some services, such as the Speech to Text service, provide additional interfaces.

IBM Bluemix™ is the cloud platform in which you deploy applications that you develop with Watson Developer Cloud services. The Watson Developer Cloud documentation provides information for developing applications with Watson services in Bluemix. You can learn more about Bluemix from the following links:

The IBM Bluemix documentation, specifically the pages [What is Bluemix](https://www.ng.bluemix.net/docs/)? and the [Bluemix overview](https://www.ng.bluemix.net/docs/overview/index.html).
IBM developerWorks, specifically the [IBM Bluemix section of IBM developerWorks](https://www.ibm.com/developerworks/cloud/bluemix/) and the article that provides [An introduction to the application lifecycle on IBM Bluemix](http://www.ibm.com/developerworks/cloud/library/cl-intro-codename-bluemix-video/index.html?ca=dat).

### Alchemy Vision

AlchemyVision is an API that can analyze an image and return the objects, people, and text found within the image. AlchemyVision can enhance the way businesses make decisions by integrating image cognition.

##### Links
* AlchemyVision API docs [here](http://www.alchemyapi.com/products/alchemyvision)
* Try out the [demo](http://visual-recognition-demo.mybluemix.net/)

##### Requirements
* An Alchemy [API Key](http://www.alchemyapi.com/api/register.html)

##### Usage
Instantiate an **AlchemyVision** object and set its api key

```swift

let alchemyVisionInstance = AlchemyVision(apiKey: String)

```


API calls are instance methods, and model class instances are returned as part of our callback.

e.g.

```swift

        let failure = { (error: RestError) in print(error) }
        
        alchemyVisionInstance.getRankedImageKeywords(url: urlString, 
        									 forceShowAll: true, 
        									 knowledgeGraph: true, 
        									 failure: failure) { (response) in

	    // code here

})
```

### Natural Language Classifier

The IBM Watson™ Natural Language Classifier service uses machine learning algorithms to return the top matching predefined classes for short text input. You create and train a classifier to connect predefined classes to example texts so that the service can apply those classes to new inputs.

##### Links
* Natural Lanaguage Classifier API docs [here](http://www.ibm.com/smarterplanet/us/en/ibmwatson/developercloud/natural-language-classifier/api/v1/)
* Try out the [demo](http://natural-language-classifier-demo.mybluemix.net/)

##### Usage
Instantiate a **NaturalLanguageClassifier** object and set its username and password

```swift

let naturalLanguageClassifier = NaturalLanguageClassifier(username: username, password: password)

```


API calls are instance methods, and model class instances are returned as part of our callback.

e.g.

```swift

	let failure = { (error: RestError) in print(error) }
        
	naturalLanguageClassifier.getClassifiers(failure: failure) { response in

		// code here
	})
```

### Tone Analyzer

The IBM Watson Tone Analyzer service can be used to discover, understand, and revise the language tones in text. The service uses linguistic analysis to detect three types of tones from written text: emotions, social tendencies, and writing style.

Emotions identified include things like anger, fear, joy, sadness, and disgust. Identified social tendencies include things from the Big Five personality traits used by some psychologists. These include openness, conscientiousness, extraversion, agreeableness, and emotional range. Identified writing styles include confident, analytical, and tentative.

##### Links
The following links provide more information about the IBM Watson Tone Analyzer service:

* [IBM Watson Tone Analyzer - Service Page](http://www.ibm.com/watson/developercloud/tone-analyzer.html)
* [IBM Watson Tone Analyzer - Documentation](http://www.ibm.com/watson/developercloud/doc/tone-analyzer/)

##### Usage
The following example demonstrates how to use the Tone Analyzer service:

```swift

import ToneAnalyzerV3

let username = "your-username-here"
let password = "your-password-here"
let version = "YYYY-MM-DD" // use today's date for the most recent version
let toneAnalyzer = ToneAnalyzer(username: username, password: password, version: version)

let text = "your-input-text"
let failure = { (error: RestError) in print(error) }

toneAnalyzer.getTone(text, failure: failure) { tones in
		// code here
}

```


## IBM Data and Analytics Services

**Getting started with IBM Data and Analytics Services and Bluemix**

Use IBM® Insights for Weather to incorporate weather data from The Weather Company (TWC) into your IBM® Bluemix® applications.

IBM Bluemix™ is the cloud platform in which you deploy applications that you develop with Watson Developer Cloud services. The Watson Developer Cloud documentation provides information for developing applications with Watson services in Bluemix. You can learn more about Bluemix from the following links:

The IBM Bluemix documentation, specifically the pages [What is Bluemix](https://www.ng.bluemix.net/docs/)? and the [Bluemix overview](https://www.ng.bluemix.net/docs/overview/index.html).
IBM developerWorks, specifically the [IBM Bluemix section of IBM developerWorks](https://www.ibm.com/developerworks/cloud/bluemix/) and the article that provides [An introduction to the application lifecycle on IBM Bluemix](http://www.ibm.com/developerworks/cloud/library/cl-intro-codename-bluemix-video/index.html?ca=dat).
 
#### Insights for Weather

This service lets you integrate historical and real-time weather data from The Weather Company into your IBM Bluemix application. You can retrieve weather data for an area specified by a geolocation. The data allows you to forecast, detect, and visualize disruptive weather events that might affect decision making in your application.

You can add weather observations and forecasts to your Bluemix application and display the weather data for an area that is specified by a geolocation by using the Insights for Weather REST APIs. The Weather Company is the most comprehensive provider of historical and forecast weather data. Data for all forms of weather, including precipitation, barometric pressure, wind, and thunderstorms, is captured.

You can use the REST APIs to retrieve the following information:

An hourly weather forecast for the next 24 hours that starts from the current time for a specified geolocation.
A daily weather forecast for the next 10 days that includes forecasts for the daytime and nighttime segments for a specified geolocation. This forecast includes the forecast narrative text string of up to 256 characters with appropriate units of measure for the location and in the language requested.
The current observed weather data for a specified geolocation. This weather data includes temperature, precipitation, wind direction and speed, humidity, barometric pressure, dew point, visibility, and ultraviolet (UV) radiation.
The observed weather data for a specified geolocation and a specified time range. This data is sourced from physical observation stations. This API returns weather observations for current conditions and past observations up to and including the previous 24 hours.

##### Links
* Insights for Weather API docs [here](https://console.ng.bluemix.net/docs/services/Weather/index.html)
* Try out the [demo](http://insights-for-weather-demo.mybluemix.net/)

##### Usage
Instantiate an **Insights for Weather** service:

```swift

let insightsForWeatherInstance = InsightsForWeather(username: username, password: password)

```

API calls are instance methods, and model class instances are returned as part of our callback.

e.g.

```swift
        let failure = { (error: RestError) in print(error) }
        
        insightsForWeather.getCurrentForecast(
            units: units,
            geocode: geocode,
            language: language,
            failure: failure) { response in

		// code here

})
```

## Authentication

IBM Watson Services and Insights for Weather are hosted in the Bluemix platform. Before you can use each service in the SDK, the service must first be created in Bluemix, bound to an Application, and you must have the credentials that Bluemix generates for that service. Alchemy services use a single API key, and all the other Watson services use a username and password credential.

## Build + Test

***XCode*** is used to build the project for testing and deployment.  Select Product->Build For->Testing to build the project in XCode's menu.  

In order to build the project and run the unit tests, a **credentials.plist** file needs to be populated with proper credentials in order to communicate with the running Watson services.  A copy of this file is located in the project's folder under **Tests**.  The **credentials.plist** file contains a key and value for each service's user name and password.  

There are some tests already in place that can be displayed when selecting the Test Navigator in XCode.  Right click on the test you want to run and select Test in the context menu to run that specific test.  You can also select a full node and right-click to run all of the tests in that node or service.  

## Open Source @ IBM
Find more open source projects on the [IBM Github Page](http://ibm.github.io/)

## License

This library is licensed under Apache 2.0. Full license text is
available in [LICENSE](LICENSE).

This SDK is intended solely for use with an Apple iOS product and intended to be used in conjunction with officially licensed Apple development tools.

## Contributing

See [CONTRIBUTING](CONTRIBUTING.md) on how to help out.

[personality_insights]: http://www.ibm.com/smarterplanet/us/en/ibmwatson/developercloud/doc/personality-insights/
[language_identification]: http://www.ibm.com/smarterplanet/us/en/ibmwatson/developercloud/doc/lidapi/
[machine_translation]: http://www.ibm.com/smarterplanet/us/en/ibmwatson/developercloud/doc/mtapi/
[document_conversion]: http://www.ibm.com/smarterplanet/us/en/ibmwatson/developercloud/doc/document-conversion/
[relationship_extraction]: http://www.ibm.com/smarterplanet/us/en/ibmwatson/developercloud/doc/sireapi/
[language_translation]: http://www.ibm.com/smarterplanet/us/en/ibmwatson/developercloud/doc/language-translation/
[visual_recognition]: http://www.ibm.com/smarterplanet/us/en/ibmwatson/developercloud/doc/visual-recognition/
[tradeoff_analytics]: http://www.ibm.com/smarterplanet/us/en/ibmwatson/developercloud/doc/tradeoff-analytics/
[text_to_speech]: http://www.ibm.com/smarterplanet/us/en/ibmwatson/developercloud/doc/text-to-speech/
[speech_to_text]: http://www.ibm.com/smarterplanet/us/en/ibmwatson/developercloud/doc/speech-to-text/
[tone-analyzer]: http://www.ibm.com/smarterplanet/us/en/ibmwatson/developercloud/doc/tone-analyzer/
[dialog]: http://www.ibm.com/smarterplanet/us/en/ibmwatson/developercloud/doc/dialog/
[concept-insights]: https://www.ibm.com/smarterplanet/us/en/ibmwatson/developercloud/doc/concept-insights/
[visual_insights]: http://www.ibm.com/smarterplanet/us/en/ibmwatson/developercloud/doc/visual-insights/

[alchemy_language]: http://www.alchemyapi.com/products/alchemylanguage
[sentiment_analysis]: http://www.alchemyapi.com/products/alchemylanguage/sentiment-analysis
[alchemy_vision]: http://www.alchemyapi.com/products/alchemyvision
[alchemy_data_news]: http://www.alchemyapi.com/products/alchemydata-news
