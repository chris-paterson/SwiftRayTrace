//
//  MaterialTests.swift
//  ray tracer unit tests
//
//  Created by Chris Paterson on 2018-12-11.
//  Copyright © 2018 Christopher Paterson. All rights reserved.
//

import XCTest

class MaterialTest: XCTestCase {
    
    func testDefaultMaterial() {
        let m = Material()
        XCTAssert(m.color == Color(r: 1, g: 1, b: 1))
        XCTAssert(m.ambient == 0.1)
        XCTAssert(m.diffuse == 0.9)
        XCTAssert(m.shininess == 200)
    }
}
