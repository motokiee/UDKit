//
//  Tmp.swift
//  UDKit
//
//  Created by motokiee on 2018/01/02.
//  Copyright © 2018年 motokiee. All rights reserved.
//

import Foundation

public final class Documents {

    private static let fileManager = FileManager.default
    private static let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]

    private init() {}

    public static func get<Value>(key: Key<Value>) -> Value? {

        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let filePath = path + "/" + key.key

        guard let data = fileManager.contents(atPath: filePath) else {
            return nil
        }

        let decoder = JSONDecoder()

        do {
            let value = try decoder.decode(Value.self, from: data)
            return value
        } catch let error {
            print(error)
            return nil
        }
    }

    public static func set<Value>(value: Value, for key: Key<Value>) -> Result<Void, Error?> {

        let filePath = documentDirectory.appendingPathComponent(key.key)

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

    public static func clear<Value>(key: Key<Value>) {
        let filePath = documentDirectory.appendingPathComponent(key.key)
        try? fileManager.removeItem(at: filePath)
    }

}
