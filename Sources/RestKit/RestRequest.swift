import KituraNet
import SwiftyJSON
import Foundation

public enum Method: String {
    case OPTIONS, GET, HEAD, POST, PUT, PATCH, DELETE, TRACE, CONNECT
}

public class RestRequest {

    private let method: Method
    private let url: String
    private let acceptType: String?
    private let contentType: String?
    private let queryParameters: [NSURLQueryItem]?
    private let headerParameters: [String: String]?
    private let messageBody: NSData?
    private let username: String?
    private let password: String?
    private let domain = "com.ibm.swift.rest-kit"

    public func response(callback: ClientRequestCallback) {
    
        // construct url with query parameters
        let urlComponents = NSURLComponents(string: self.url)!
        if let queryParameters = queryParameters where !queryParameters.isEmpty {
            urlComponents.queryItems = queryParameters
        }

        // construct headers
        var headers = [String: String]()
        
        // set the request's accept type
        if let acceptType = acceptType {
            headers["Accept"] = acceptType
        }

        // set the request's content type
        if let contentType = contentType {
            headers["Content-Type"] = contentType
        }

        // set the request's header parameters
        if let headerParameters = headerParameters {
            for (key, value) in headerParameters {
                headers[key] = value
            }
        }
        
        // verify required url components 
        guard let scheme = urlComponents.scheme else {
            print("Cannot execute request. Please add a scheme to the url (e.g. \"http://\").")
            return
        }
        guard let hostname = urlComponents.percentEncodedHost else {
            print("Cannot execute request. Please add a hostname to the url (e.g. \"www.ibm.com\").")
            return
        }
        guard let path = urlComponents.percentEncodedPath else {
            print("Cannot execute request. Path could not be determined from the url.")
            return
        }

        // construct client request options
        var options = [ClientRequestOptions]()
        options.append(.method(method.rawValue))
        options.append(.headers(headers))
        options.append(.schema(scheme + "://"))
        options.append(.hostname(hostname))
        if let query = urlComponents.percentEncodedQuery {
            options.append(.path(path + "?" + query))
        } else {
            options.append(.path(path))
        }
        if let username = username {
            options.append(.username(username))
        }
        if let password = password {
            options.append(.password(password))
        }

        // construct and execute HTTP request
        HTTP.request(options, callback: callback).end()
    }

    public func responseJSON(callback: Result<JSON, RestError> -> Void) {

        self.response { r in
            guard let response = r where response.statusCode == HTTPStatusCode.OK else {
                let failureReason = "Response status code was unacceptable: \(r?.statusCode)."
                //let userInfo = [NSLocalizedFailureReasonErrorKey: failureReason]
                //let error = NSError(domain: self.domain, code: 0, userInfo: userInfo)
                let error = RestError.badResponse(failureReason)
                callback(.failure(error))
                return
            }

            do {
                let body = NSMutableData()
                try response.readAllData(into: body)
                let json = JSON(data: body)
                callback(.success(json))
            } catch {
                let failureReason = "Could not parse response data."
                let error = RestError.badData(failureReason)
                callback(.failure(error))
                return
            }
        }
    }

    public init(
        method: Method,
        url: String,
        acceptType: String? = nil,
        contentType: String? = nil,
        queryParameters: [NSURLQueryItem]? = nil,
        headerParameters: [String: String]? = nil,
        messageBody: NSData? = nil,
        username: String? = nil,
        password: String? = nil)
    {
        self.method = method
        self.url = url
        self.acceptType = acceptType
        self.contentType = contentType
        self.queryParameters = queryParameters
        self.headerParameters = headerParameters
        self.messageBody = messageBody
        self.username = username
        self.password = password
    }
}
