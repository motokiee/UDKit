//
//  UserDefaults.swift
//  UDKit
//
//  Created by motokiee on 2017/12/29.
//

import Foundation

public struct Key<Value: Codable> {
    public let key: String

    public init(_ key: String) {
        self.key = key
    }
}


public final class Defaults {
    private static let userDefaults = UserDefaults.standard
    private init() {}

    public static func get<Value>(key: Key<Value>) -> Value? {

        guard !isPrimitive(Value.self) else {
            return userDefaults.value(forKey: key.key) as? Value
        }

        guard let data = userDefaults.data(forKey: key.key) else {
            return nil
        }

        let decoder = JSONDecoder()
        return try? decoder.decode(Value.self, from: data)
    }

    public static func set<Value>(value: Value, for key: Key<Value>) {

        guard !isPrimitive(Value.self) else {
            userDefaults.set(value, forKey: key.key)
            return
        }

        let encoder = JSONEncoder()
        guard let encoded = try? encoder.encode(value) else {
            return
        }
        userDefaults.set(encoded, forKey: key.key)
        userDefaults.synchronize()
    }

    public static func clear<Value>(key: Key<Value>) {
        userDefaults.set(nil, forKey: key.key)
        userDefaults.synchronize()
    }

    private static func isPrimitive<Value>(_ valueType: Value.Type) -> Bool {
        switch valueType {
        case is String.Type:
            return true
        case is Bool.Type:
            return true
        case is Int.Type:
            return true
        case is Float.Type:
            return true
        case is Double.Type:
            return true
        default:
            return false
        }
    }
}
