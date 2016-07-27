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
import Foundation

/** A response from the Conversation service. */
public struct MessageResponse {
    
    /// The user input from the request.
    public let input: InputData
    
    /// Information about the state of the conversation.
    public let context: Context
    
    /// An array of terms from the request that were identified as entities.
    public let entities: [Entity]
    
    /// An array of terms from the request that were identified as intents. The list is sorted in
    /// descending order of confidence. If there are 10 or fewer intents, the sum of the confidence
    /// values is 100%.
    public let intents: [Intent]
    
    /// An output object that includes the response to the user,
    /// the nodes that were hit, and messages from the log.
    public let output: OutputData
    
    /// Used internally to initialize a `MessageResponse` model from JSON.
    public init(json: JSON) {
        input = InputData(json: json["input"])
        context = Context(json: json["context"])
        entities = json["entities"].arrayValue.map(Entity.init)
        intents = json["intents"].arrayValue.map(Intent.init)
        output = OutputData(json: json["output"])
    }
}

/** A term from the request that was identified as an entity. */
public struct Entity {
    
    /// The name of the recognized entity.
    public let entity: String
    
    /// The location where the entity value begins and ends in the input text.
    public let location: EntityLocation
    
    /// The term in the input text that was recognized.
    public let value: String
    
    /// Used internally to initialize an `Entity` model from JSON.
    public init(json: JSON) {
        entity = json["entity"].stringValue
        location = EntityLocation(json: json["location"])
        value = json["value"].stringValue
    }
}

/** The location where an entity value begins and ends in the input text. */
public struct EntityLocation {
    
    /// The zero-based character offset that indicates
    /// where an entity value begins in the input text.
    public let startIndex: Int
    
    /// The zero-based character offset that indicates
    /// where an entity value ends in the input text.
    public let endIndex: Int
    
    /// Used internally to initialize an `EntityLocation` model from JSON.
    public init(json: JSON) {
        let indices = json.arrayValue.map {$0.int!}
        startIndex = indices[0]
        endIndex = indices[1]
    }
}

/** A term from the request that was identified as an intent. */
public struct Intent {
    
    /// The name of the recognized intent.
    public let intent: String
    
    /// The confidence score of the intent, between 0 and 1.
    public let confidence: Double
    
    /// Used internally to initialize an `Intent` model from JSON.
    public init(json: JSON) {
        intent = json["intent"].stringValue
        confidence = json["confidence"].doubleValue
    }
}

/** An output object that includes the response to the user, the nodes that were hit, and messages from the log. */
public struct OutputData {
    
    /// An array of up to 50 messages logged with the request.
    public let logMessages: [LogMessageResponse]
    
    /// An array of responses to the user.
    public let text: [String]
    
    /// An array of the nodes that were executed to create the response. The information is
    /// useful for debugging and for visualizing the path taken through the node tree.
    public let nodesVisited: [String]
    
    /// Used internally to initialize a `OutputData` model from JSON.
    public init(json: JSON) {
        logMessages = json["log_messages"].arrayValue.map(LogMessageResponse.init)
        text = json["text"].arrayValue.map {$0.string!}
        nodesVisited = json["nodes_visited"].arrayValue.map {$0.string!}
    }
}

/** A message logged with the request. */
public struct LogMessageResponse {
    
    /// The severity of the message ("info", "error", or "warn")
    public let level: String?
    
    /// The log message
    public let msg: String?
    
    /// Used internally to initialize a `LogMessageResponse` model from JSON.
    public init(json: JSON) {
        level = json["level"].string
        msg = json["msg"].string
    }
}
