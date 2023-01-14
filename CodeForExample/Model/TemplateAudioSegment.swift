//
//  TemplateAudioSegment.swift
//  Momenzo
//
//  Created by Flo Vouin on 31/07/2018.
//  Copyright © 2018 Flo. All rights reserved.
//

import Foundation

/**
    Describes an audio segment to add to the montage.
*/
@objcMembers
class TemplateAudioSegment: YepObject {
    /**
        The audio asset to play.
    */
    private(set) var asset: String = ""
    /**
        The volume of the segment.
    */
    private(set) var volume: Double = 0.0
    /**
        The offset at which the audio asset will be played, in milliseconds.
    */
    private(set) var assetStartTime: Int = 0
    /**
        The composition time at which the asset should play, in milliseconds.
    */
    private(set) var startTime: Int = 0
    /**
        The duration for which the asset should play, in milliseconds.
    */
    private(set) var duration: Int = 0
    /**
        The time for the audio to fade in and fade out, in miliseconds.
    */
    private(set) var fadeDuration: Int = 0
    /**
        Specifies how the segment adapts to extra videos in the template:
            - "start" means the segment keeps its defined time range.
            - "end" means the segment keeps its duration but is shifted such that the interval from the segment to the
                end of the composition stays the same.
            - "stretch" means the segment keeps its start time, but is lengthened such that the interval from the
                segment to the end of the composition also stays the same.
    */
    private(set) var timeGravity: String = ""
    /**
        Conditions that must be satisfied by anwers to the questions for the segment to be played.
        The condition syntax is:
        `<questionID>==<value>` or `<questionID>!=<value>`
    */
    private(set) var questionConditions: [String] = []
    /**
        The volume of the soundtrack during this segment. `0.0` mutes the soundtrack, `1.0` keeps it at its original
        level. Defaults to `nan`, meaning the audio segment doesn't affect the current soundtrack volume.
    */
    private(set) var soundtrackVolume: Double = .nan

    init(asset: String, volume: Double, assetStartTime: Int, startTime: Int, duration: Int, fadeDuration: Int,
         timeGravity: String, questionConditions: [String], soundtrackVolume: Double) {
        self.asset = asset
        self.volume = volume
        self.assetStartTime = assetStartTime
        self.startTime = startTime
        self.duration = duration
        self.fadeDuration = fadeDuration
        self.timeGravity = timeGravity
        self.questionConditions = questionConditions
        self.soundtrackVolume = soundtrackVolume
        super.init(id: "")
    }
    
//    init(overlay: Overlay) {
//        self.asset = overlay.asset!
//        self.volume = 1.0
//        self.assetStartTime = 1
//        self.startTime = overlay.startTime!
//        self.duration = overlay.duration!
//        self.fadeDuration = overlay.fadeDuration!
//        self.timeGravity = ""
//        self.questionConditions =  [""]
//        self.soundtrackVolume = 1.0
//        super.init(id: "")
//    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override class func migrate(dictionary: DecoderDictionary, from version: Int) -> Bool {
        if version < 14 {
            dictionary["soundtrackVolume"] = Double.nan
        }
        return true
    }
}
