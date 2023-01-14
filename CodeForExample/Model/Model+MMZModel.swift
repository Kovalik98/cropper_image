//
//  Model+MMZModel.swift
//  Momenzo
//
//  Created by Flo Vouin on 03/12/2018.
//  Copyright © 2018 Flo. All rights reserved.
//

import MomenzoVideoEngine

// Boilerplate extensions to convert types to the ones of the `MomenzoVideoEngine`.

extension Montage {
    var mmzMontage: MMZMontage {
        get {
            return MMZMontage(videos: self.videos, answers: self.answers, soundtrack: self.soundtrack,
                              videoAnswers: self.videoAnswers)
        }
    }
}

extension Scene {
    var mmzScene: MMZScene {
        get {
            return MMZScene(id: self.id, shots: self.shots, shotStartTimes: self.shotStartTimes,
                            duration: self.duration, muted: self.muted, disableShotOverlays: self.disableShotOverlays,
                            disableShotAudioSegments: self.disableShotAudioSegments,
                            variableDurationAllowed: self.variableDurationAllowed,
                            soundtrackVolume: self.soundtrackVolume, parameters: self.parameters)
        }
    }
}

extension Shot {
    var mmzShot: MMZShot {
        get {
            return MMZShot(id: self.id, duration: self.duration, maxDuration: self.maxDuration,
                           timeScalingDuration: self.timeScalingDuration, timeScalingOffset: self.timeScalingOffset,
                           timeScale: self.timeScale)
        }
    }
}

extension Template {
    var mmzTemplate: MMZTemplate {
        get {
            var mmzShotProperties = [String: MMZTemplateShotProperties]()
            for (shotID, properties) in self.shotProperties {
                mmzShotProperties[shotID] = properties.mmzTemplateShotProperties
            }

            return MMZTemplate(name: self.name, referenceHeight: self.referenceHeight, shots: self.shots,
                               scenes: self.scenes.map { $0.mmzScene },
                               transitions: self.transitions.map { $0.mmzTransition },
                               soundtracks: self.soundtracks.map { $0.mmzTemplateSoundtrack },
                               audioSegments: self.audioSegments.map { $0.mmzTemplateAudioSegment },
                               text: self.text.map { $0.mmzTemplateText },
                               overlays: self.overlays.map { $0.mmzTemplateOverlay },
                               questions: self.questions.map { $0.mmzTemplateQuestion },
                               availableExtraShots: self.availableExtraShots, shotProperties: mmzShotProperties,
                               extraScenesTransition: self.extraScenesTransition.mmzTransition,
                               extraScenesInsertionIndex: self.extraScenesInsertionIndex,
                               extraScenesStartTransition: self.extraScenesStartTransition.mmzTransition,
                               genericShots: self.genericShots)
        }
    }
}

extension TemplateAudioSegment {
    var mmzTemplateAudioSegment: MMZTemplateAudioSegment {
        get {
            return MMZTemplateAudioSegment(asset: self.asset, volume: self.volume, assetStartTime: self.assetStartTime,
                                           startTime: self.startTime, duration: self.duration,
                                           fadeDuration: self.fadeDuration, timeGravity: self.timeGravity,
                                           questionConditions: self.questionConditions,
                                           soundtrackVolume: self.soundtrackVolume)
        }
    }
}

extension TemplateOverlay {
    var mmzTemplateOverlay: MMZTemplateOverlay {
        get {
            return MMZTemplateOverlay(asset: self.asset, opacity: self.opacity, startTime: self.startTime,
                                      duration: self.duration, fadeDuration: self.fadeDuration,
                                      horizontalAlignment: self.horizontalAlignment,
                                      verticalAlignment: self.verticalAlignment,
                                      horizontalMargin: self.horizontalMargin, verticalMargin: self.verticalMargin,
                                      fps: self.fps, keyFrame: self.keyFrame, requiredTexts: self.requiredTexts,
                                      requiresAllTexts: self.requiresAllTexts, timeGravity: self.timeGravity,
                                      zIndex: self.zIndex, questionConditions: self.questionConditions)
        }
    }
}

extension TemplateQuestion {
    var mmzTemplateQuestion: MMZTemplateQuestion {
        get {
            return MMZTemplateQuestion(id: self.id, question: self.question, type: self.type,
                                       maxNumCharacters: self.maxNumCharacters)
        }
    }
}

extension TemplateShotProperties {
    var mmzTemplateShotProperties: MMZTemplateShotProperties {
        get {
            return MMZTemplateShotProperties(defaultScene: self.defaultScene.mmzScene,
                                             overlays: self.overlays.map { $0.mmzTemplateOverlay },
                                             text: self.text.map { $0.mmzTemplateText },
                                             question: self.question.mmzTemplateQuestion,
                                             audioSegments: self.audioSegments.map { $0.mmzTemplateAudioSegment })
        }
    }
}

extension TemplateSoundtrack {
    var mmzTemplateSoundtrack: MMZTemplateSoundtrack {
        get {
            return MMZTemplateSoundtrack(id: self.id, title: self.title, overlayText: self.overlayText)
        }
    }
}

extension TemplateText {
    var mmzTemplateText: MMZTemplateText {
        get {
            return MMZTemplateText(id: self.id, text: self.text, size: self.size, font: self.font, color: self.color,
                                   startTime: self.startTime, duration: self.duration, fadeDuration: self.fadeDuration,
                                   horizontalAlignment: self.horizontalAlignment,
                                   verticalAlignment: self.verticalAlignment, horizontalMargin: self.horizontalMargin,
                                   verticalMargin: self.verticalMargin, maxWidth: self.maxWidth,
                                   maxHeight: self.maxHeight, textAlignment: self.textAlignment,
                                   verticalTextAlignment: self.verticalTextAlignment, lineSpacing: self.lineSpacing,
                                   timeGravity: self.timeGravity, zIndex: self.zIndex)
        }
    }
}

extension Transition {
    var mmzTransition: MMZTransition {
        get {
            return MMZTransition(id: self.id, parameters: self.parameters)
        }
    }
}

extension Video {
    func mmzVideo(at url: URL) -> MMZVideo {
        return MMZVideo(id: self.id, shot: self.shot, url: url, duration: self.duration)
    }
}
