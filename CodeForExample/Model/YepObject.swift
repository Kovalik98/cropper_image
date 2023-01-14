//
//  YepObject.swift
//  Momenzo
//
//  Created by Flo Vouin on 02/10/16.
//  Copyright © 2016 Flo. All rights reserved.
//

import Foundation
import UIKit


class DecoderDictionary {
    private let coder: NSCoder
    private var updates = [String: Any]()

    init(coder: NSCoder) {
        self.coder = coder
    }

    subscript(key: String) -> Any? {
        get {
            if let value = self.updates[key] {
                return value
            }
            return self.coder.decodeObject(forKey: key)
        }

        set(value) {
            self.updates[key] = value
        }
    }
}



private let kModelVersionKey = "@modelVersion"

/**
    Base class for all objects in the model.
*/
@objcMembers
class YepObject: NSObject, NSCoding {
    /**
        The version of the objects in the model. Should be incremented each time a model class is updated.
    */
    static var kModelVersion: Int = 1

    /**
        The unique ID for this item in the whole database.
    */
    private(set) var id: String = ""

    /**
        Optional dictionary containing raw data downloaded from the server, that can be parsed again when the app is
        updated.
    */
    private(set) var rawObject: [String: Any] = [:]

    init(id: String, rawObject: [String: Any] = [:]) {
        super.init()

        self.id = id
        self.rawObject = rawObject
    }

    required init?(coder aDecoder: NSCoder) {
        super.init()

        let dictionary = DecoderDictionary(coder: aDecoder)
        guard let version = dictionary[kModelVersionKey] as? Int else { return nil }

        if dictionary["rawObject"] == nil { dictionary["rawObject"] = [String: Any]() }

        if version != YepObject.kModelVersion &&
            !type(of: self).migrate(dictionary: dictionary, from: version) { return nil }

        for property in self.propertyNames {
            guard let value = dictionary[property] else { return nil }
            setValue(value, forKey: property)
        }
    }

    func encode(with aCoder: NSCoder) {
        for property in self.propertyNames {
            aCoder.encode(value(forKey: property)!, forKey: property)
        }
        aCoder.encode(YepObject.kModelVersion as Any, forKey: kModelVersionKey)
    }

    /**
        Should be implemented by subclasses that need to migrate objects serialised from older
        versions to the new format.

        - Parameters:
            - dictionary: The dictionary containing the serialised key-values. Keys can be added or
                updated to match the properties of the subclass.
            - from: The version of the old, serialised object.

        - Returns: `true` if the migration succeeded, `false` otherwise.
    */
    class func migrate(dictionary: DecoderDictionary, from version: Int) -> Bool {
        return true
    }

    private var propertyNames: [String] {
        get {
            var propertyNames = [String]()
            var mirror: Mirror? = Mirror(reflecting: self)
            while let curMirror = mirror {
                propertyNames += curMirror.children.compactMap { (label, _) in label }
                mirror = curMirror.superclassMirror
            }
            return propertyNames
        }
    }
}
