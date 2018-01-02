//
//  Memory.swift
//  UDKit
//
//  Created by motokiee on 2018/01/02.
//  Copyright © 2018年 motokiee. All rights reserved.
//

import Foundation

public final class MemCache<Value: NSObject&Codable> {

    private let cache = NSCache<NSString, Value>()

    public func get(key: Key<Value>) -> Value? {
        return cache.object(forKey: key.key as NSString)
    }

    public func set(value: Value, for key: Key<Value>) {
        cache.setObject(value, forKey: key.key as NSString)
    }

    public func clear(key: Key<Value>) {
        cache.removeObject(forKey: key.key as NSString)
    }

    public init() {}

}
