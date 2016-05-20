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

/** A set of faces identified in an image by the Alchemy Vision service. */
public struct FaceTags {

    /// The status of the request.
    public let status: String

    /// The URL of the requested image being tagged.
    public let url: String

    /// The number of transactions charged for this request.
    public let totalTransactions: Int

    /// The faces recognized in the requested image.
    public let imageFaces: [ImageFace]

    public init(json: JSON) {
        status = json["status"].stringValue
        url = json["url"].stringValue
        totalTransactions = json["totalTransactions"].intValue
        imageFaces = json["imageFaces"].arrayValue.map(ImageFace.init)
    }
}

/** A face recognized in the requested image. */
public struct ImageFace {

    /// The coordinate of the left-most pixel of the detected face.
    public let positionX: Int

    /// The coordinate of the top-most pixel of the detected face.
    public let positionY: Int

    /// The width, in pixels, of the detected face.
    public let width: Int

    /// The height, in pixels, of the detected face.
    public let height: Int

    /// The gender of the detected face.
    public let gender: Gender

    /// The age of the detected face.
    public let age: Age

    /// The identity of the detected face.
    public let identity: Identity

    /// Information to disambiguate the detected face.
    public let disambiguated: Disambiguated

    public init(json: JSON) {
        positionX = json["positionX"].intValue
        positionY = json["positionY"].intValue
        width = json["width"].intValue
        height = json["height"].intValue
        gender = Gender(json: json["gender"])
        age = Age(json: json["age"])
        identity = Identity(json: json["identity"])
        disambiguated = Disambiguated(json: json["identity"]["disambiguated"])
    }
}

/** The gender of a detected face. */
public struct Gender {

    /// The gender of the detected face.
    public let gender: String

    /// The likelihood that this gender corresponds to the detected face.
    public let score: Double

    public init(json: JSON) {
        gender = json["gender"].stringValue
        score = json["score"].doubleValue
    }
}

/** The age of a detected face. */
public struct Age {

    /// The age range of the detected face.
    public let ageRange: String

    /// The likelihood that this age range corresponds to the detected face.
    public let score: Double

    public init(json: JSON) {
        ageRange = json["ageRange"].stringValue
        score = json["score"].doubleValue
    }
}

/** The identity of a detected face. */
public struct Identity {

    /// The name of the detected face, if the face is identified as a known celebrity.
    public let name: String

    /// The likelihood that this name corresponds to the detected face.
    public let score: Double

    /// Metadata derived from the Alchemy knowledge graph.
    public let knowledgeGraph: KnowledgeGraph?

    public init(json: JSON) {
        name = json["name"].stringValue
        score = json["score"].doubleValue
        if json["knowledgeGraph"].exists() {
            knowledgeGraph = KnowledgeGraph(json: json["knowledgeGraph"])
        } else {
            knowledgeGraph = nil
        }
    }
}

/** Information to disambiguate the detected face. */
public struct Disambiguated {

    /// The disambiguated entity name.
    public let name: String

    /// The disambiguated entity sub-type. Sub-types expose additional ontological mappings for a
    /// detected entity, such as identification of a person as a politician or athlete.
    public let subType: [String]

    /// The disambiguated entity website.
    public let website: String

    /// SameAs link to DBpedia for the disambiguated entity.
    public let dbpedia: String

    /// SameAs link to YAGO for the disambiguated entity.
    public let yago: String

    /// SameAs link to OpenCyc for the disambiguated entity.
    public let opencyc: String

    /// SameAs link to UMBEL for the disambiguated entity.
    public let umbel: String

    /// SameAs link to Freebase for the disambiguated entity.
    public let freebase: String

    /// SameAs link to MusicBrainz for the disambiguated entity.
    public let crunchbase: String

    public init(json: JSON) {
        name = json["name"].stringValue
        var subTypeInternal:[String] = []
        for type in json["subType"].arrayValue {
            subTypeInternal.insert(type.stringValue, at: 0)
        }
        subType = subTypeInternal
        website = json["website"].stringValue
        dbpedia = json["dbpedia"].stringValue
        yago = json["yago"].stringValue
        opencyc = json["opencyc"].stringValue
        umbel = json["umbel"].stringValue
        freebase = json["freebase"].stringValue
        crunchbase = json["crunchbase"].stringValue
    }
}