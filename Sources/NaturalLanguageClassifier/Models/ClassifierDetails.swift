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

import SwiftyJSON

/** A classifer supported by the Natural Language Classifier service. */
public struct ClassifierDetails {
    
    /// A unique identifier for this classifier.
    public let classifierId: String
    
    /// The user-supplied name of the classifier.
    public let name: String?
    
    /// The language used for the classifier.
    public let language: String
    
    /// The date and time (UTC) that the classifier was created.
    public let created: String
    
    /// A link to the classifer.
    public let url: String
    
    /// The classifier's status.
    public let status: ClassifierStatus
    
    /// A human-readable descriptiono of the classifier's status.
    public let statusDescription: String
    
    /// Used internally to initialize a `ClassifierDetails` model from JSON.
    public init(json: JSON) {
        classifierId = json["classifier_id"].stringValue
        name = json["name"].stringValue
        language = json["language"].stringValue
        created = json["created"].stringValue
        url = json["url"].stringValue
        statusDescription = json["status_description"].stringValue
        status = ClassifierStatus(rawValue: json["status"].stringValue)!
    }
}

/** The status of a classifier. */
public enum ClassifierStatus: String {
    
    /// Available
    case Available = "Available"
    
    /// Failed
    case Failed = "Failed"
    
    /// NonExistent
    case NonExistent = "Non Existent"
    
    /// Training
    case Training = "Training"
    
    /// Unavailable
    case Unavailable = "Unavailable"
}

public enum ClassifierError: ErrorProtocol {
    case invalidStatus(String)
    case unknown
}
