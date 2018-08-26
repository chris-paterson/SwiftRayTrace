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
    
    func test2x2Determinant() {
        let m = Matrix([
            [1, 5],
            [-3, 2]
        ])
        XCTAssert(m.det() == 17)
    }
    
    func test3x3SubMatIs2x2() {
        let m1 = Matrix([
            [1, 5, 0],
            [-3, 2, 7],
            [0, 6, -3]
        ])
        
        let m2 = Matrix([
            [-3, 2],
            [0, 6]
        ])
        
        XCTAssert(m1.subMatrix(row: 0, col: 2) == m2)
    }
    
    func test4x4SubMatIs3x3() {
        let m1 = Matrix([
            [-6, 1, 1, 6],
            [-8, 5, 8, 6],
            [-1, 0, 8, 2],
            [-7, 1, -1, 1],
        ])
        
        let m2 = Matrix([
            [-6, 1, 6],
            [-8, 8, 6],
            [-7, -1, 1],
        ])
        
        XCTAssert(m1.subMatrix(row: 2, col: 1) == m2)
    }
    
    func testMinor3x3() {
        let m1 = Matrix([
            [3, 5, 0],
            [2, -1, -7],
            [6, -1, 5]
        ])
        
        let m2 = m1.subMatrix(row: 1, col: 0)
        
        XCTAssert(m2.det() == 25)
        XCTAssert(m1.minor(row: 1, col: 0) == 25)
    }
    
    func testCofactor3x3() {
        let m1 = Matrix([
            [3, 5, 0],
            [2, -1, -7],
            [6, -1, 5]
        ])
        
        XCTAssert(m1.minor(row: 0, col: 0) == -12)
        XCTAssert(m1.cofactor(row: 0, col: 0) == -12)
        XCTAssert(m1.minor(row: 1, col: 0) == 25)
        XCTAssert(m1.cofactor(row: 1, col: 0) == -25)
    }

    func testDet3x3() {
        let m1 = Matrix([
            [1, 2, 6],
            [-5, 8, -4],
            [2, 6, 4]
        ])
        
        XCTAssert(m1.cofactor(row: 0, col: 0) == 56)
        XCTAssert(m1.cofactor(row: 0, col: 1) == 12)
        XCTAssert(m1.cofactor(row: 0, col: 2) == -46)
        XCTAssert(m1.det() == -196)
    }
    
    func testDet4x4() {
        let m1 = Matrix([
            [ -2,-8, 3, 5],
            [ -3, 1, 7, 3],
            [  1, 2,-9, 6],
            [ -6, 7, 7,-9],
        ])
        
        XCTAssert(m1.cofactor(row: 0, col: 0) == 690)
        XCTAssert(m1.cofactor(row: 0, col: 1) == 447)
        XCTAssert(m1.cofactor(row: 0, col: 2) == 210)
        XCTAssert(m1.cofactor(row: 0, col: 3) == 51)
        XCTAssert(m1.det() == -4071)
    }
    
    func testInvertabilityMatForInvertability() {
        let m1 = Matrix([
            [6,  4,  4,  4],
            [5,  5,  7,  6],
            [4, -9,  3, -7],
            [9,  1,  7, -6],
        ])
        
        XCTAssert(m1.det() == -2120)
        XCTAssert(m1.isInvertable)
    }
    
    func testNonInvertabilityMatForInvertability() {
        let m1 = Matrix([
            [-4,  2, -2, -3],
            [ 9,  6,  2,  6],
            [ 0, -5,  1, -5],
            [ 0,  0,  0,  0],
        ])
        
        XCTAssert(m1.det() == 0)
        XCTAssert(!m1.isInvertable)
    }
    
    func testCalculateInverseOfMatix() {
        let m1 = Matrix([
            [-5,  2,  6, -8],
            [ 1, -5,  1,  8],
            [ 7,  7, -6, -7],
            [ 1, -3,  7,  4],
        ])
        
        let mInverse = m1.inverse()
        
        XCTAssert(m1.det() == 532)
        XCTAssert(m1.cofactor(row: 2, col: 3) == -160)
        XCTAssert(mInverse[3, 2] == -160 / 532)
        XCTAssert(m1.cofactor(row: 3, col: 2) == 105)
        XCTAssert(mInverse[2, 3] == 105 / 532)
        
        
        let expected =  Matrix([
            [ 0.21805,  0.45113,  0.24060, -0.04511],
            [-0.80827, -1.45677, -0.44361,  0.52068],
            [-0.07895, -0.22368, -0.05263,  0.19737],
            [-0.52256, -0.81391, -0.30075,  0.30639],
        ])
        
        XCTAssert(mInverse == expected)
    }
    
    func testCalculateInverse2() {
        let m1 = Matrix([
            [ 8, -5,  9,  2],
            [ 7,  5,  6,  1],
            [-6,  0,  9,  6],
            [-3,  0, -9, -4],
        ])
        
        let mInverse = m1.inverse()
        let expected =  Matrix([
            [-0.15385, -0.15385, -0.28205, -0.53846],
            [-0.07692,  0.12308,  0.02564,  0.03077],
            [ 0.35897,  0.35897,  0.43590,  0.92308],
            [-0.69231, -0.69231, -0.76923, -1.92308],
        ])
        
        XCTAssert(mInverse == expected)
    }
    
    func testCalculateInvers3() {
        let m1 = Matrix([
            [ 9,  3,  0,  9],
            [-5, -2, -6, -3],
            [-4,  9,  6,  4],
            [-7,  6,  6,  2],
        ])
        
        let mInverse = m1.inverse()
        let expected =  Matrix([
            [-0.04074, -0.07778,  0.14444, -0.22222],
            [-0.07778,  0.03333,  0.36667, -0.33333],
            [-0.02901, -0.14630, -0.10926,  0.12963],
            [ 0.17778,  0.06667, -0.26667,  0.33333],
        ])
        
        XCTAssert(mInverse == expected)
    }
    
    func testCalculateInvers4() {
        let m1 = Matrix([
            [ 8,  2,  2,  2],
            [ 3, -1 ,  7,  0],
            [ 7,  0,  5,  4],
            [ 6, -2,  0,  5],
            ])
        
        let expected = Matrix([
            [0.214286, 0.142857,  -0.285714, 0.142857],
            [-0.00529101,  -0.312169,  0.439153, -0.349206],
            [-0.0925926, 0.037037, 0.185185,  -0.111111],
            [ -0.259259,  -0.296296, 0.518519,  -0.111111],
            ])
        
        XCTAssert(m1.inverse() == expected)
    }
    
    
    
    func testMultiplyByInverse() {
        let m1 = Matrix([
            [ 3, -9,  7,  3],
            [ 3, -8,  2, -9],
            [-4,  4,  4,  1],
            [-6,  5, -1,  1],
        ])
        
        let m2 = Matrix([
            [ 8,  2,  2,  2],
            [ 3, -1 ,  7,  0],
            [ 7,  0,  5,  4],
            [ 6, -2,  0,  5],
            ])
        
        let c = m1 * m2
        let res = c * m2.inverse()
        
        XCTAssert(res == m1)
    }
}
