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
 The IBM Watson Natural Language Classifier service enables developers without a background in
 machine learning or statistical algorithms to create natural language interfaces for their
 applications. The service interprets the intent behind text and returns a corresponding
 classification with associated confidence levels. The return value can then be used to trigger
 a corresponding action, such as redirecting the request or answering a question.
 */
public class NaturalLanguageClassifier {
    
    private let username: String
    private let password: String
    private let serviceURL: String
    private let domain = "com.ibm.watson.developer-cloud.NaturalLanguageClassifierV1"
    
    /**
     Create a `NaturalLanguageClassifier` object.
     
     - parameter username: The username used to authenticate with the service.
     - parameter password: The password used to authenticate with the service.
     - parameter serviceURL: The base URL to use when contacting the service.
     */
    public init(
        username: String,
        password: String,
        serviceURL: String = "https://gateway.watsonplatform.net/natural-language-classifier/api")
    {
        self.username = username
        self.password = password
        self.serviceURL = serviceURL
    }
    
    /**
     Retrieves the list of classifiers for the service instance.
     
     - parameter failure: A function executed if an error occurs.
     - parameter success: A function executed with the list of available standard and custom models.
       The array is empty if no classifiers are available.
     */
    public func getClassifiers(
        failure: (RestError -> Void)? = nil,
        success: [ClassifierModel] -> Void) {
        
        // construct REST request
        let request = RestRequest(
            method: .GET,
            url: serviceURL + "/v1/classifiers",
            username: username,
            password: password,
            acceptType: "application/json"
        )
        
        // execute REST request
        request.responseJSON { response in
            print(response)
            switch response {
            case .success(let json): success( json["classifiers"].arrayValue.map(ClassifierModel.init))
            case .failure(let error): failure?(error)
            }
        }
    }
    

    
    /**
     Uses the provided classifier to assign labels to the input text. The status of the classifier 
     must be "Available" before you can classify calls.
     
     - parameter classifierId: Classifier ID to use
     - parameter text: Phrase to classify
     - parameter failure: A function executed if an error occurs.
     - parameter success: A function executed with the list of available standard and custom models.
     */
    public func classify(
        classifierId: String,
        text: String,
        failure: (RestError -> Void)? = nil,
        success: Classification -> Void) {
        

        // construct query parameters
        var queryParameters = [NSURLQueryItem]()
        queryParameters.append(NSURLQueryItem(name: "classifier_id", value: classifierId))
        queryParameters.append(NSURLQueryItem(name: "text", value: text))
        
        // construct REST request
        let request = RestRequest(
            method: .GET,
            url: serviceURL + "/v1/classifiers/\(classifierId)/classify",
            acceptType: "application/json",
            contentType: "application/json",
            username: username,
            password: password,
            queryParameters: queryParameters
        )
        
        // execute REST request
        request.responseJSON { response in
            switch response {
            case .success(let json): success(Classification(json: json))
            case .failure(let error): failure?(error)
            }
        }
    }
    
    /**
     Deletes the classifier with the classifierId.
     
     - parameter classifierId: The classifer ID used to delete the classifier
     - parameter failure: A function executed if an error occurs.
     - parameter success: A function executed with the list of available standard and custom models.
     */
    public func deleteClassifier(
        classifierId: String,
        failure: (RestError -> Void)? = nil,
        success: (Void -> Void)? = nil) {
        
        // construct REST request
        let request = RestRequest(
            method: .DELETE,
            url: serviceURL + "/v1/classifiers/\(classifierId)",
            acceptType: "application/json",
            username: username,
            password: password
        )
        
        // execute REST request
        request.responseJSON { response in
            switch response {
            case .success: break
            case .failure(let error): failure?(error)
            }
        }
    }

    /**
     Provides detailed information about the classifier with the user-specified classifierId.
     
     - parameter classifierId: The classifer ID used to retrieve the classifier
     - parameter failure: A function executed if an error occurs.
     - parameter success: A function executed with the list of available standard and custom models.
     */
    public func getClassifier(
        classifierId: String,
        failure: (RestError -> Void)? = nil,
        success: ClassifierDetails -> Void) {
        
        // construct REST request
        let request = RestRequest(
            method: .GET,
            url: serviceURL + "/v1/classifiers/\(classifierId)",
            acceptType: "application/json",
            username: username,
            password: password
        )
        
        // execute REST request
        request.responseJSON { response in
            switch response {
            case .success(let json): success(ClassifierDetails(json: json))
            case .failure(let error): failure?(error)
            }
        }
    }
}
