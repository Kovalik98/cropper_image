// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let defaultSceneDefoltModel = try? newJSONDecoder().decode(defaultSceneDefoltModel.self, from: jsonData)

import Foundation

// MARK: - defaultSceneDefoltModel
struct defaultSceneDefoltModel: Codable {
    let templates: [defaultSceneTemplate]?
    let templatesToRemove: [JSONAny]?
    let shots: [defaultSceneShot]?
}

// MARK: - defaultSceneShot
struct defaultSceneShot: Codable {
    let instructionsTips, videoTips: [String]?
    let company: String?
    let duration: Int?
    let id: defaultSceneShotElement?
    let motion, name, setupInstructions: String?
    let stencil: [JSONAny]?
    let translationSpeed: Double?
}

enum defaultSceneShotElement: String, Codable {
    case shotDemo0EnIntro = "shot_demo0_en_intro"
    case shotDemo0EnKitchenS = "shot_demo0_en_kitchen_s"
    case shotDemo0EnLivingS = "shot_demo0_en_living_s"
}

// MARK: - defaultSceneTemplate
struct defaultSceneTemplate: Codable {
    let tags: [String]?
    let shots: [String]?
    let company: String?
    let allowRecording: Bool?
    let availableExtraShots: [String]?
    let cost: Int?
    let format: [Format]!
    let date: String?
    let extraScenesInsertionIndex: Int?
    let extraScenesTransition: defaultSceneExtraScenesTransition?
    let genericShots: [JSONAny]?
    let language, longDescription, name: String?
    let overlays: [defaultSceneOverlay]?
    let questions: [defaultSceneQuestionElement]?
    let referenceHeight: Int?
    let scenes: [defaultSceneScene]?
    let shareDescription, shareTitle, shortDescription: String?
    let shotProperties: defaultSceneShotProperties?
    let soundtrack: String?
    let soundtracks: [defaultSceneSoundtrack]?
    let subjectType: String?
    let text: [defaultSceneText]?
    let title: String?
    let transitions: [defaultSceneTransition]?
    let version: Int?
    let id: String?
}

// MARK: - defaultSceneExtraScenesTransition
struct defaultSceneExtraScenesTransition: Codable {
    let id: defaultSceneExtraScenesTransitionID?
    let halfSpan: String?
}

enum defaultSceneExtraScenesTransitionID: String, Codable {
    case transitionCrossfade = "TransitionCrossfade"
    case transitionEndFadeOut = "TransitionEndFadeOut"
    case transitionNone = "TransitionNone"
    case transitionZoom = "TransitionZoom"
}

// MARK: - Format
struct Format: Codable {
    let isDeffault: Bool!
    let identifier: String!
}

enum Identifier: String, Codable {
    case the11 = "1:1"
    case the11Croped = "1:1croped"
    case the169 = "16:9"
    case the916 = "9:16"
}

// MARK: - defaultSceneOverlay
struct defaultSceneOverlay: Codable {
    let asset: String?
    let opacity: Double?
    let formatIdentifiers: [Identifier]?
    let startTime, fadeDuration, duration: Int?
    let horizontalAlignment, verticalAlignment: String?
    let horizontalMargin, verticalMargin: Double?
    let zIndex, keyFrame: Int?
    let requiredTexts: [String]?
    let fps: Double?
}

enum defaultSceneAlignment: String, Codable {
    case center = "center"
    case end = "end"
    case start = "start"
}

enum defaultSceneTypeElement: String, Codable {
    case price = "price"
    case projectName = "projectName"
    case surface = "surface"
    case text = "text"
}

// MARK: - defaultSceneQuestionElement
struct defaultSceneQuestionElement: Codable {
    let id: defaultSceneTypeElement?
    let question: defaultSceneQuestionEnum?
    let type: defaultSceneTypeElement?
    let maxNumCharacters: Int?
}

enum defaultSceneQuestionEnum: String, Codable {
    case priceAddYourCurrency = "Price (add your currency):"
    case surfaceSpecifyUnitOfMeasure = "Surface (specify unit of measure):"
    case titleOfYourVideo = "Title of your video:"
    case writeYourTextHere = "Write your text here"
}

// MARK: - defaultSceneScene
struct defaultSceneScene: Codable {
    let id: defaultSceneSceneID?
    let shots: [String]?
    let shotStartTimes: [Int]?
    let duration: Int?
    let muted: Bool?
    let soundtrackVolume: Double?
    let disableShotOverlays: Bool?
}

enum defaultSceneSceneID: String, Codable {
    case sceneDefault = "SceneDefault"
}

// MARK: - defaultSceneShotProperties
struct defaultSceneShotProperties: Codable {
    let shot1Demo0LivingS, shot1Demo0KitchenS: defaultSceneShot1Demo0?

    enum CodingKeys: String, CodingKey {
        case shot1Demo0LivingS
        case shot1Demo0KitchenS
    }
}

// MARK: - defaultSceneShot1Demo0
struct defaultSceneShot1Demo0: Codable {
    let overlays: [defaultSceneOverlay]?
    let text: [defaultSceneText]?
    let question: defaultSceneQuestionElement?
}

// MARK: - defaultSceneText
struct defaultSceneText: Codable {
    let id, text: String?
    let startTime, duration, fadeDuration: Int?
    let horizontalAlignment, verticalAlignment: String?
    let color: String?
    let size: Double?
    let font: String?
    let lineSpacing, maxWidth, maxHeight, horizontalMargin: Double?
    let verticalMargin: Double?
    let textAlignment: String?
    let verticalTextAlignment: String?
    let zIndex: Int?
}

enum defaultSceneColor: String, Codable {
    case black = "black"
    case white = "white"
}

enum defaultSceneFont: String, Codable {
    case arialBoldItalicMT = "Arial-BoldItalicMT"
    case arialBoldMT = "Arial-BoldMT"
}

enum defaultSceneTextAlignment: String, Codable {
    case center = "center"
    case start = "start"
    case textAlignmentLeft = "left"
    case textAlignmentRight = "right"
}

// MARK: - defaultSceneSoundtrack
struct defaultSceneSoundtrack: Codable {
    let id, title, overlayText: String?
}

// MARK: - defaultSceneTransition
struct defaultSceneTransition: Codable {
    let id: defaultSceneExtraScenesTransitionID?
    let halfSpan, scaleFactor: String?
}

// MARK: - Encode/decode helpers



