//
//  TemplateOverlay.swift
//  Momenzo
//
//  Created by Flo Vouin on 13/04/2017.
//  Copyright © 2017 Flo. All rights reserved.
//

import Foundation

/**
    Describes a single image overlay.
*/
@objcMembers
class TemplateOverlay: YepObject {
    /**
        The (image) asset to display.
    */
    private(set) var asset: String = ""
    /**
        The opacity of the image to display (between 0.0 and 1.0).
    */
    private(set) var opacity: Double = 0.0
    /**
        The time at which the image should be displayed, in milliseconds.
    */
    private(set) var startTime: Int = 0
    /**
        The duration for which the image is displayed, in milliseconds.
    */
    private(set) var duration: Int = 0
    /**
        The time for the image to fade in and fade out.
    */
    private(set) var fadeDuration: Int = 0
    /**
        The horizontal alignment.
    */
    private(set) var horizontalAlignment: String = ""
    /**
        The vertical alignment.
    */
    private(set) var verticalAlignment: String = ""
    /**
        The margin to the left and right bounds of the screen.
    */
    private(set) var horizontalMargin: Double = 0.0
    /**
        The margin to the top and bottom bounds of the screen.
    */
    private(set) var verticalMargin: Double = 0.0
    /**
        In case the asset is animated, its number of frames per second.
    */
    private(set) var fps: Double = 30.0
    /**
        The frame that should be kept still if the animation is shorter that the overlay duration.
        `-1` if the animation should be looped.
    */
    private(set) var keyFrame: Int = -1
    /**
        The IDs of the text overlays required for this overlay to appear.
    */
    private(set) var requiredTexts: [String] = []
    /**
        If `true`, all the `requiredTexts` must be available for the overlay to appear. If `false`, a single text
        overlay is enough.
    */
    private(set) var requiresAllTexts: Bool = true
    /**
        Specifies how the overlay adapts to extra videos in the template:
            - "start" means the overlay keeps its defined time range.
            - "end" means the overlay keeps its duration but is shifted such that the interval from the overlay to the
                end of the composition stays the same.
            - "stretch" means the overlays keeps its start time, but is lengthened such that the interval from the
                overlay to the end of the composition also stays the same.
    */
    private(set) var timeGravity: String = ""
    /**
        Determines the z position of the overlay related to other overlays and texts. Set to a high a value to make the
        overlay appear in front of the others.
    */
    private(set) var zIndex: Int = 0
    /**
        Conditions that must be satisfied by anwers to the questions for the overlay to appear.
        The condition syntax is:
        `<questionID>==<value>` or `<questionID>!=<value>`
    */
    private(set) var questionConditions: [String] = []

    init(asset: String, opacity: Double, startTime: Int, duration: Int, fadeDuration: Int, horizontalAlignment: String,
         verticalAlignment: String, horizontalMargin: Double, verticalMargin: Double, fps: Double, keyFrame: Int,
         requiredTexts: [String], requiresAllTexts: Bool, timeGravity: String, zIndex: Int,
         questionConditions: [String]) {
        self.asset = asset
        self.opacity = opacity
        self.startTime = startTime
        self.duration = duration
        self.fadeDuration = fadeDuration
        self.horizontalAlignment = horizontalAlignment
        self.verticalAlignment = verticalAlignment
        self.horizontalMargin = horizontalMargin
        self.verticalMargin = verticalMargin
        self.fps = fps
        self.keyFrame = keyFrame
        self.requiredTexts = requiredTexts
        self.requiresAllTexts = requiresAllTexts
        self.timeGravity = timeGravity
        self.zIndex = zIndex
        self.questionConditions = questionConditions
        super.init(id: "")
    }
    
    init (overlay: defaultSceneOverlay)  {
        self.asset = overlay.asset!
        self.opacity = overlay.opacity!
        self.startTime = overlay.startTime!
        self.duration = overlay.duration!
        self.fadeDuration = overlay.fadeDuration!
        self.horizontalAlignment = overlay.horizontalAlignment!
        self.verticalAlignment = overlay.verticalAlignment!
        self.horizontalMargin = overlay.horizontalMargin ?? 110.0
        self.verticalMargin = overlay.verticalMargin ?? 0.0
        self.fps = overlay.fps ?? 30.0
        self.keyFrame = overlay.keyFrame ?? -3
        self.requiredTexts = overlay.requiredTexts ?? []
        self.requiresAllTexts = true
        self.timeGravity =  ""
        self.zIndex = overlay.zIndex ?? 0
        self.questionConditions =  []
        super.init(id: "")
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override class func migrate(dictionary: DecoderDictionary, from version: Int) -> Bool {
        if version < 2 {
            dictionary["requiresAllTexts"] = true as Any
        }
        if version < 5 {
            dictionary["timeGravity"] = ""
        }
        if version < 6 {
            dictionary["zIndex"] = 0
        }
        if version < 10 {
            dictionary["questionConditions"] = [String]()
        }
        return true
    }
}
