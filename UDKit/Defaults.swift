//
//  UserDefaults.swift
//  UDKit
//
//  Created by motokiee on 2017/12/29.
//

import Foundation

public struct Key<Value: Codable> {
    internal let key: String

    public init(_ key: String) {
        self.key = key
    }
}


public final class Defaults {
    private static let userDefaults = UserDefaults.standard
    private init() {}

    public static func get<Value>(key: Key<Value>) -> Value? {
        guard let data = userDefaults.data(forKey: key.key) else {
            return nil
        }

        let decoder = JSONDecoder()
        return try? decoder.decode(Value.self, from: data)
    }

    public static func set<Value>(value: Value, for key: Key<Value>) {
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

}
