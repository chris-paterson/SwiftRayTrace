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
        let t = Transform.translate(x: 5, y: -3, z: 2)
        let p = Point(x: -3, y: 4, z: 5)
        XCTAssert(t * p == Point(x: 2, y: 1, z: 7))
    }

    func testTranslationInverseMultiplication() {
        let t = Transform.translate(x: 5, y: -3, z: 2)
        let tInverse = t.inverse()
        let p = Point(x: -3, y: 4, z: 5)

        XCTAssert(tInverse * p == Point(x: -8, y: 7, z: 3))
    }

    func testTranslationDoesNotAffectVectors() {
        let t = Transform.translate(x: 5, y: -3, z: 2)
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
    
    
    func testRotatePointAroundXAxis() {
        let p = Point(x: 0, y: 1, z: 0)
        let halfQuater = Transform.rotateX(.pi / 4)
        let fullQuater = Transform.rotateX(.pi / 2)
        
        XCTAssert(halfQuater * p == Point(x: 0, y: sqrt(2)/2, z: sqrt(2)/2))
        XCTAssert(fullQuater * p == Point(x: 0, y: 0, z: 1))
    }

    func testRotateInverseRotatesOppositeDirection() {
        let p = Point(x: 0, y: 1, z: 0)
        let halfQuater = Transform.rotateX(.pi / 4)
        let invHalfQuater = halfQuater.inverse()
        XCTAssert(invHalfQuater * p == Point(x: 0, y: sqrt(2)/2, z: -sqrt(2)/2))
    }
    
    func testRotatePointAroundYAxis() {
        let p = Point(x: 0, y: 0, z: 1)
        let halfQuater = Transform.rotateY(.pi / 4)
        let fullQuater = Transform.rotateY(.pi / 2)
        
        XCTAssert(halfQuater * p == Point(x: sqrt(2)/2, y: 0, z: sqrt(2)/2))
        XCTAssert(fullQuater * p == Point(x: 1, y: 0, z: 0))
    }
    
    func testRotatePointAroundZAxis() {
        let p = Point(x: 0, y: 1, z: 0)
        let halfQuater = Transform.rotateZ(.pi / 4)
        let fullQuater = Transform.rotateZ(.pi / 2)
        
        XCTAssert(halfQuater * p == Point(x: -sqrt(2)/2, y: sqrt(2)/2, z: 0))
        XCTAssert(fullQuater * p == Point(x: -1, y: 0, z: 0))
    }
    
    func testShearMovesXProportionalToY() {
        let t = Transform.shear(xy: 1, xz: 0, yx: 0, yz: 0, zx: 0, zy: 0)
        let p = Point(x: 2, y: 3, z: 4)
        
        XCTAssert(p * t == Point(x: 5, y: 3, z: 4))
    }
    
    func testShearMovesXProportionalToZ() {
        let t = Transform.shear(xy: 0, xz: 1, yx: 0, yz: 0, zx: 0, zy: 0)
        let p = Point(x: 2, y: 3, z: 4)
        
        XCTAssert(p * t == Point(x: 6, y: 3, z: 4))
    }
    
    func testShearMovesYProportionalToX() {
        let t = Transform.shear(xy: 0, xz: 0, yx: 1, yz: 0, zx: 0, zy: 0)
        let p = Point(x: 2, y: 3, z: 4)
        
        XCTAssert(p * t == Point(x: 2, y: 5, z: 4))
    }
    
    func testShearMovesYProportionalToZ() {
        let t = Transform.shear(xy: 0, xz: 0, yx: 0, yz: 1, zx: 0, zy: 0)
        let p = Point(x: 2, y: 3, z: 4)
        
        XCTAssert(p * t == Point(x: 2, y: 7, z: 4))
    }
    
    func testShearMovesZProportionalToX() {
        let t = Transform.shear(xy: 0, xz: 0, yx: 0, yz: 0, zx: 1, zy: 0)
        let p = Point(x: 2, y: 3, z: 4)
        
        XCTAssert(p * t == Point(x: 2, y: 3, z: 6))
    }
    
    func testShearMovesZProportionalToY() {
        let t = Transform.shear(xy: 0, xz: 0, yx: 0, yz: 0, zx: 0, zy: 1)
        let p = Point(x: 2, y: 3, z: 4)
        
        XCTAssert(p * t == Point(x: 2, y: 3, z: 7))
    }
    
    func testIndividualTransforsAppliedInSequence() {
        let p = Point(x: 1, y: 0, z: 1)
        let a = Transform.rotateX(.pi / 2)
        let b = Transform.scale(x: 5, y: 5, z: 5)
        let c = Transform.translate(x: 10, y: 5, z: 7)
        
        let p2 = a * p
        XCTAssert(p2 == Point(x: 1, y: -1, z: 0))
        
        let p3 = b * p2
        XCTAssert(p3 == Point(x: 5, y: -5, z: 0))
        
        let p4 = c * p3
        XCTAssert(p4 == Point(x: 15, y: 0, z: 7))
    }
    
    func testIndividualTransforsAppliedInReverseOrder() {
        let p = Point(x: 1, y: 0, z: 1)
        let a = Transform.rotateX(.pi / 2)
        let b = Transform.scale(x: 5, y: 5, z: 5)
        let c = Transform.translate(x: 10, y: 5, z: 7)
        
        let t = c * b * a
        let p2 = p * t
        XCTAssert(p2 == Point(x: 15, y: 0, z: 7))
    }
}
