import PackageDescription

let package = Package(
    name: "WatsonDeveloperCloud",
    targets: [
        Target(name: "RestKit"),
        Target(name: "WeatherCompanyData", dependencies: [.Target(name: "RestKit")]),
        Target(name: "NaturalLanguageClassifier", dependencies: [.Target(name: "RestKit")]),
        Target(name: "ToneAnalyzer", dependencies: [.Target(name: "RestKit")]),
        Target(name: "PersonalityInsights", dependencies: [.Target(name: "RestKit")]),
        Target(name: "Conversation", dependencies: [.Target(name: "RestKit")]),
        Target(name: "AlchemyLanguage", dependencies: [.Target(name: "RestKit")]),        
        Target(name: "AlchemyVision", dependencies: [.Target(name: "RestKit")])
    ],
    dependencies: [
        .Package(url: "https://github.com/IBM-Swift/Kitura-net.git", majorVersion: 1, minor: 0),
        .Package(url: "https://github.com/IBM-Swift/SwiftyJSON.git", majorVersion: 14)
    ]
)


