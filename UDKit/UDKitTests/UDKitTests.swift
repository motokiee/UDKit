//
//  UDKitTests.swift
//  UDKitTests
//
//  Created by motokiee on 2017/12/29.
//  Copyright © 2017年 motokiee. All rights reserved.
//

import XCTest
@testable import UDKit

class UDKitTests: XCTestCase {

    static let key = Key<User>("user")
    static let user = User(name: "Steve", age: 55)

    struct User: Codable {
        var name: String
        var age: Int
    }

    override func setUp() {
        super.setUp()
        Defaults.clear(key: UDKitTests.key)
    }
    
    override func tearDown() {
        super.tearDown()
        Defaults.clear(key: UDKitTests.key)
    }
    
    func testGetSet() {
        Defaults.set(value: UDKitTests.user, for: UDKitTests.key)

        guard let nonNilExpected = Defaults.get(key: UDKitTests.key) else {
            XCTFail()
            return
        }

        XCTAssertEqual(nonNilExpected.name, UDKitTests.user.name)
        XCTAssertEqual(nonNilExpected.age, UDKitTests.user.age)
    }
}
