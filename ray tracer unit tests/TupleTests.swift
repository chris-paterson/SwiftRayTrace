//
//  TupleTests.swift
//  ray tracer unit tests
//
//  Created by Christopher Paterson on 22/08/2018.
//  Copyright © 2018 Christopher Paterson. All rights reserved.
//

import XCTest

class TupleTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testTupleIsPoint() {
        let a = Tuple(x: 4.3, y: -4.2, z: 3.1, w: 1.0)
        XCTAssert(a.x == 4.3)
        XCTAssert(a.y == -4.2)
        XCTAssert(a.z == 3.1)
        XCTAssert(a.w == 1.0)
        
        let point = a.TupleFactory()
        XCTAssert(point is Point)
        XCTAssert(!(point is Vector))
        XCTAssert(point.w == 1.0)
    }
    
    func testTupleIsVector() {
        let a = Tuple(x: 4.3, y: -4.2, z: 3.1, w: 0.0)
        XCTAssert(a.x == 4.3)
        XCTAssert(a.y == -4.2)
        XCTAssert(a.z == 3.1)
        XCTAssert(a.w == 0.0)
        
        let point = a.TupleFactory()
        XCTAssert(point is Vector)
        XCTAssert(!(point is Point))
        XCTAssert(point.w == 0.0)
    }

}
