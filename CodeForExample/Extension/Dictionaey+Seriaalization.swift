//
//  Dictionary+Serialization.swift
//  Momenzo
//
//  Created by Flo Vouin on 19/08/2017.
//  Copyright © 2017 Flo. All rights reserved.
//

import Foundation

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    formatter.locale = Locale(identifier: "en_US_POSIX")
    return formatter
}()

/**
    A set of utilities to "manually" parse dictionaries obtain from JSON parsing. This was implemented before Swift got
    better at handling JSON.
*/
extension Dictionary where Key == String {
    func string(for key: String) -> String? {
        return self[key] as? String
    }

    func int(for key: String) -> Int? {
        return self[key] as? Int
    }

    func bool(for key: String) -> Bool? {
        return self[key] as? Bool
    }

    func double(for key: String) -> Double? {
        return self[key] as? Double
    }

    func objectDictionary(for key: String) -> [String: Any]? {
        return self[key] as? [String: Any]
    }

    func object<T>(for key: String, converter: ([String: Any]) -> T?) -> T? {
        guard let dic = self[key] as? [String: Any] else { return nil }

        return converter(dic)
    }

    func array<T>(for key: String, converter: (Any) -> T?) -> [T]? {
        guard let array = self[key] as? [Any] else { return nil }

        let converted = array.compactMap(converter)
        return converted.count == array.count ? converted : nil
    }

    func array<T>(for key: String, objectConverter: ([String: Any]) -> T?) -> [T]? {
        return self.array(for: key, converter: { (item) -> T? in
            guard let dic = item as? [String: Any] else { return nil }
            return objectConverter(dic)
        })
    }

    func stringArray(for key: String) -> [String]? {
        return self.array(for: key, converter: String.init(describing:))
    }

    func dictionary<T>(for key: String, converter: (Any) -> T?) -> [String: T]? {
        guard let dic = self[key] as? [String: Any] else { return nil }

        return dic.dictionary(converter: converter)
    }

    func dictionary<T>(for key: String, objectConverter: ([String: Any]) -> T?) -> [String: T]? {
        guard let dic = self[key] as? [String: Any] else { return nil }

        return dic.dictionary(converter: { value in
            guard let object = value as? [String: Any] else { return nil }

            return objectConverter(object)
        })
    }

    func dictionary<T>(converter: (Any) -> T?) -> [String: T]? {
        var converted = [String: T]()
        for (key, value) in self {
            let convertedKey = String(describing: key)
            guard let convertedValue = converter(value) else { return nil }

            converted[convertedKey] = convertedValue
        }
        return converted
    }

    func stringDictionaryWithoutID() -> [String: String]? {
        guard var dic = self.dictionary(converter: String.init(describing:)) else { return nil }

        dic["id"] = nil
        return dic
    }

    func date(for key: String) -> Date? {
        guard let dateString = self[key] as? String else { return nil }
        return dateFormatter.date(from: dateString)
    }
}
