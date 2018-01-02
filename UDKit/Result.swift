//
//  Result.swift
//  UDKit
//
//  Created by motokiee on 2018/01/02.
//  Copyright © 2018年 motokiee. All rights reserved.
//

import Foundation

public enum Result<Void, Error> {
    case success
    case failed(Error?)
}
