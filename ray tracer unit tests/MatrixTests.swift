//
//  MatrixTests.swift
//  ray tracer unit tests
//
//  Created by Christopher Paterson on 24/08/2018.
//  Copyright © 2018 Christopher Paterson. All rights reserved.
//

import XCTest

class MatrixTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testConstructAndInspect4x4Matrix() {
        let m = Matrix([
            [1, 2, 3, 4],
            [5.5, 6.5, 7.5, 8.5],
            [9, 10, 11, 12],
            [13.5, 14.5, 15.5, 16.5]
        ])
        
        XCTAssert(m[0,3] == 4)
        XCTAssert(m[1,0] == 5.5)
        XCTAssert(m[1,2] == 7.5)
        XCTAssert(m[2,2] == 11)
        XCTAssert(m[3,0] == 13.5)
        XCTAssert(m[3,2] == 15.5)
    }
    
    func test2x2Matrix() {
        let m = Matrix([
            [-3, 5],
            [1, -2]
        ])
        
        XCTAssert(m.width == 2)
        XCTAssert(m.height == 2)
        
        let m2 = Matrix(width: 2, height: 2, repeating: 0)
        XCTAssert(m2.width == 2)
        XCTAssert(m2.height == 2)
    }
    
    func test3x3Matrix() {
        let m = Matrix([
            [-3, 5, 0],
            [1, -2, -7],
            [0, 1, 1]
        ])
        
        XCTAssert(m.width == 3)
        XCTAssert(m.height == 3)
        
        let m2 = Matrix(width: 3, height: 3, repeating: 0)
        XCTAssert(m2.width == 3)
        XCTAssert(m2.height == 3)
    }

}
