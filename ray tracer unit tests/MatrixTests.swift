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
    
    func testMatrixMultiplication() {
        let m1 = Matrix([
            [1, 2, 3, 4],
            [2, 3, 4, 5],
            [3, 4, 5, 6],
            [4, 5, 6, 7]
        ])
        
        let m2 = Matrix([
            [0, 1, 2, 4],
            [1, 2, 4, 8],
            [2, 4, 8, 16],
            [4, 8, 16, 32]
        ])
        
        let expected = Matrix([
            [24 , 49 ,  98 , 196],
            [31 , 64 , 128 , 256],
            [38 , 79 , 158 , 316],
            [45 , 94 , 188 , 376]
        ])
        
        XCTAssert(m1 * m2 == expected)
    }
    
    func testMatMulTuple() {
        let m = Matrix([
            [1, 2, 3, 4],
            [2, 4, 4, 2],
            [8, 6, 4, 1],
            [0, 0, 0, 1],
        ])
        
        let t = Tuple(x: 1, y: 2, z: 3, w: 1)
        let expected = Tuple(x: 18, y: 24, z: 33, w: 1)
        let result = m * t
        
        XCTAssert(result == expected)
    }
    
    func testMultiplyMatrixByIdentitiy() {
        let m = Matrix([
            [0, 1, 2, 4],
            [1, 2, 4, 8],
            [2, 4, 8, 16],
            [4, 8, 16, 32]
        ])
        
        let result = m * Matrix.identity
        XCTAssert(result == m)
    }
    
    func testTransposeMatrix() {
        let m = Matrix([
            [0, 9, 3, 0],
            [9, 8, 0, 8],
            [1, 8, 5, 3],
            [0, 0, 5, 8]
        ])
        
        let transposedM = Matrix([
            [0, 9, 1, 0],
            [9, 8, 8, 0],
            [3, 0, 5, 5],
            [0, 8, 3, 8]
        ])
        
        XCTAssert(m.transposed() == transposedM)
    }
    
    func testTransposeIdentity() {
        XCTAssert(Matrix.identity.transposed() == Matrix.identity)
    }

}
