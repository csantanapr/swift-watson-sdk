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

import RestKit
import KituraNet
import SwiftyJSON

import Foundation

/**
 AlchemyVision is an API that can analyze an image and return the objects, people, and text
 found within the image. AlchemyVision can enhance the way businesses make decisions by
 integrating image cognition.
 */
public class AlchemyVision {
    
    private let apiKey: String
    private let domain = "com.ibm.watson.developer-cloud.WatsonDeveloperCloud"
    private let serviceURL = "http://gateway-a.watsonplatform.net/calls"

    /**
     Create an `AlchemyVision` object.

     - parameter apiKey: The API key credential to use when authenticating with the service.
     */
    public init(apiKey: String) {
        self.apiKey = apiKey
    }

    /**
     Perform image tagging on the primary image at a given URL.

     - parameter url: The URL at which to perform image tagging.
     - parameter forceShowAll: Should lower confidence tags be included in the response?
     - parameter knowledgeGraph: Should hierarchical metadata be provided for each tag?
     - parameter failure: A function executed if an error occurs.
     - parameter success: A function executed with the identified tags.
     */
    public func getRankedImageKeywords(
        url: String,
        forceShowAll: Bool? = nil,
        knowledgeGraph: Bool? = nil,
        failure: (RestError -> Void)? = nil,
        success: ImageKeywords -> Void)
    {
        // construct query parameters

        var queryParameters = [NSURLQueryItem]()
        queryParameters.append(NSURLQueryItem(name: "apikey", value: apiKey))
        queryParameters.append(NSURLQueryItem(name: "outputMode", value: "json"))
        queryParameters.append(NSURLQueryItem(name: "url", value: url))
        if let forceShowAll = forceShowAll {
            if forceShowAll {
                queryParameters.append(NSURLQueryItem(name: "forceShowAll", value: "1"))
            } else {
                queryParameters.append(NSURLQueryItem(name: "forceShowAll", value: "0"))
            }
        }
        if let knowledgeGraph = knowledgeGraph {
            if knowledgeGraph {
                queryParameters.append(NSURLQueryItem(name: "knowledgeGraph", value: "1"))
            } else {
                queryParameters.append(NSURLQueryItem(name: "knowledgeGraph", value: "0"))
            }
        }

        // construct REST request
        let request = RestRequest(
            method: .GET,
            url: serviceURL + "/url/URLGetRankedImageKeywords",
            acceptType: "application/json",
            queryParameters: queryParameters
        )
        
        // execute REST request
        request.responseJSON { response in
            switch response {
            case .success(let json): success(ImageKeywords(json: json))
            case .failure(let error): failure?(error)
            }
        }
    }
}
