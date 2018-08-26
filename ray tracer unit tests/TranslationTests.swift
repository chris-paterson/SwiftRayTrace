//
//  TranslationTests.swift
//  ray tracer unit tests
//
//  Created by Christopher Paterson on 26/08/2018.
//  Copyright © 2018 Christopher Paterson. All rights reserved.
//

import XCTest

class TranslationTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testMultiplyByTranslationMatrix() {
        let t = Transform.transform(x: 5, y: -3, z: 2)
        let p = Point(x: -3, y: 4, z: 5)

        XCTAssert(t * p == Point(x: 2, y: 1, z: 7))
    }

    func testTranslationInverseMultiplication() {
        let t = Transform.transform(x: 5, y: -3, z: 2)
        let tInverse = t.inverse()
        let p = Point(x: -3, y: 4, z: 5)

        XCTAssert(tInverse * p == Point(x: -8, y: 7, z: 3))
    }

    func testTranslationDoesNotAffectVectors() {
        let t = Transform.transform(x: 5, y: -3, z: 2)
        let v = Vector(x: -3, y: 4, z: 5)
        XCTAssert(t * v == v)
    }
    
    func testScalePoints() {
        let t = Transform.scale(x: 2, y: 3, z: 4)
        let p = Point(x: -4, y: 6, z: 8)
        
        XCTAssert(t * p == Point(x: -8, y: 18, z: 32))
    }
    
    func testScaleAppliesToVector() {
        let t = Transform.scale(x: 2, y: 3, z: 4)
        let v = Vector(x: -4, y: 6, z: 8)
        XCTAssert(v * t == Vector(x: -8, y: 18, z: 32))
    }
    
    func testInverseScale() {
        let t = Transform.scale(x: 2, y: 3, z: 4)
        let tInverse = t.inverse()
        let v = Vector(x: -4, y: 6, z: 8)
        
        XCTAssert(tInverse * v == Vector(x: -2, y: 2, z: 2))
    }
    
    func testReflectionIsScalingByNegativeValue() {
        let t = Transform.scale(x: -1, y: -1, z: 1)
        let p = Point(x: 2, y: -3, z: 4)
        
        XCTAssert(t * p == Point(x: -2, y: 3, z: 4))
    }

}
