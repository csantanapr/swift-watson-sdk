import KituraNet
import Foundation

let weather = Weather(username: "91784f91-1470-4ab8-bd5e-8f994decbde2", password: "0DDWvS44Im")
let failure = { (error: NSError) in print(error) }

weather.getCurrentWeather(units: "e", geocode: "24.53,84.50", language: "en-US", failure: failure) { response in
    print(response)
}

// let request = RestRequest(
//     method: .GET,
//     url: "https://twcservice.mybluemix.net/api/weather/v2/forecast/daily/10day",
//     username: "91784f91-1470-4ab8-bd5e-8f994decbde2",
//     password: "0DDWvS44Im"
// )

// request.execute { response in
//     if let response = response where response.statusCode == HttpStatusCode.OK {
//         do {
//             let body = NSMutableData()
//             try response.readAllData(into: body)
//             print(String(data: body, encoding: NSUTF8StringEncoding))
//         } catch {
//             print("Failed to read response.")
//         }
//     }
//     print("Response code was invalid: \(response?.statusCode).")
// }
