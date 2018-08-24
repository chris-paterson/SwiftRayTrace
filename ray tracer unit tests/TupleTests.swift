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

    func testTupleWithW1IsPoint() {
        let a = Tuple(x: 4.3, y: -4.2, z: 3.1, w: 1.0)
        
        XCTAssert(a.x == 4.3)
        XCTAssert(a.y == -4.2)
        XCTAssert(a.z == 3.1)
        XCTAssert(a.w == 1.0)
        
//        let point: Point = a as! Point
//
//        XCTAssert(point is Point)
//        XCTAssert(!(point is Vector))
//        XCTAssert(point.w == 1.0)
    }
    
    func testTupleWithW0IsVector() {
        let a = Tuple(x: 4.3, y: -4.2, z: 3.1, w: 0.0)
        
        XCTAssert(a.x == 4.3)
        XCTAssert(a.y == -4.2)
        XCTAssert(a.z == 3.1)
        XCTAssert(a.w == 0.0)
        
//        let point = a as! Vector
//
//        XCTAssert(point is Vector)
//        XCTAssert(!(point is Point))
//        XCTAssert(point.w == 0.0)
    }
    
    func testPointDescribesTupleWithW1() {
        let p = Point(x: 4, y: -4, z: 3)
        let t = p as Tuple
        
        XCTAssert(t.w == 1.0)
    }
    
    func testVectorDescribesTupleWithW0() {
        let v = Vector(x: 4, y: -4, z: 3)
        let t = v as Tuple
        
        XCTAssert(t.w == 0.0)
    }
    
    func testAddingTwoTuples() {
        let t1 = Tuple(x: 3, y: -2, z: 5, w: 1)
        let t2 = Tuple(x: -2, y: 3, z: 1, w: 0)
        let result = t1 + t2
        
        XCTAssert(result == Tuple(x: 1, y: 1, z: 6, w: 1))
    }

    func testSubtractTwoPoints() {
        let p1 = Point(x: 3, y: 2, z: 1)
        let p2 = Point(x: 5, y: 6, z: 7)
        let result = p1 - p2
        
        XCTAssert(result == Vector(x: -2, y: -4, z: -6))
    }
    
    func testSubtractVectorFromPoint() {
        let p = Point(x: 3, y: 2, z: 1)
        let v = Vector(x: 5, y: 6, z: 7)
        let result = p - v
        
        XCTAssert(result == Point(x: -2, y: -4, z: -6))
    }
    
    func testSubtractTwoVectors() {
        let v1 = Vector(x: 3, y: 2, z: 1)
        let v2 = Vector(x: 5, y: 6, z: 7)
        let result = v1 - v2
        
        XCTAssert(result == Vector(x: -2, y: -4, z: -6))
    }
    
    func testSubtractVectorFromZeroVector() {
        let v0 = Vector(x: 0, y: 0, z: 0)
        let v = Vector(x: 1, y: 2, z: 3)
        let result = v0 - v
        
        XCTAssert(result == Vector(x: -1, y: -2, z: -3))
    }
    
    func testNegateTuple() {
        let t = Tuple(x: 1, y: -2, z: 3, w: 4)
        
        XCTAssert(-t == Tuple(x: -1, y: 2, z: -3, w: -4))
    }
    
    func testMultiplyTupleByScalar() {
        let t = Tuple(x: 1, y: -2, z: 3, w: -4)
        let result = t * 3.5
        
        XCTAssert(result == Tuple(x: 3.5, y: -7, z: 10.5, w: -14))
    }
    
    func testMultiplyTupleByFraction() {
        let t = Tuple(x: 1, y: -2, z: 3, w: -4)
        let result = t * 0.5
        
        XCTAssert(result == Tuple(x: 0.5, y: -1, z: 1.5, w: -2))
    }
    
    func testDivideByScalar() {
        let t = Tuple(x: 1, y: -2, z: 3, w: -4)
        let result = t / 2
        
        XCTAssert(result == Tuple(x: 0.5, y: -1, z: 1.5, w: -2))
    }
    
    func testMagnitudeOfVector100() {
        let v = Vector(x: 1, y: 0, z: 0)
        
        XCTAssert(v.magnitude == 1)
    }
    
    func testMagnitudeOfVector010() {
        let v = Vector(x: 0, y: 1, z: 0)
        
        XCTAssert(v.magnitude == 1)
    }
    
    func testMagnitudeOfVector001() {
        let v = Vector(x: 0, y: 0, z: 1)
        
        XCTAssert(v.magnitude == 1)
    }
    
    func testMagnitudeOfPositivefVector() {
        let v = Vector(x: 1, y: 2, z: 3)
        
        XCTAssert(v.magnitude == sqrt(14))
    }
    
    func testMagnitudeOfNegativeVector() {
        let v = Vector(x: -1, y: -2, z: -3)
        
        XCTAssert(v.magnitude == sqrt(14))
    }
    
    func testNormalizeVector01() {
        let v = Vector(x: 4, y: 0, z: 0)
        let result = v.normalize()
        
        XCTAssert(result == Vector(x: 1, y: 0, z: 0))
    }
    
    func testNormalizeVector02() {
        let v = Vector(x: 1, y: 2, z: 3)
        let result = v.normalize()
        
        //                            1/√14,      2/√14,      3/√14
        XCTAssert(result == Vector(x: 0.26726, y: 0.53452, z: 0.80178))
    }
    
    func testDotProductTwoVectors() {
        let v1 = Vector(x: 1, y: 2, z: 3)
        let v2 = Vector(x: 2, y: 3, z: 4)
        let result = v1.dot(v2)
        
        XCTAssert(result == 20)
    }
    
    func testCrossProductTwoVectors() {
        let v1 = Vector(x: 1, y: 2, z: 3)
        let v2 = Vector(x: 2, y: 3, z: 4)
        
        let result1 = v1.cross(v2)
        let result2 = v2.cross(v1)
        
        XCTAssert(result1 == Vector(x: -1, y: 2, z: -1))
        XCTAssert(result2 == Vector(x: 1, y: -2, z: 1))
    }
    
    func testColorsAreTuples() {
        let c = Color(r: -0.5, g: 0.4, b: 1.7)
        
        XCTAssert(c.r == -0.5)
        XCTAssert(c.g == 0.4)
        XCTAssert(c.b == 1.7)
    }
    
    func testAddColors() {
        let c1 = Color(r: 0.9, g: 0.6, b: 0.75)
        let c2 = Color(r: 0.7, g: 0.1, b: 0.25)
        let result = c1 + c2
        
        XCTAssert(result == Color(r: 1.6, g: 0.7, b: 1.0))
    }
    
    func testMultiplyColors() {
        let c1 = Color(r: 1.0, g: 0.2, b: 0.4)
        let c2 = Color(r: 0.9, g: 1.0, b: 0.1)
        let result = c1 * c2
        
        XCTAssert(result == Color(r: 0.9, g: 0.2, b: 0.04))
    }
}
