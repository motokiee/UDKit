//
//  Cache.swift
//  UDKit
//
//  Created by motokiee on 2018/01/01.
//  Copyright © 2018年 motokiee. All rights reserved.
//

import Foundation

public enum Result<Void, Error> {
    case success
    case failed(Error?)
}

public final class Cache {

    private static let fileManager = FileManager.default
    private static let cacheDirectory = fileManager.urls(for: .cachesDirectory, in: FileManager.SearchPathDomainMask.userDomainMask)[0]

    private init() {}

    public static func get<Value>(key: Key<Value>) -> Value? {

        let filePath = cacheDirectory.appendingPathComponent(key.key)

        guard let data = fileManager.contents(atPath: filePath.absoluteString) else {
            return nil
        }

        let decoder = JSONDecoder()
        return try? decoder.decode(Value.self, from: data)
    }

    public static func set<Value>(value: Value, for key: Key<Value>) -> Result<Void, Error?> {

        let filePath = cacheDirectory.appendingPathComponent(key.key)

        let encoder = JSONEncoder()
        guard let encoded = try? encoder.encode(value) else {
            return .failed(nil)
        }

        do {
            try encoded.write(to: filePath)
            return .success

        } catch let error {
            return .failed(error)
        }
    }
}
