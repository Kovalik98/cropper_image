// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
////
//   let templatet = try? newJSONDecoder().decode(Templatet.self, from: jsonData)

import Foundation

// MARK: - Templatet
struct _Templatet: Codable {
    let templates: [_Template]?
    let templatesToRemove: [JSONAny]?
    let shots: [_Shot]?
}

// MARK: - Shot
struct _Shot: Codable {
    let instructionsTips, videoTips: [String]?
    let company: String?
    let duration: Int?
    let id: ShotElement?
    let motion, name, setupInstructions: String?
    let stencil: [JSONAny]?
    let translationSpeed: Double?
}

enum ShotElement: String, Codable {
    case shotDemo0EnIntro = "shot_demo0_en_intro"
    case shotDemo0EnKitchenS = "shot_demo0_en_kitchen_s"
    case shotDemo0EnLivingS = "shot_demo0_en_living_s"
}

// MARK: - Template
struct _Template: Codable {
    let tags: [String]?
    let shots: [String]?
    let company: String?
    let allowRecording: Bool?
    let availableExtraShots: [String]?
    let cost: Int?
    let date: Date?
    let extraScenesInsertionIndex: Int?
    let extraScenesTransition: ExtraScenesTransition?
    let genericShots: [String]?
    let language, longDescription, name: String?
    let overlays: [Overlay]?
    let questions: [QuestionElement]?
    let referenceHeight: Int?
    let scenes: [_Scene]?
    let shareDescription, shareTitle, shortDescription: String?
    let shotProperties: ShotProperties?
    let soundtrack: String?
    let soundtracks: [Soundtrack]?
    let subjectType: String?
    let text: [Text]?
    let title: String?
    let transitions: [_Transition]?
    let version: Int?
    let id: String?
}

// MARK: - ExtraScenesTransition
struct ExtraScenesTransition: Codable {
    let id: ExtraScenesTransitionID?
    let halfSpan: String?
}

enum ExtraScenesTransitionID: String, Codable {
    case transitionCrossfade = "TransitionCrossfade"
    case transitionEndFadeOut = "TransitionEndFadeOut"
    case transitionNone = "TransitionNone"
    case transitionZoom = "TransitionZoom"
}

// MARK: - Overlay
struct Overlay: Codable {
    let asset: String?
    let opacity: Double?
    let startTime, fadeDuration, duration: Int?
    let horizontalAlignment, verticalAlignment: String?
    let horizontalMargin, verticalMargin: Double?
    let keyFrame, zIndex: Int?
    let requiredTexts: [String]?
    let fps: Double?
    let requiresAllTexts: Bool? = true
}

enum Alignment: String, Codable {
    case center = "center"
    case end = "end"
    case start = "start"
}

enum TypeElement: String, Codable {
    case price = "price"
    case projectName = "projectName"
    case surface = "surface"
    case text = "text"
}

// MARK: - QuestionElement
struct QuestionElement: Codable {
    let id: String?
    let question: String?
    let type: String?
    let maxNumCharacters: Int?
}

enum QuestionEnum: String, Codable {
    case priceAddYourCurrency = "Price (add your currency):"
    case surfaceSpecifyUnitOfMeasure = "Surface (specify unit of measure):"
    case titleOfYourVideo = "Title of your video:"
    case writeYourTextHere = "Write your text here"
}

// MARK: - Scene
struct _Scene: Codable {
    let id: SceneID?
    let shots: [String]?
    let shotStartTimes: [Int]?
    let duration: Int?
    let muted: Bool?
    let soundtrackVolume: Double?
    let disableShotOverlays: Bool?
}

enum SceneID: String, Codable {
    case sceneDefault = "SceneDefault"
}

// MARK: - ShotProperties
struct ShotProperties: Codable {
    let shot1Demo0LivingS, shot1Demo0KitchenS: Shot1Demo0?

    enum CodingKeys: String, CodingKey {
        case shot1Demo0LivingS = "shot1_demo0_living_s"
        case shot1Demo0KitchenS = "shot1_demo0_kitchen_s"
    }
}

// MARK: - Shot1Demo0
struct Shot1Demo0: Codable {
    let overlays: [Overlay]?
    let text: [Text]?
    let question: QuestionElement?
}

// MARK: - Text
struct Text: Codable {
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

enum Color: String, Codable {
    case black = "black"
    case white = "white"
}

enum Font: String, Codable {
    case arialBoldItalicMT = "Arial-BoldItalicMT"
    case arialBoldMT = "Arial-BoldMT"
}

enum TextAlignment: String, Codable {
    case center = "center"
    case start = "start"
    case textAlignmentLeft = "left"
    case textAlignmentRight = "right"
}

// MARK: - Soundtrack
struct Soundtrack: Codable {
    let id, title, overlayText: String?
}

// MARK: - Transition
struct _Transition: Codable {
    let id: ExtraScenesTransitionID?
    let halfSpan, scaleFactor: String?
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
