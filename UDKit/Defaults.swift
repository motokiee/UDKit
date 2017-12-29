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

    public static func clear<Value>(key: Key<Value>) {
        userDefaults.set(nil, forKey: key.key)
        userDefaults.synchronize()
    }

}
