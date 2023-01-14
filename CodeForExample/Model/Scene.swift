//
//  Scene.swift
//  Momenzo
//
//  Created by Flo Vouin on 10/12/2016.
//  Copyright © 2016 Flo. All rights reserved.
//

import Foundation

/**
    A single scene in a template, describing how shot(s) should be displayed.
*/
@objcMembers
class Scene: YepObject {
    static let kInvalidID = "invalid"

    /**
        The shots to include in this scene.
    */
    private(set) var shots: [String] = []
    /**
        For each shot, the start time in the video (in milliseconds). The selected duration will be
        equal to the scene's duration.
    */
    private(set) var shotStartTimes: [Int] = []
    /**
        The duration of the scene, in milliseconds.
    */
    private(set) var duration: Int = 0
    /**
        Whether the sound of the original video(s) should be removed.
    */
    private(set) var muted: Bool = true
    /**
        If `true`, overlays from the shots will not be added to the composition.
    */
    private(set) var disableShotOverlays: Bool = false
    /**
        If `true`, audio segments from the shots will not be added to the composition.
    */
    private(set) var disableShotAudioSegments: Bool = false
    /**
        If `true`, the scene's duration can be extended to use the additional duration that was recorded in the shots.
    */
    private(set) var variableDurationAllowed: Bool = false
    /**
        The volume of the soundtrack during this scene. `0.0` mutes the soundtrack, `1.0` keeps it at its original
        level.
    */
    private(set) var soundtrackVolume: Double = 1.0
    /**
        A dictionary of parameters for the scene.
    */
    private(set) var parameters: [String: String] = [:]

    init(id: String, shots: [String], shotStartTimes: [Int], duration: Int, muted: Bool, disableShotOverlays: Bool,
         disableShotAudioSegments: Bool, variableDurationAllowed: Bool, soundtrackVolume: Double,
         parameters: [String: String]) {
        self.shots = shots
        self.shotStartTimes = shotStartTimes
        self.duration = duration
        self.muted = muted
        self.disableShotOverlays = disableShotOverlays
        self.disableShotAudioSegments = disableShotAudioSegments
        self.variableDurationAllowed = variableDurationAllowed
        self.soundtrackVolume = soundtrackVolume
        self.parameters = parameters
        super.init(id: id)
    }
    
    init(overlay: defaultSceneScene) {
        self.shots = overlay.shots!
        self.shotStartTimes = overlay.shotStartTimes!
        self.duration = overlay.duration!
        self.muted = overlay.muted!
        self.disableShotOverlays = overlay.disableShotOverlays!
        self.disableShotAudioSegments = true
        self.variableDurationAllowed = true
        self.soundtrackVolume = overlay.soundtrackVolume!
        self.parameters = ["":""]
        super.init(id: overlay.id!.rawValue)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override class func migrate(dictionary: DecoderDictionary, from version: Int) -> Bool {
        if version < 5 {
            dictionary["disableShotOverlays"] = false as Any
        }
        if version < 7 {
            dictionary["soundtrackVolume"] = 1.0
        }
        if version < 13 {
            dictionary["disableShotAudioSegments"] = false as Any
        }
        if version < 17 {
            dictionary["variableDurationAllowed"] = false as Any
        }
        return true
    }

    static let invalid = Scene(id: kInvalidID, shots: [], shotStartTimes: [], duration: 0, muted: true,
                               disableShotOverlays: false, disableShotAudioSegments: false,
                               variableDurationAllowed: false, soundtrackVolume: 1.0, parameters: [:])
}
