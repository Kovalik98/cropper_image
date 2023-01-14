//
//  Template.swift
//  Momenzo
//
//  Created by Flo Vouin on 30/09/16.
//  Copyright © 2016 Flo. All rights reserved.
//

import MomenzoVideoEngine

/**
    Describes a series of shot that will form a montage.
*/
@objcMembers
class Template: YepObject {
    /**
        Given a template ID, returns the corresponding name and version.

        - Parameters:
            - from: The template ID.

        - Returns: A tuple containing the name and the version of the template, or `nil` if the ID is invalid.
    */
    static func nameAndVersion(from templateID: String) -> (String, String)? {
        let components = templateID.components(separatedBy: ":")
        guard components.count == 2 else { return nil }

        return (components[0], components[1])
    }

    /**
        The unique name of the template.
    */
    private(set) var name: String = ""
    /**
        The displayed name for the template.
    */
    private(set) var title: String = ""
    /**
        The cost of exporting a montage using this template.
    */
    private(set) var cost: Int = 0
    /**
        The company who owns this template.
    */
    private(set) var company: String = ""
    /**
        The date when this template was uploaded.
    */
    private(set) var date: Date = Date()
    /**
        The language in which the template is written.
    */
    private(set) var language: String = ""
    /**
        The tags associated with this template.
    */
    private(set) var tags: [String] = []
    /**
        The version of the template.
    */
    private(set) var version: Int = 0
    /**
        The type of subject that this template applies to (car, apartment, etc).
    */
    private(set) var subjectType: String = ""
    /**
        A short description of the template's purpose.
    */
    private(set) var shortDescription: String = ""
    /**
        A long description of the template's purpose.
    */
    private(set) var longDescription: String = ""
    /**
        Whether the user can select this template to start recording. If `false`, the template is only available for
        existing montages.
    */
    private(set) var allowRecording: Bool = true
    /**
        The reference resolution height for overlays dimensions and layout. The default is `720`.
    */
    private(set) var referenceHeight: Int = MMZTemplate.kDefaultReferenceHeight
    /**
        The list of shots (referenced by ID) needed to create the montage.
    */
    private(set) var shots: [String] = []
    /**
        Describes how the shots are arranged to form the montage.
    */
    private(set) var scenes: [Scene] = []
    /**
        The transitions (reference by ID) between the scenes. There should be n + 1 transitions for
        n scenes, such that a start and end transitions are specified.
    */
    private(set) var transitions: [Transition] = []
    /**
        The available soundtracks.
    */
    private(set) var soundtracks: [TemplateSoundtrack] = []
    /**
        The audio assets to play during the composition.
    */
    private(set) var audioSegments: [TemplateAudioSegment] = []
    /**
        The list of text overlays to display.
    */
    private(set) var text: [TemplateText] = []
    /**
        The list of image overlays to display.
    */
    private(set) var overlays: [TemplateOverlay] = []
    /**
        A list of questions asked to the user about the subject.
    */
    private(set) var questions: [TemplateQuestion] = []
    /**
        The list of allowed shots that can be added as extra scene to the montage.
    */
    private(set) var availableExtraShots: [String] = []
    /**
        Information about shots that is specific to this template.
        Keys are shot IDs, and values are properties about how to arrange / enhance these shots.
    */
    private(set) var shotProperties: [String: TemplateShotProperties] = [:]
    /**
        The transition to use when adding extra scenes to the montage.
    */
    private(set) var extraScenesTransition: Transition = Transition(id: "TransitionNone", parameters: [:])
    /**
        The index at which extra scenes will be added in the montage.
    */
    private(set) var extraScenesInsertionIndex: Int = 0
    /**
        The transition that will be used as a start transition in case extra shots are added, and
        `extraScenesInsertionIndex` is `0`.
    */
    private(set) var extraScenesStartTransition: Transition = Transition(id: "TransitionNone", parameters: [:])
    /**
        The list of generic shots.
    */
    private(set) var genericShots: [String] = []
    /**
        The default title of the video when sharing it.
    */
    private(set) var shareTitle: String = ""
    /**
        The default description of the video when sharing it.
    */
    private(set) var shareDescription: String = ""
    /**
        When `true`, the template is not available to record new videos, and is only kept to be able
        to render previously recorded montages.
    */
    private(set) var isHidden = false

    init(id: String, name: String, title: String, cost: Int, company: String, date: Date,
         language: String, tags: [String], version: Int, subjectType: String, shortDescription: String,
         longDescription: String, allowRecording: Bool, referenceHeight: Int, shots: [String], scenes: [Scene],
         transitions: [Transition], soundtracks: [TemplateSoundtrack], audioSegments: [TemplateAudioSegment],
         text: [TemplateText], overlays: [TemplateOverlay], questions: [TemplateQuestion],
         availableExtraShots: [String], shotProperties: [String: TemplateShotProperties],
         extraScenesTransition: Transition, extraScenesInsertionIndex: Int, extraScenesStartTransition: Transition,
         genericShots: [String], shareTitle: String, shareDescription: String) {
        self.name = name
        self.title = title
        self.cost = cost
        self.company = company
        self.date = date
        self.language = language
        self.tags = tags
        self.version = version
        self.subjectType = subjectType
        self.shortDescription = shortDescription
        self.longDescription = longDescription
        self.allowRecording = allowRecording
        self.referenceHeight = referenceHeight
        self.shots = shots
        self.scenes = scenes
        self.transitions = transitions
        self.soundtracks = soundtracks
        self.audioSegments = audioSegments
        self.text = text
        self.overlays = overlays
        self.questions = questions
        self.availableExtraShots = availableExtraShots
        self.shotProperties = shotProperties
        self.extraScenesTransition = extraScenesTransition
        self.extraScenesInsertionIndex = extraScenesInsertionIndex
        self.extraScenesStartTransition = extraScenesStartTransition
        self.genericShots = genericShots
        self.shareTitle = shareTitle
        self.shareDescription = shareDescription
        super.init(id: id)
    }
    
    
    init (overlay: defaultSceneTemplate )  {
        self.name = overlay.name!
        self.title = overlay.title!
        self.cost = overlay.cost!
        self.company = overlay.company!
        self.date = Date()
        self.language = overlay.language!
        self.tags = overlay.tags!
        self.version = overlay.version!
        self.subjectType = overlay.subjectType!
        self.shortDescription = overlay.shortDescription!
        self.longDescription = overlay.longDescription!
        self.allowRecording = overlay.allowRecording!
        self.referenceHeight = overlay.referenceHeight!
        self.shots = [""]
//        self.scenes = scenes
//        self.transitions = transitions
//        self.soundtracks = soundtracks
//        self.audioSegments = audioSegments
//        self.text = text
//        self.overlays = overlays
//        self.questions = questions
        self.availableExtraShots = [""]
//        self.shotProperties = shotProperties
//        self.extraScenesTransition =  extraScenesTransition
        self.extraScenesInsertionIndex = overlay.extraScenesInsertionIndex!
        self.extraScenesStartTransition = extraScenesTransition
        self.genericShots = [""]
        self.shareTitle = overlay.shareTitle!
        self.shareDescription = overlay.shareDescription!
        super.init(id: "")
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func hidden() -> Template {
        let template = Template(id: self.id, name: self.name, title: self.title,
                                cost: self.cost, company: self.company, date: self.date, language: self.language,
                                tags: self.tags, version: self.version, subjectType: self.subjectType,
                                shortDescription: self.shortDescription, longDescription: self.longDescription,
                                allowRecording: self.allowRecording, referenceHeight: self.referenceHeight,
                                shots: self.shots, scenes: self.scenes, transitions: self.transitions,
                                soundtracks: self.soundtracks, audioSegments: self.audioSegments, text: self.text,
                                overlays: self.overlays, questions: self.questions,
                                availableExtraShots: self.availableExtraShots, shotProperties: self.shotProperties,
                                extraScenesTransition: self.extraScenesTransition,
                                extraScenesInsertionIndex: self.extraScenesInsertionIndex,
                                extraScenesStartTransition: self.extraScenesStartTransition,
                                genericShots: self.genericShots, shareTitle: self.shareTitle,
                                shareDescription: self.shareDescription)
        template.isHidden = true
        return template
    }

    // swiftlint:disable:next function_body_length cyclomatic_complexity
    override class func migrate(dictionary: DecoderDictionary, from version: Int) -> Bool {
        if version < 4 {
            var soundtracks = [TemplateSoundtrack]()
            if let soundtrack = dictionary["soundtrack"] as? String, !soundtrack.isEmpty {
                soundtracks.append(TemplateSoundtrack(id: soundtrack, title: "", overlayText: ""))
            }
            dictionary["soundtracks"] = soundtracks
        }

   
        return true
    }
}
