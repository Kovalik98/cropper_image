//
//  Model+JSON.swift
//  Momenzo
//
//  Created by Flo Vouin on 12/03/2017.
//  Copyright © 2017 Flo. All rights reserved.
//

import MomenzoVideoEngine

// Those are extensions that handle parsing from JSON objects. This was implemented before JSON handling got better in
// Swift and hasn't been changed since. Also, it would probably require some more work to make this compatible with the
// Objective C objects we're using for use with YapDatabase.

extension Shot {
    static func from() -> Shot? {
        let id = "shot_demo0_en_kitchen_s"
        let name = "Kitchen"
        let duration = 4400
        let stencil = [StencilFeature.from()!].self
//            dic.array(for: "stencil", objectConverter: StencilFeature.from(dic:))!
        let motion = "topToBottom"
        let translationSpeed = 0.14999999999999999
        let setupInstructions = "Record a kitchen shot from top to bottom"
        let instructionsTips = ["Replicate this position in the kitchen" ,
                                "Try to reproduce this shot with the best possible angle"]
        let videoTips = ["pos4_re_kitchen", "fram4_re_kitchen"]
        let maxDuration = 4400
        let icon = ""
        let timeScalingDuration = 0
        let timeScalingOffset = 0
        let timeScale = 1.0
        let preferredCameraRaw = "back"
        let allowsImage = true
        let imageTransformation = ""

        return Shot(id: id, name: name, duration: duration, maxDuration: maxDuration, stencil: stencil,
                    motion: motion, translationSpeed: translationSpeed, setupInstructions: setupInstructions,
                    instructionsTips: instructionsTips, videoTips: videoTips, icon: icon,
                    timeScalingDuration: timeScalingDuration, timeScalingOffset: timeScalingOffset,
                    timeScale: timeScale, preferredCameraRaw: preferredCameraRaw, allowsImage: allowsImage,
                    imageTransformation: imageTransformation)
    }
}

extension StencilFeature {
    static func from() -> StencilFeature? {
         let id = "id"
        let parameters = ["": ""]

        return StencilFeature(id: id, parameters: parameters)
    }
}

extension Template {
    static func from(overlay: defaultSceneTemplate, templateOverlay: [TemplateOverlay], templateScene: [Scene], templateText: [TemplateText], templateSoundtrack: [TemplateSoundtrack]) -> Template? {  // swiftlint:disable:this function_body_length

                let id = overlay.id ?? "tpl_demo0_en_bt:10"
                let name = overlay.name ??  "tpl_demo0_en_bt"
                let title = overlay.title ??   "Bottom Line"
                let cost = overlay.cost ??  0
                let company = overlay.company ??  "itunes"
                let date = Date()
                let language = overlay.language ??  "en"
                let tags = overlay.tags ??  ["default - itunes"]
                let version = overlay.version ??  10
                let subjectType = overlay.subjectType ??  "realEstate"
                let shortDescription = overlay.shortDescription ??  "3-shot template with bottom banner"
                let longDescription = overlay.longDescription ??  "Try Momenzo with this simple this could be your own content!"
                let shots = overlay.shots ??  ["shot_demo0_en_intro", "shot_demo0_en_living_s", "shot_demo0_en_kitchen_s"]
                let scenes = [Scene.from1()!, Scene.from2()!, Scene.from3()!, Scene.from4()!, Scene.from5()!].self
                let text = templateText
                let overlays = templateOverlay
                let transitions = [Transition.from()!, Transition.from1()!, Transition.from2()!, Transition.from3()!, Transition.from4()!, Transition.from5()!,].self
                let questions = [TemplateQuestion.from1()!, TemplateQuestion.from2()!, TemplateQuestion.from2()!].self
                let audioSegments: [TemplateAudioSegment] = [].self
                let referenceHeight = overlay.referenceHeight ?? 0
                let availableExtraShots:[String] = overlay.availableExtraShots ?? [""]
                let extraScenesTransition = (Transition.from()!).self
        let extraScenesInsertionIndex = overlay.extraScenesInsertionIndex!
        let soundtracks = templateSoundtrack
        let shotProperties = ["shot1_demo0_living_s": (TemplateShotProperties.from1()!), "shot1_demo0_kitchen_s": (TemplateShotProperties.from2()!)]

        let extraScenesStartTransition = Transition(id: "TransitionNone", parameters: [:])
        let genericShots: [String] = []
        let shareTitle = overlay.shareTitle ?? "{projectName}@"
        let shareDescription = overlay.shareDescription ?? "{price}@ \n{surface}@"
        let allowRecording = true

        return Template(id: id, name: name, title: title, cost: cost, company: company, date: date,
                        language: language, tags: tags, version: version, subjectType: subjectType,
                        shortDescription: shortDescription, longDescription: longDescription,
                        allowRecording: allowRecording, referenceHeight: referenceHeight, shots: shots, scenes: scenes,
                        transitions: transitions, soundtracks: soundtracks, audioSegments: audioSegments, text: text,
                        overlays: overlays, questions: questions, availableExtraShots: availableExtraShots,
                        shotProperties: shotProperties, extraScenesTransition: extraScenesTransition,
                        extraScenesInsertionIndex: extraScenesInsertionIndex,
                        extraScenesStartTransition: extraScenesStartTransition, genericShots: genericShots,
                        shareTitle: shareTitle, shareDescription: shareDescription)
    }
}


extension Scene {
    static func from1() -> Scene? {
        let id = "SceneDefault"
        let shots:[String] = ["shot_demo0_en_intro"]
        let shotStartTimes = [300]
        let duration = 3000
        let muted = true
        let disableShotOverlays = false
        let disableShotAudioSegments = false
        let variableDurationAllowed = false
        let soundtrackVolume = 0.29999999999999999
        let parameters: [String: String] = [:]

        return Scene(id: id, shots: shots, shotStartTimes: shotStartTimes, duration: duration, muted: muted,
                     disableShotOverlays: disableShotOverlays, disableShotAudioSegments: disableShotAudioSegments,
                     variableDurationAllowed: variableDurationAllowed, soundtrackVolume: soundtrackVolume,
                     parameters: parameters)
    }
    static func from2() -> Scene? {
        let id = "SceneDefault"
        let shots:[String] = ["shot_demo0_en_living_s"]
        let shotStartTimes = [500]
        let duration = 4500
        let muted = true
        let disableShotOverlays = false
        let disableShotAudioSegments = false
        let variableDurationAllowed = false
        let soundtrackVolume = 0.29999999999999999
        let parameters: [String: String] = [:]

        return Scene(id: id, shots: shots, shotStartTimes: shotStartTimes, duration: duration, muted: muted,
                     disableShotOverlays: disableShotOverlays, disableShotAudioSegments: disableShotAudioSegments,
                     variableDurationAllowed: variableDurationAllowed, soundtrackVolume: soundtrackVolume,
                     parameters: parameters)
    }
    static func from3() -> Scene? {
        let id = "SceneDefault"
        let shots:[String] = ["shot_demo0_en_kitchen_s"]
        let shotStartTimes = [500]
        let duration = 3500
        let muted = true
        let disableShotOverlays = false
        let disableShotAudioSegments = false
        let variableDurationAllowed = false
        let soundtrackVolume = 0.29999999999999999
        let parameters: [String: String] = [:]

        return Scene(id: id, shots: shots, shotStartTimes: shotStartTimes, duration: duration, muted: muted,
                     disableShotOverlays: disableShotOverlays, disableShotAudioSegments: disableShotAudioSegments,
                     variableDurationAllowed: variableDurationAllowed, soundtrackVolume: soundtrackVolume,
                     parameters: parameters)
    }
    static func from4() -> Scene? {
        let id = "SceneDefault"
        let shots:[String] = ["demo0_outro0"]
        let shotStartTimes = [100]
        let duration = 6900
        let muted = true
        let disableShotOverlays = false
        let disableShotAudioSegments = false
        let variableDurationAllowed = false
        let soundtrackVolume = 0.29999999999999999
        let parameters: [String: String] = [:]

        return Scene(id: id, shots: shots, shotStartTimes: shotStartTimes, duration: duration, muted: muted,
                     disableShotOverlays: disableShotOverlays, disableShotAudioSegments: disableShotAudioSegments,
                     variableDurationAllowed: variableDurationAllowed, soundtrackVolume: soundtrackVolume,
                     parameters: parameters)
    }
    static func from5() -> Scene? {
        let id = "SceneDefault"
        let shots:[String] = ["demo0_outro"]
        let shotStartTimes = [200]
        let duration = 6900
        let muted = true
        let disableShotOverlays = false
        let disableShotAudioSegments = false
        let variableDurationAllowed = false
        let soundtrackVolume = 0.29999999999999999
        let parameters: [String: String] = [:]

        return Scene(id: id, shots: shots, shotStartTimes: shotStartTimes, duration: duration, muted: muted,
                     disableShotOverlays: disableShotOverlays, disableShotAudioSegments: disableShotAudioSegments,
                     variableDurationAllowed: variableDurationAllowed, soundtrackVolume: soundtrackVolume,
                     parameters: parameters)
    }
    static func fromInvalid1() -> Scene? {
        let id = "invalid"
        let shots:[String] = []
        let shotStartTimes: [Int] = []
        let duration = 0
        let muted = true
        let disableShotOverlays = false
        let disableShotAudioSegments = false
        let variableDurationAllowed = false
        let soundtrackVolume = 1.0
        let parameters: [String: String] = [:]

        return Scene(id: id, shots: shots, shotStartTimes: shotStartTimes, duration: duration, muted: muted,
                     disableShotOverlays: disableShotOverlays, disableShotAudioSegments: disableShotAudioSegments,
                     variableDurationAllowed: variableDurationAllowed, soundtrackVolume: soundtrackVolume,
                     parameters: parameters)
    }
    
    static func fromInvalid2() -> Scene? {
        let id = "invalid"
        let shots:[String] = []
        let shotStartTimes: [Int] = []
        let duration = 0
        let muted = true
        let disableShotOverlays = false
        let disableShotAudioSegments = false
        let variableDurationAllowed = false
        let soundtrackVolume = 1.0
        let parameters: [String: String] = [:]

        return Scene(id: id, shots: shots, shotStartTimes: shotStartTimes, duration: duration, muted: muted,
                     disableShotOverlays: disableShotOverlays, disableShotAudioSegments: disableShotAudioSegments,
                     variableDurationAllowed: variableDurationAllowed, soundtrackVolume: soundtrackVolume,
                     parameters: parameters)
    }
    
}

extension Transition {
    static func from() -> Transition? {
            let id = "TransitionNone"
        let parameters: [String: String] = [ : ]

        return Transition(id: id, parameters: parameters)
    }
    
    static func from1() -> Transition? {
            let id = "TransitionZoom"
        let parameters: [String: String] = ["scaleFactor": "4.0", "halfSpan": "100"]

        return Transition(id: id, parameters: parameters)
    }
    
    static func from2() -> Transition? {
            let id = "TransitionCrossfade"
        let parameters: [String: String] = ["halfSpan" : "100"]

        return Transition(id: id, parameters: parameters)
    }
    
    static func from3() -> Transition? {
            let id = "TransitionCrossfade"
        let parameters: [String: String] = ["halfSpan" : "100"]

        return Transition(id: id, parameters: parameters)
    }
    
    static func from4() -> Transition? {
            let id = "TransitionZoom"
        let parameters: [String: String] = ["scaleFactor" : "3.0",  "halfSpan": "150"]

        return Transition(id: id, parameters: parameters)
    }
    
    static func from5() -> Transition? {
            let id = "TransitionEndFadeOut"
        let parameters: [String: String] = ["halfSpan" : "100"]

        return Transition(id: id, parameters: parameters)
    }
    
}

extension TemplateAudioSegment {
    static func from() -> TemplateAudioSegment? {
        let asset = "asset"
        let volume = 0.5
        let assetStartTime = 1
        let startTime = 1
        let fadeDuration = 1
        let duration = 1
        let timeGravity =  ""
        let questionConditions = [""]
        let soundtrackVolume = 1.0

        return TemplateAudioSegment(asset: asset, volume: volume, assetStartTime: assetStartTime, startTime: startTime,
                                    duration: duration, fadeDuration: fadeDuration, timeGravity: timeGravity,
                                    questionConditions: questionConditions, soundtrackVolume: soundtrackVolume)
    }
}

extension TemplateText {
    static func fromShot1() -> TemplateText? {
        let text = "text"
        let startTime = 1000
        let color = "white"
        let size = 40.0
        let fadeDuration = 200
        let duration = 2500
        let horizontalAlignment = "start"
        let verticalAlignment = "end"
        let maxWidth = 570.0
        let maxHeight = 170.0
        let id = "text"
        let font = "Arial-BoldItalicMT"
        let horizontalMargin = 5.0
        let verticalMargin = 610.0
        let textAlignment = "center"
        let verticalTextAlignment = "center"
        let lineSpacing = -10.0
        let timeGravity = ""
        let zIndex = 2

        return TemplateText(id: id, text: text, size: size, font: font, color: color, startTime: startTime,
                            duration: duration, fadeDuration: fadeDuration, horizontalAlignment: horizontalAlignment,
                            verticalAlignment: verticalAlignment, horizontalMargin: horizontalMargin,
                            verticalMargin: verticalMargin, maxWidth: maxWidth, maxHeight: maxHeight,
                            textAlignment: textAlignment, verticalTextAlignment: verticalTextAlignment,
                            lineSpacing: lineSpacing, timeGravity: timeGravity, zIndex: zIndex)
    }
    
    static func fromShot2() -> TemplateText? {
        let text = "text"
        let startTime = 1000
        let color = "white"
        let size = 40.0
        let fadeDuration = 200
        let duration = 3500
        let horizontalAlignment = "start"
        let verticalAlignment = "end"
        let maxWidth = 570.0
        let maxHeight = 170.0
        let id = "text"
        let font = "Arial-BoldItalicMT"
        let horizontalMargin = 5.0
        let verticalMargin = 610.0
        let textAlignment = "center"
        let verticalTextAlignment = "center"
        let lineSpacing = -10.0
        let timeGravity = ""
        let zIndex = 2

        return TemplateText(id: id, text: text, size: size, font: font, color: color, startTime: startTime,
                            duration: duration, fadeDuration: fadeDuration, horizontalAlignment: horizontalAlignment,
                            verticalAlignment: verticalAlignment, horizontalMargin: horizontalMargin,
                            verticalMargin: verticalMargin, maxWidth: maxWidth, maxHeight: maxHeight,
                            textAlignment: textAlignment, verticalTextAlignment: verticalTextAlignment,
                            lineSpacing: lineSpacing, timeGravity: timeGravity, zIndex: zIndex)
    }
    
    static func from0() -> TemplateText? {
        let id = ""
        let text = "{projectName}@"
        let startTime = 3500
        let color = "white"
        let size = 50.0
        let fadeDuration = 100
        let duration = 14400
        let horizontalAlignment = "end"
        let verticalAlignment = "start"
        let maxWidth = 750.0
        let maxHeight = 70.0
        let font = "Arial-BoldMT"
        let horizontalMargin = 5.0
        let verticalMargin = 610.0
        let textAlignment = "right"
        let verticalTextAlignment = "center"
        let lineSpacing = 0.0
        let timeGravity = ""
        let zIndex = 0

        return TemplateText(id: id, text: text, size: size, font: font, color: color, startTime: startTime,
                            duration: duration, fadeDuration: fadeDuration, horizontalAlignment: horizontalAlignment,
                            verticalAlignment: verticalAlignment, horizontalMargin: horizontalMargin,
                            verticalMargin: verticalMargin, maxWidth: maxWidth, maxHeight: maxHeight,
                            textAlignment: textAlignment, verticalTextAlignment: verticalTextAlignment,
                            lineSpacing: lineSpacing, timeGravity: timeGravity, zIndex: zIndex)
    }
//    static func from1() -> TemplateText? {
//        let text = "{surface}@"
//        let startTime = 3500
//        let color = "white"
//        let size = 30.0
//        let fadeDuration = 300
//        let duration = 14400
//        let horizontalAlignment = "end"
//        let verticalAlignment = "start"
//        let maxWidth = 750.0
//        let maxHeight = 50.0
//        let id = "surface"
//        let font = "Arial-BoldMT"
//        let horizontalMargin = 30.0
//        let verticalMargin = 50.0
//        let textAlignment = "center"
//        let verticalTextAlignment = ""
//        let lineSpacing = 0.0
//        let timeGravity = ""
//        let zIndex = 0
//
//        return TemplateText(id: id, text: text, size: size, font: font, color: color, startTime: startTime,
//                            duration: duration, fadeDuration: fadeDuration, horizontalAlignment: horizontalAlignment,
//                            verticalAlignment: verticalAlignment, horizontalMargin: horizontalMargin,
//                            verticalMargin: verticalMargin, maxWidth: maxWidth, maxHeight: maxHeight,
//                            textAlignment: textAlignment, verticalTextAlignment: verticalTextAlignment,
//                            lineSpacing: lineSpacing, timeGravity: timeGravity, zIndex: zIndex)
//    }
    static func from2() -> TemplateText? {
        let text = "954.555.3848"
        let startTime = 4500
        let color = "white"
        let size = 40.0
        let fadeDuration = 300
        let duration = 13400
        let horizontalAlignment = "start"
        let verticalAlignment = "start"
        let maxWidth = 350.0
        let maxHeight = 50.0
        let id = "phone"
        let font = "Arial-BoldMT"
        let horizontalMargin = 30.0
        let verticalMargin = 60.0
        let textAlignment = "start"
        let verticalTextAlignment = ""
        let lineSpacing = 0.0
        let timeGravity = ""
        let zIndex = 2

        return TemplateText(id: id, text: text, size: size, font: font, color: color, startTime: startTime,
                            duration: duration, fadeDuration: fadeDuration, horizontalAlignment: horizontalAlignment,
                            verticalAlignment: verticalAlignment, horizontalMargin: horizontalMargin,
                            verticalMargin: verticalMargin, maxWidth: maxWidth, maxHeight: maxHeight,
                            textAlignment: textAlignment, verticalTextAlignment: verticalTextAlignment,
                            lineSpacing: lineSpacing, timeGravity: timeGravity, zIndex: zIndex)
    }
    static func from3() -> TemplateText? {
        let text = "jessica@momenzo.com"
        let startTime = 4500
        let color = "white"
        let size = 30.0
        let fadeDuration = 300
        let duration = 13400
        let horizontalAlignment = "start"
        let verticalAlignment = "start"
        let maxWidth = 400.0
        let maxHeight = 50.0
        let id = "mail"
        let font = "Arial-BoldMT"
        let horizontalMargin = 30.0
        let verticalMargin = 100.0
        let textAlignment = "start"
        let verticalTextAlignment = ""
        let lineSpacing = 0.0
        let timeGravity = ""
        let zIndex = 2

        return TemplateText(id: id, text: text, size: size, font: font, color: color, startTime: startTime,
                            duration: duration, fadeDuration: fadeDuration, horizontalAlignment: horizontalAlignment,
                            verticalAlignment: verticalAlignment, horizontalMargin: horizontalMargin,
                            verticalMargin: verticalMargin, maxWidth: maxWidth, maxHeight: maxHeight,
                            textAlignment: textAlignment, verticalTextAlignment: verticalTextAlignment,
                            lineSpacing: lineSpacing, timeGravity: timeGravity, zIndex: zIndex)
    }
    static func from4() -> TemplateText? {
        let text = "www.momenzo.com"
        let startTime = 4000
        let color = "white"
        let size = 40.0
        let fadeDuration = 300
        let duration = 13900
        let horizontalAlignment = "start"
        let verticalAlignment = "end"
        let maxWidth = 415.0
        let maxHeight = 58.0
        let id = "www"
        let font = "Arial-BoldMT"
        let horizontalMargin = 5.0
        let verticalMargin = 167.0
        let textAlignment = "right"
        let verticalTextAlignment = ""
        let lineSpacing = 0.0
        let timeGravity = ""
        let zIndex = 2

        return TemplateText(id: id, text: text, size: size, font: font, color: color, startTime: startTime,
                            duration: duration, fadeDuration: fadeDuration, horizontalAlignment: horizontalAlignment,
                            verticalAlignment: verticalAlignment, horizontalMargin: horizontalMargin,
                            verticalMargin: verticalMargin, maxWidth: maxWidth, maxHeight: maxHeight,
                            textAlignment: textAlignment, verticalTextAlignment: verticalTextAlignment,
                            lineSpacing: lineSpacing, timeGravity: timeGravity, zIndex: zIndex)
    }
    static func from5() -> TemplateText? {
        let text = "FOR SALE"
        let startTime = 1000
        let color = "white"
        let size = 30.0
        let fadeDuration = 300
        let duration = 2500
        let horizontalAlignment = "end"
        let verticalAlignment = "start"
        let maxWidth = 290.0
        let maxHeight = 50.0
        let id = ""
        let font = "Arial-BoldItalicMT"
        let horizontalMargin = 90.0
        let verticalMargin = 184.0
        let textAlignment = "center"
        let verticalTextAlignment = ""
        let lineSpacing = 0.0
        let timeGravity = ""
        let zIndex = 2

        return TemplateText(id: id, text: text, size: size, font: font, color: color, startTime: startTime,
                            duration: duration, fadeDuration: fadeDuration, horizontalAlignment: horizontalAlignment,
                            verticalAlignment: verticalAlignment, horizontalMargin: horizontalMargin,
                            verticalMargin: verticalMargin, maxWidth: maxWidth, maxHeight: maxHeight,
                            textAlignment: textAlignment, verticalTextAlignment: verticalTextAlignment,
                            lineSpacing: lineSpacing, timeGravity: timeGravity, zIndex: zIndex)
    }
    static func from6() -> TemplateText? {
        let text = "{price}@"
        let startTime = 4300
        let color = "black"
        let size = 40.0
        let fadeDuration = 300
        let duration = 13600
        let horizontalAlignment = "end"
        let verticalAlignment = "start"
        let maxWidth = 290.0
        let maxHeight = 50.0
        let id = "price"
        let font = "Arial-BoldMT"
        let horizontalMargin = 90.0
        let verticalMargin = 240.0
        let textAlignment = "center"
        let verticalTextAlignment = ""
        let lineSpacing = 0.0
        let timeGravity = ""
        let zIndex = 2

        return TemplateText(id: id, text: text, size: size, font: font, color: color, startTime: startTime,
                            duration: duration, fadeDuration: fadeDuration, horizontalAlignment: horizontalAlignment,
                            verticalAlignment: verticalAlignment, horizontalMargin: horizontalMargin,
                            verticalMargin: verticalMargin, maxWidth: maxWidth, maxHeight: maxHeight,
                            textAlignment: textAlignment, verticalTextAlignment: verticalTextAlignment,
                            lineSpacing: lineSpacing, timeGravity: timeGravity, zIndex: zIndex)
    }
    
    static func from7() -> TemplateText? {
        let text = "Click to Change"
        let startTime = 10000
        let color = "black"
        let size = 40.0
        let fadeDuration = 0
        let duration = 2350
        let horizontalAlignment = "center"
        let verticalAlignment = "end"
        let maxWidth = 400.0
        let maxHeight = 200.0
        let id = ""
        let font = "Arial-BoldMT"
        let horizontalMargin = 0.0
        let verticalMargin = 731.0
        let textAlignment = "center"
        let verticalTextAlignment = ""
        let lineSpacing = 0.0
        let timeGravity = ""
        let zIndex = 6

        return TemplateText(id: id, text: text, size: size, font: font, color: color, startTime: startTime,
                            duration: duration, fadeDuration: fadeDuration, horizontalAlignment: horizontalAlignment,
                            verticalAlignment: verticalAlignment, horizontalMargin: horizontalMargin,
                            verticalMargin: verticalMargin, maxWidth: maxWidth, maxHeight: maxHeight,
                            textAlignment: textAlignment, verticalTextAlignment: verticalTextAlignment,
                            lineSpacing: lineSpacing, timeGravity: timeGravity, zIndex: zIndex)
    }
    
    static func from8() -> TemplateText? {
        let text = "LIVING ROOM"
        let startTime = 4700
        let color = "white"
        let size = 20.0
        let fadeDuration = 300
        let duration = 13200
        let horizontalAlignment = "start"
        let verticalAlignment = "end"
        let maxWidth = 160.0
        let maxHeight = 30.0
        let id = ""
        let font = "Arial-BoldMT"
        let horizontalMargin = 540.0
        let verticalMargin = 1020.0
        let textAlignment = "center"
        let verticalTextAlignment = ""
        let lineSpacing = 0.0
        let timeGravity = ""
        let zIndex = 2

        return TemplateText(id: id, text: text, size: size, font: font, color: color, startTime: startTime,
                            duration: duration, fadeDuration: fadeDuration, horizontalAlignment: horizontalAlignment,
                            verticalAlignment: verticalAlignment, horizontalMargin: horizontalMargin,
                            verticalMargin: verticalMargin, maxWidth: maxWidth, maxHeight: maxHeight,
                            textAlignment: textAlignment, verticalTextAlignment: verticalTextAlignment,
                            lineSpacing: lineSpacing, timeGravity: timeGravity, zIndex: zIndex)
    }
    
    static func from9() -> TemplateText? {
        let text = "KITCHEN"
        let startTime = 8500
        let color = "white"
        let size = 20.0
        let fadeDuration = 300
        let duration = 9400
        let horizontalAlignment = "start"
        let verticalAlignment = "end"
        let maxWidth = 160.0
        let maxHeight = 50.0
        let id = ""
        let font = "Arial-BoldMT"
        let horizontalMargin = 690.0
        let verticalMargin = 1020.0
        let textAlignment = "center"
        let verticalTextAlignment = ""
        let lineSpacing = 0.0
        let timeGravity = ""
        let zIndex = 2

        return TemplateText(id: id, text: text, size: size, font: font, color: color, startTime: startTime,
                            duration: duration, fadeDuration: fadeDuration, horizontalAlignment: horizontalAlignment,
                            verticalAlignment: verticalAlignment, horizontalMargin: horizontalMargin,
                            verticalMargin: verticalMargin, maxWidth: maxWidth, maxHeight: maxHeight,
                            textAlignment: textAlignment, verticalTextAlignment: verticalTextAlignment,
                            lineSpacing: lineSpacing, timeGravity: timeGravity, zIndex: zIndex)
    }
    static func from10() -> TemplateText? {
        let text = "BEDROOM"
        let startTime = 11000
        let color = "white"
        let size = 20.0
        let fadeDuration = 300
        let duration = 6900
        let horizontalAlignment = "start"
        let verticalAlignment = "end"
        let maxWidth = 160.0
        let maxHeight = 30.0
        let id = ""
        let font = "Arial-BoldMT"
        let horizontalMargin = 840.0
        let verticalMargin = 1020.0
        let textAlignment = "center"
        let verticalTextAlignment = ""
        let lineSpacing = 0.0
        let timeGravity = ""
        let zIndex = 2

        return TemplateText(id: id, text: text, size: size, font: font, color: color, startTime: startTime,
                            duration: duration, fadeDuration: fadeDuration, horizontalAlignment: horizontalAlignment,
                            verticalAlignment: verticalAlignment, horizontalMargin: horizontalMargin,
                            verticalMargin: verticalMargin, maxWidth: maxWidth, maxHeight: maxHeight,
                            textAlignment: textAlignment, verticalTextAlignment: verticalTextAlignment,
                            lineSpacing: lineSpacing, timeGravity: timeGravity, zIndex: zIndex)
    }
    static func from11() -> TemplateText? {
        let text = "BATHROOM"
        let startTime = 14700
        let color = "white"
        let size = 20.0
        let fadeDuration = 300
        let duration = 3200
        let horizontalAlignment = "start"
        let verticalAlignment = "end"
        let maxWidth = 160.0
        let maxHeight = 30.0
        let id = ""
        let font = "Arial-BoldMT"
        let horizontalMargin = 99.0
        let verticalMargin = 1020.0
        let textAlignment = "center"
        let verticalTextAlignment = ""
        let lineSpacing = 0.0
        let timeGravity = ""
        let zIndex = 2

        return TemplateText(id: id, text: text, size: size, font: font, color: color, startTime: startTime,
                            duration: duration, fadeDuration: fadeDuration, horizontalAlignment: horizontalAlignment,
                            verticalAlignment: verticalAlignment, horizontalMargin: horizontalMargin,
                            verticalMargin: verticalMargin, maxWidth: maxWidth, maxHeight: maxHeight,
                            textAlignment: textAlignment, verticalTextAlignment: verticalTextAlignment,
                            lineSpacing: lineSpacing, timeGravity: timeGravity, zIndex: zIndex)
    }
}

extension TemplateOverlay {
    static func from() -> TemplateOverlay? {
            let asset = "demo0_bed"
            let opacity = 1.0
            let startTime = 1000
            let fadeDuration = 0
            let duration = 3500
            let horizontalAlignment = "end"
            let verticalAlignment = "end"
            let horizontalMargin = 100.0
        let verticalMargin = 600.0
        let fps = 30.0
        let keyFrame = -1
        let requiredTexts = ["text"]
        let requiresAllTexts = true
        let timeGravity = ""
        let zIndex = 0
        let questionConditions = [""]

        return TemplateOverlay(asset: asset, opacity: opacity, startTime: startTime, duration: duration,
                               fadeDuration: fadeDuration, horizontalAlignment: horizontalAlignment,
                               verticalAlignment: verticalAlignment, horizontalMargin: horizontalMargin,
                               verticalMargin: verticalMargin, fps: fps, keyFrame: keyFrame,
                               requiredTexts: requiredTexts, requiresAllTexts: requiresAllTexts,
                               timeGravity: timeGravity, zIndex: zIndex, questionConditions: questionConditions)
    }
//    static func from0() -> TemplateOverlay? {
//            let asset = "demo0_intro"
//            let opacity = 1.0
//            let startTime = 0
//            let fadeDuration = 300
//            let duration = 3000
//            let horizontalAlignment = "center"
//            let verticalAlignment = "center"
//            let horizontalMargin = 100.0
//           let verticalMargin = 0.0
//        let fps = 30.0
//        let keyFrame = -3
//        let requiredTexts: [String] = []
//        let requiresAllTexts = true
//        let timeGravity = ""
//        let zIndex = 0
//        let questionConditions:[String] = []
//
//        return TemplateOverlay(asset: asset, opacity: opacity, startTime: startTime, duration: duration,
//                               fadeDuration: fadeDuration, horizontalAlignment: horizontalAlignment,
//                               verticalAlignment: verticalAlignment, horizontalMargin: horizontalMargin,
//                               verticalMargin: verticalMargin, fps: fps, keyFrame: keyFrame,
//                               requiredTexts: requiredTexts, requiresAllTexts: requiresAllTexts,
//                               timeGravity: timeGravity, zIndex: zIndex, questionConditions: questionConditions)
//    }
    static func from1() -> TemplateOverlay? {
            let asset = "demo0_logo"
            let opacity = 1.0
            let startTime = 3000
            let fadeDuration = 300
            let duration = 14900
            let horizontalAlignment = "start"
            let verticalAlignment = "end"
            let horizontalMargin = 1000.0
           let verticalMargin = 0.0
        let fps = 30.0
        let keyFrame = -1
        let requiredTexts: [String] = []
        let requiresAllTexts = true
        let timeGravity = ""
        let zIndex = 0
        let questionConditions:[String] = []

        return TemplateOverlay(asset: asset, opacity: opacity, startTime: startTime, duration: duration,
                               fadeDuration: fadeDuration, horizontalAlignment: horizontalAlignment,
                               verticalAlignment: verticalAlignment, horizontalMargin: horizontalMargin,
                               verticalMargin: verticalMargin, fps: fps, keyFrame: keyFrame,
                               requiredTexts: requiredTexts, requiresAllTexts: requiresAllTexts,
                               timeGravity: timeGravity, zIndex: zIndex, questionConditions: questionConditions)
    }
    static func from2() -> TemplateOverlay? {
            let asset = "demo0_banner_main"
            let opacity = 1.0
            let startTime = 3000
            let fadeDuration = 0
            let duration = 14900
            let horizontalAlignment = "start"
            let verticalAlignment = "start"
            let horizontalMargin = 0.0
           let verticalMargin = 0.0
        let fps = 30.0
        let keyFrame = -3
        let requiredTexts: [String] = []
        let requiresAllTexts = true
        let timeGravity = ""
        let zIndex = 0
        let questionConditions:[String] = []

        return TemplateOverlay(asset: asset, opacity: opacity, startTime: startTime, duration: duration,
                               fadeDuration: fadeDuration, horizontalAlignment: horizontalAlignment,
                               verticalAlignment: verticalAlignment, horizontalMargin: horizontalMargin,
                               verticalMargin: verticalMargin, fps: fps, keyFrame: keyFrame,
                               requiredTexts: requiredTexts, requiresAllTexts: requiresAllTexts,
                               timeGravity: timeGravity, zIndex: zIndex, questionConditions: questionConditions)
    }
    static func from3() -> TemplateOverlay? {
            let asset = "demo0_banner_website"
            let opacity = 1.0
            let startTime = 3400
            let fadeDuration = 0
            let duration = 14500
            let horizontalAlignment = "start"
            let verticalAlignment = "start"
            let horizontalMargin = 0.0
           let verticalMargin = 0.0
        let fps = 30.0
        let keyFrame = -3
        let requiredTexts: [String] = []
        let requiresAllTexts = true
        let timeGravity = ""
        let zIndex = 2
        let questionConditions:[String] = []

        return TemplateOverlay(asset: asset, opacity: opacity, startTime: startTime, duration: duration,
                               fadeDuration: fadeDuration, horizontalAlignment: horizontalAlignment,
                               verticalAlignment: verticalAlignment, horizontalMargin: horizontalMargin,
                               verticalMargin: verticalMargin, fps: fps, keyFrame: keyFrame,
                               requiredTexts: requiredTexts, requiresAllTexts: requiresAllTexts,
                               timeGravity: timeGravity, zIndex: zIndex, questionConditions: questionConditions)
    }
    static func from4() -> TemplateOverlay? {
            let asset = "demo0_banner_price1"
            let opacity = 1.0
            let startTime = 3300
            let fadeDuration = 0
            let duration = 14600
            let horizontalAlignment = "end"
            let verticalAlignment = "start"
            let horizontalMargin = 0.0
           let verticalMargin = 0.0
        let fps = 30.0
        let keyFrame = -3
        let requiredTexts: [String] = []
        let requiresAllTexts = true
        let timeGravity = ""
        let zIndex = 0
        let questionConditions:[String] = []

        return TemplateOverlay(asset: asset, opacity: opacity, startTime: startTime, duration: duration,
                               fadeDuration: fadeDuration, horizontalAlignment: horizontalAlignment,
                               verticalAlignment: verticalAlignment, horizontalMargin: horizontalMargin,
                               verticalMargin: verticalMargin, fps: fps, keyFrame: keyFrame,
                               requiredTexts: requiredTexts, requiresAllTexts: requiresAllTexts,
                               timeGravity: timeGravity, zIndex: zIndex, questionConditions: questionConditions)
    }
    static func from5() -> TemplateOverlay? {
            let asset = "demo0_banner_price2"
            let opacity = 1.0
            let startTime = 3300
            let fadeDuration = 0
            let duration = 14600
            let horizontalAlignment = "end"
            let verticalAlignment = "start"
            let horizontalMargin = 0.0
           let verticalMargin = 0.0
        let fps = 30.0
        let keyFrame = -3
        let requiredTexts: [String] = ["price"]
        let requiresAllTexts = true
        let timeGravity = ""
        let zIndex = 0
        let questionConditions:[String] = []

        return TemplateOverlay(asset: asset, opacity: opacity, startTime: startTime, duration: duration,
                               fadeDuration: fadeDuration, horizontalAlignment: horizontalAlignment,
                               verticalAlignment: verticalAlignment, horizontalMargin: horizontalMargin,
                               verticalMargin: verticalMargin, fps: fps, keyFrame: keyFrame,
                               requiredTexts: requiredTexts, requiresAllTexts: requiresAllTexts,
                               timeGravity: timeGravity, zIndex: zIndex, questionConditions: questionConditions)
    }
    static func from6() -> TemplateOverlay? {
            let asset = "demo0_banner_price2"
            let opacity = 1.0
            let startTime = 4000
            let fadeDuration = 0
            let duration = 2000
            let horizontalAlignment = "start"
            let verticalAlignment = "start"
            let horizontalMargin = 0.0
           let verticalMargin = 0.0
        let fps = 30.0
        let keyFrame = -3
        let requiredTexts: [String] = []
        let requiresAllTexts = true
        let timeGravity = ""
        let zIndex = 2
        let questionConditions:[String] = []

        return TemplateOverlay(asset: asset, opacity: opacity, startTime: startTime, duration: duration,
                               fadeDuration: fadeDuration, horizontalAlignment: horizontalAlignment,
                               verticalAlignment: verticalAlignment, horizontalMargin: horizontalMargin,
                               verticalMargin: verticalMargin, fps: fps, keyFrame: keyFrame,
                               requiredTexts: requiredTexts, requiresAllTexts: requiresAllTexts,
                               timeGravity: timeGravity, zIndex: zIndex, questionConditions: questionConditions)
    }
    static func from7() -> TemplateOverlay? {
            let asset = "demo0_email_lp"
            let opacity = 1.0
            let startTime = 6000
            let fadeDuration = 0
            let duration = 11900
            let horizontalAlignment = "start"
            let verticalAlignment = "start"
            let horizontalMargin = 150.0
           let verticalMargin = 0.0
        let fps = 15.0
        let keyFrame = -1
        let requiredTexts: [String] = []
        let requiresAllTexts = true
        let timeGravity = ""
        let zIndex = 2
        let questionConditions:[String] = []

        return TemplateOverlay(asset: asset, opacity: opacity, startTime: startTime, duration: duration,
                               fadeDuration: fadeDuration, horizontalAlignment: horizontalAlignment,
                               verticalAlignment: verticalAlignment, horizontalMargin: horizontalMargin,
                               verticalMargin: verticalMargin, fps: fps, keyFrame: keyFrame,
                               requiredTexts: requiredTexts, requiresAllTexts: requiresAllTexts,
                               timeGravity: timeGravity, zIndex: zIndex, questionConditions: questionConditions)
    }
    static func from8(asset: String, opacity: Double,
                      startTime: Int,
                      fadeDuration: Int, duration: Int, horizontalAlignment: String,
                      verticalAlignment: String, horizontalMargin: Double,
                      verticalMargin: Double, fps: Double, keyFrame: Int, requiredTexts: [String],
                      requiresAllTexts: Bool, timeGravity: String, zIndex: Int,
                      questionConditions: [String]
                      ) -> TemplateOverlay? {
            let asset = asset
            let opacity = opacity
            let startTime = startTime
            let fadeDuration = fadeDuration
            let duration = duration
            let horizontalAlignment = horizontalAlignment
            let verticalAlignment = verticalAlignment
            let horizontalMargin = horizontalMargin
           let verticalMargin = verticalMargin
        let fps = 15.0
        let keyFrame = -1
        let requiredTexts: [String] = []
        let requiresAllTexts = true
        let timeGravity = ""
        let zIndex = 2
        let questionConditions:[String] = []

        return TemplateOverlay(asset: asset, opacity: opacity, startTime: startTime, duration: duration,
                               fadeDuration: fadeDuration, horizontalAlignment: horizontalAlignment,
                               verticalAlignment: verticalAlignment, horizontalMargin: horizontalMargin,
                               verticalMargin: verticalMargin, fps: fps, keyFrame: keyFrame,
                               requiredTexts: requiredTexts, requiresAllTexts: requiresAllTexts,
                               timeGravity: timeGravity, zIndex: zIndex, questionConditions: questionConditions)
    }
    
}

extension TemplateQuestion {
    static func from() -> TemplateQuestion? {
            let id = "text"
            let question = "Write your text here"
            let type = "text"
            let maxNumCharacters = 50

        return TemplateQuestion(id: id, question: question, type: type, maxNumCharacters: maxNumCharacters)
    }
    
    static func from1() -> TemplateQuestion? {
            let id = "projectName"
            let question = "Title of your video:"
            let type = "text"
            let maxNumCharacters = 30

        return TemplateQuestion(id: id, question: question, type: type, maxNumCharacters: maxNumCharacters)
    }
    static func from2() -> TemplateQuestion? {
            let id = "price"
            let question = "Price (add your currency):"
            let type = "text"
            let maxNumCharacters = 15

        return TemplateQuestion(id: id, question: question, type: type, maxNumCharacters: maxNumCharacters)
    }
    static func from3() -> TemplateQuestion? {
            let id = "surface"
            let question = "Surface (specify unit of measure):"
            let type = "text"
            let maxNumCharacters = 10

        return TemplateQuestion(id: id, question: question, type: type, maxNumCharacters: maxNumCharacters)
    }
    
    
}

extension TemplateShotProperties {
    static func from1() -> TemplateShotProperties? {
       let overlays = [TemplateOverlay.from()!].self
        let text = [TemplateText.fromShot1()!]
        let defaultScene = Scene.fromInvalid1()!
        let question = (TemplateQuestion.from()!)
        let audioSegments = [TemplateAudioSegment.from()!]

        return TemplateShotProperties(defaultScene: defaultScene, overlays: overlays, text: text, question: question,
                                      audioSegments: audioSegments)
    }
    static func from2() -> TemplateShotProperties? {
       let overlays = [TemplateOverlay.from()!].self
        let text = [TemplateText.fromShot2()!]
        let defaultScene = Scene.fromInvalid2()!
        let question = (TemplateQuestion.from()!)
        let audioSegments = [TemplateAudioSegment.from()!]

        return TemplateShotProperties(defaultScene: defaultScene, overlays: overlays, text: text, question: question,
                                      audioSegments: audioSegments)
    }
}

extension TemplateSoundtrack {
    static func from1() -> TemplateSoundtrack? {
            let id = "demo0_soundtrack0"
            let title = "Cali Buzz"
            let overlayText = ""
        return TemplateSoundtrack(id: id, title: title, overlayText: overlayText)
    }
    static func from2() -> TemplateSoundtrack? {
            let id = "demo0_soundtrack1"
            let title = "Daley\'s Reel"
            let overlayText = ""
        return TemplateSoundtrack(id: id, title: title, overlayText: overlayText)
    }
    static func from3() -> TemplateSoundtrack? {
            let id = "demo0_soundtrack2"
            let title = "Designer"
            let overlayText = ""
        return TemplateSoundtrack(id: id, title: title, overlayText: overlayText)
    }
    static func from4() -> TemplateSoundtrack? {
            let id = "demo0_soundtrack3"
            let title = "Dirty Mac"
            let overlayText = ""
        return TemplateSoundtrack(id: id, title: title, overlayText: overlayText)
    }
    static func from5() -> TemplateSoundtrack? {
            let id = "demo0_soundtrack4"
            let title = "Funk Down"
            let overlayText = ""
        return TemplateSoundtrack(id: id, title: title, overlayText: overlayText)
    }
    static func from6() -> TemplateSoundtrack? {
            let id = "demo0_soundtrack5"
            let title = "Bovi"
            let overlayText = ""
        return TemplateSoundtrack(id: id, title: title, overlayText: overlayText)
    }
}
