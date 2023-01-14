//
//  Shot.swift
//  Momenzo
//
//  Created by Flo Vouin on 30/09/16.
//  Copyright © 2016 Flo. All rights reserved.
//

import Foundation

/**
    Describes a single shot that can be part of one or several montage description.
*/
@objcMembers
class Shot: YepObject {
    static let kMotionBottomToTop = "bottomToTop"
    static let kMotionTopToBottom = "topToBottom"
    static let kMotionLeftToRight = "leftToRight"
    static let kMotionRightToLeft = "rightToLeft"

    enum DeviceCamera: String {
        case back
        case front
    }

    /**
        The name of the shot. Not necessarily unique, but should accurately describe the shot.
    */
    private(set) var name: String = ""
    /**
        The duration of the shot, in milliseconds.
    */
    private(set) var duration: Int = 0
    /**
        If the shot can have a variable length, the maximum duration (in milliseconds) that can be recorded.
    */
    private(set) var maxDuration: Int = 0
    /**
        A set of features to display when the user prepares for the shot.
    */
    private(set) var stencil: [StencilFeature] = []
    /**
        The video motion in the shot.
    */
    private(set) var motion: String = ""
    /**
        The speed of the motion to track in "normalized length" / sec.
    */
    private(set) var translationSpeed: Double = 0.0
    /**
        The text to display while the user is preparing to record the shot.
    */
    private(set) var setupInstructions: String = ""
    /**
        The text to display on top of each video tip.
    */
    private(set) var instructionsTips: [String] = ["", ""]
    /**
        The video tips to display to help the user record the shot.
    */
    private(set) var videoTips: [String] = ["", ""]
    /**
        The identifier of the icon to use to represent the shot in the interface.
    */
    private(set) var icon: String = ""
    /**
        The duration of shot (in milliseconds) for which the scale should be changed.
    */
    private(set) var timeScalingDuration: Int = 0
    /**
        The time offset (in milliseconds) at which the scaling should begin.
    */
    private(set) var timeScalingOffset: Int = 0
    /**
        The time scale that will affect the given duration.
    */
    private(set) var timeScale: Double = 1.0
    /**
        The device camera that should be set before recording the shot.
    */
    private(set) var preferredCameraRaw: String = DeviceCamera.back.rawValue

    /**
        Whether this shots allows the user to import a static image instead.
    */
    private(set) var allowsImage: Bool = true

    /**
        The transformation / animation to apply to a static image used for this shot.
    */
    private(set) var imageTransformation: String = ""

    init(id: String, name: String, duration: Int, maxDuration: Int, stencil: [StencilFeature],
         motion: String, translationSpeed: Double, setupInstructions: String, instructionsTips: [String],
         videoTips: [String], icon: String, timeScalingDuration: Int, timeScalingOffset: Int, timeScale: Double,
         preferredCameraRaw: String, allowsImage: Bool, imageTransformation: String) {
        self.name = name
        self.duration = duration
        self.maxDuration = maxDuration
        self.stencil = stencil
        self.motion = motion
        self.translationSpeed = translationSpeed
        self.setupInstructions = setupInstructions
        self.instructionsTips = instructionsTips
        self.videoTips = videoTips
        self.icon = icon
        self.timeScalingDuration = timeScalingDuration
        self.timeScalingOffset = timeScalingOffset
        self.timeScale = timeScale
        self.preferredCameraRaw = preferredCameraRaw
        self.allowsImage = allowsImage
        self.imageTransformation = imageTransformation
        super.init(id: id)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

//    override class func migrate(dictionary: DecoderDictionary, from version: Int) -> Bool {
//        let parsedShot = (dictionary["rawObject"] as? [String: Any]).flatMap(Shot.from())
//
//        if version < 5 {
//            dictionary["icon"] = parsedShot?.icon ?? ""
//        }
//
//        if version < 8 {
//            dictionary["timeScalingDuration"] = parsedShot?.timeScalingDuration ?? 0
//            dictionary["timeScalingOffset"] = parsedShot?.timeScalingOffset ?? 0
//            dictionary["timeScale"] = parsedShot?.timeScale ?? 1.0
//        }
//
//        if version < 15 {
//            dictionary["preferredCameraRaw"] = parsedShot?.preferredCameraRaw ?? DeviceCamera.back.rawValue
//        }
//
//        if version < 16 {
//            dictionary["allowsImage"] = parsedShot?.allowsImage ?? true
//            dictionary["imageTransformation"] = parsedShot?.imageTransformation ?? ""
//        }
//
//        if version < 17 {
//            dictionary["maxDuration"] = parsedShot?.maxDuration ?? 0
//        }
//
//        return true
//    }

    /**
        Whether the time scaling defined in the shot is valid (or empty).
    */
    var isTimeScalingValid: Bool {
        get {
            return self.timeScalingOffset >= 0 && self.timeScalingDuration >= 0 && self.timeScale > 0.0
                && self.timeScalingOffset + self.timeScalingDuration <= self.duration
        }
    }

    /**
        Whether the time scaling defined in the shot is valid and not empty.
    */
    var hasTimeScaling: Bool {
        get {
            return self.isTimeScalingValid && self.timeScalingDuration > 0 && self.timeScale != 1.0
        }
    }

    /**
        The actual duration of video to record to create this shot. Takes into account the optional time scaling in the
        shot.
    */
    var durationToRecord: Int {
        get {
            guard self.hasTimeScaling else { return self.duration }

            return self.duration + Int((self.timeScale - 1.0) * Double(self.timeScalingDuration))
        }
    }

    /**
        The maximum duration of video that can be recorded to create this shot. Takes into account the optional time
        scaling in the shot.
    */
    var maxDurationToRecord: Int {
        get {
            guard self.variableDurationAllowed else { return self.durationToRecord }
            guard self.hasTimeScaling else { return self.maxDuration }

            return self.maxDuration + Int((self.timeScale - 1.0) * Double(self.timeScalingDuration))
        }
    }

    var preferredCamera: DeviceCamera {
        get {
            return DeviceCamera(rawValue: self.preferredCameraRaw) ?? .back
        }
    }

    /**
        Whether the user can choose the duration of the recording (between `duration` and `maxDuration`).
    */
    var variableDurationAllowed: Bool {
        get {
            return self.maxDuration > self.duration
        }
    }
}
