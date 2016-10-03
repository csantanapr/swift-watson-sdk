/**
 * Copyright IBM Corporation 2015
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

import Foundation
import SwiftyJSON
/**
 
 **DisambiguatedLinks**
 
 Disambiguate detected entities
 
 */

public struct DisambiguatedLinks {
    
    /** detected language */
    public let language: String?
    
    /** content URL */
    public let url: String?
    
    /**
     sameAs link to the US Census for this concept tag
     Note: Provided only for entities that exist in this linked data-set
     */
    public let census: String?
    
    /**
     sameAs link to the CIA World Factbook for this concept tag
     Note: Provided only for entities that exist in this linked data-set
     */
    public let ciaFactbook: String?
    
    /**
     website link to CrunchBase for this concept tag.
     Note: Provided only for entities that exist in CrunchBase.
     */
    public let crunchbase: String?
    
    /**
     sameAs link to DBpedia for this concept tag
     Note: Provided only for entities that exist in this linked data-set
     */
    public let dbpedia: String?
    
    /**
     sameAs link to Freebase for this concept tag.
     Note: Provided only for entities that exist in this linked data-set
     */
    public let freebase: String?
    
    /** latitude longitude - the geographic coordinates associated with this concept tag */
    public let geo: String?
    
    /**
     sameAs link to Geonames for this concept tag
     Note: Provided only for entities that exist in this linked data-set
     */
    public let geonames: String?
    
    /**
     * The music link to MusicBrainz for the disambiguated entity. Note: Provided only for
     * entities that exist in this linked data-set.
     */
    public let musicBrainz: String?
    
    /** The entity name. */
    public let name: String?
    
    /**
     * The link to OpenCyc for the disambiguated entity. Note: Provided only for entities
     * that exist in this linked data-set.
     */
    public let opencyc: String?
    
    /**  The disambiguated entity subType. */
    public let subType: [String]?
    
    /**
     * The link to UMBEL for the disambiguated entity. Note: Provided only for entities
     * that exist in this linked data-set.
     */
    public let umbel: String?
    
    /** The website. */
    public let website: String?
    
    /**
     * The link to YAGO for the disambiguated entity. Note: Provided only for entities
     * that exist in this linked data-set.
     */
    public let yago: String?
    
    /// Used internally to initialize a DisambiguatedLinks object
    public init(json: JSON) {
        language = json["language"].string
        url = json["url"].string
        census = json["census"].string
        ciaFactbook = json["ciaFactbook"].string
        crunchbase = json["crunchbase"].string
        dbpedia = json["dbpedia"].string
        freebase = json["freebase"].string
        geo = json["geo"].string
        geonames = json["geonames"].string
        musicBrainz = json["musicBrainz"].string
        name = json["name"].string
        opencyc = json["opencyc"].string
        subType = json["subType"].arrayValue.map({$0.stringValue})
        umbel = json["umbel"].string
        website = json["website"].string
        yago = json["yago"].string
    }
}

