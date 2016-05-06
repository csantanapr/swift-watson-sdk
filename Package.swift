import PackageDescription

let package = Package(
    name: "WatsonDeveloperCloud",
    dependencies: [
        .Package(url: "https://github.com/IBM-Swift/Kitura-net.git", majorVersion: 0, minor: 11),
        .Package(url: "https://github.com/IBM-Swift/SwiftyJSON.git", majorVersion: 7, minor: 0)
    ],
    targets: [
        Target(name: "RestKit"),
        Target(name: "InsightsForWeather", dependencies: [.Target(name: "RestKit")]),
        Target(name: "AlchemyVision", dependencies: [.Target(name: "RestKit")])
    ]
)
