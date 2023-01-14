//
//  TemplateShotProperties.swift
//  Momenzo
//
//  Created by Flo Vouin on 18/01/2018.
//  Copyright © 2018 Flo. All rights reserved.
//

import Foundation

/**
    Defines the properties assigned to a given shot used in the montage.
*/
@objcMembers
class TemplateShotProperties: YepObject {
    /**
        The scene to use for an extra shot.
    */
    private(set) var defaultScene: Scene = .invalid
    /**
        The overlays to add to this shot.
    */
    private(set) var overlays: [TemplateOverlay] = []
    /**
        The text overlays to add to this shot.
    */
    private(set) var text: [TemplateText] = []
    /**
        The question that can be used for the text overlay.
    */
    private(set) var question: TemplateQuestion = .invalid
    /**
        The audio segments to add to this shot.
    */
    private(set) var audioSegments: [TemplateAudioSegment] = []

    init(defaultScene: Scene, overlays: [TemplateOverlay], text: [TemplateText], question: TemplateQuestion,
         audioSegments: [TemplateAudioSegment]) {
        self.defaultScene = defaultScene
        self.overlays = overlays
        self.text = text
        self.question = question
        self.audioSegments = audioSegments
        super.init(id: "")
    }
    
    

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override class func migrate(dictionary: DecoderDictionary, from version: Int) -> Bool {
        if version < 13 {
            dictionary["audioSegments"] = [TemplateAudioSegment]()
        }
        return true
    }
}
