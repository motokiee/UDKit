//
//  Key.swift
//  UDKit
//
//  Created by motokiee on 2018/01/02.
//  Copyright © 2018年 motokiee. All rights reserved.
//

import Foundation

public struct Key<Value: Codable> {
    public let key: String

    public init(_ key: String) {
        self.key = key
    }
}
