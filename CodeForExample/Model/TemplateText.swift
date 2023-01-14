//
//  TemplateText.swift
//  Momenzo
//
//  Created by Flo Vouin on 24/03/2017.
//  Copyright © 2017 Flo. All rights reserved.
//

import Foundation

/**
    Describes a single text overlay.
*/
@objcMembers
class TemplateText: YepObject {
    /**
        The text to display.
    */
    private(set) var text: String = ""
    /**
        The size of the text.
    */
    private(set) var size: Double = 0.0
    /**
        The font to use to write the text.
    */
    private(set) var font: String = ""
    /**
        The color of the text.
    */
    private(set) var color: String = ""
    /**
        The time at which the text should be displayed, in milliseconds.
    */
    private(set) var startTime: Int = 0
    /**
        The duration for which the text is displayed, in milliseconds.
    */
    private(set) var duration: Int = 0
    /**
        The time for the text to fade in and fade out.
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
        The width of the bounding box for the text.
    */
    private(set) var maxWidth: Double = 0.0
    /**
        The height of the bounding box for the text.
    */
    private(set) var maxHeight: Double = 0.0
    /**
        The horizontal alignment of the text inside the bounding box.
    */
    private(set) var textAlignment: String = ""
    /**
        The vertical alignment of the text inside the bounding box.
    */
    private(set) var verticalTextAlignment: String = ""
    /**
        The spacing between lines of text.
    */
    private(set) var lineSpacing: Double = 0.0
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

    init(id: String, text: String, size: Double, font: String, color: String, startTime: Int, duration: Int,
         fadeDuration: Int, horizontalAlignment: String, verticalAlignment: String, horizontalMargin: Double,
         verticalMargin: Double, maxWidth: Double, maxHeight: Double, textAlignment: String,
         verticalTextAlignment: String, lineSpacing: Double, timeGravity: String, zIndex: Int) {
        self.text = text
        self.size = size
        self.font = font
        self.color = color
        self.startTime = startTime
        self.duration = duration
        self.fadeDuration = fadeDuration
        self.horizontalAlignment = horizontalAlignment
        self.verticalAlignment = verticalAlignment
        self.horizontalMargin = horizontalMargin
        self.verticalMargin = verticalMargin
        self.maxWidth = maxWidth
        self.maxHeight = maxHeight
        self.textAlignment = textAlignment
        self.verticalTextAlignment = verticalTextAlignment
        self.lineSpacing = lineSpacing
        self.timeGravity = timeGravity
        self.zIndex = zIndex
        super.init(id: id)
    }
    
    init(overlay: defaultSceneText) {
        self.text = overlay.text!
        self.size = overlay.size!
        self.font = overlay.font!
        self.color = overlay.color!
        self.startTime = overlay.startTime!
        self.duration = overlay.duration!
        self.fadeDuration = overlay.fadeDuration!
        self.horizontalAlignment = overlay.horizontalAlignment!
        self.verticalAlignment = overlay.verticalAlignment!
        self.horizontalMargin = overlay.horizontalMargin!
        self.verticalMargin = overlay.verticalMargin!
        self.maxWidth = overlay.maxWidth!
        self.maxHeight = overlay.maxHeight!
        self.textAlignment = overlay.textAlignment!
        self.verticalTextAlignment = overlay.verticalTextAlignment ?? "center"
        self.lineSpacing = overlay.lineSpacing ?? -10.0
        self.timeGravity = ""
        self.zIndex = overlay.zIndex ?? 0
        super.init(id: overlay.id ?? "")
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override class func migrate(dictionary: DecoderDictionary, from version: Int) -> Bool {
        if version < 3 {
            dictionary["lineSpacing"] = Double(0.0) as Any
        }
        if version < 5 {
            dictionary["timeGravity"] = ""
        }
        if version < 6 {
            dictionary["zIndex"] = 0
        }
        return true
    }
}
