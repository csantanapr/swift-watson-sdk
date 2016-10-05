//
//  Emotions.swift
//  WatsonDeveloperCloud
//
//  Created by Harrison Saylor on 5/26/16.
//  Copyright © 2016 Glenn R. Fisher. All rights reserved.
//

import Foundation
import SwiftyJSON

/**
 Emotions and their prevalence extracted from a document
 */
public struct Emotions {
    /** amount of anger extracted */
    public let anger: Double?
    /** amount of disgust extracted */
    public let disgust: Double?
    /** amount of fear extracted */
    public let fear: Double?
    /** amount of joy extracted */
    public let joy: Double?
    /** amount of sadness extracted */
    public let sadness: Double?
    
    /// Used internally to initialize a Emotions object
    public init(json: JSON) {
        if let angerString = json["anger"].string {
            anger = Double(angerString)
        } else {
            anger = nil
        }
        if let disgustString = json["disgust"].string {
            disgust = Double(disgustString)
        } else {
            disgust = nil
        }
        if let fearString = json["fear"].string {
            fear = Double(fearString)
        } else {
            fear = nil
        }
        if let joyString = json["joy"].string {
            joy = Double(joyString)
        } else {
            joy = nil
        }
        if let sadnessString = json["sadness"].string {
            sadness = Double(sadnessString)
        } else {
            sadness = nil
        }
    }
}
