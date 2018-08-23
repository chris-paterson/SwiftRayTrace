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
        
        let point = a.tupleFactory()
        
        XCTAssert(point is Point)
        XCTAssert(!(point is Vector))
        XCTAssert(point.w == 1.0)
    }
    
    func testTupleWithW0IsVector() {
        let a = Tuple(x: 4.3, y: -4.2, z: 3.1, w: 0.0)
        
        XCTAssert(a.x == 4.3)
        XCTAssert(a.y == -4.2)
        XCTAssert(a.z == 3.1)
        XCTAssert(a.w == 0.0)
        
        let point = a.tupleFactory()
        
        XCTAssert(point is Vector)
        XCTAssert(!(point is Point))
        XCTAssert(point.w == 0.0)
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
        
        XCTAssert(result is Vector)
        XCTAssert(result == Vector(x: -2, y: -4, z: -6))
    }
    
    func testSubtractVectorFromPoint() {
        let p = Point(x: 3, y: 2, z: 1)
        let v = Vector(x: 5, y: 6, z: 7)
        let result = p - v
        
        XCTAssert(result is Point)
        XCTAssert(result == Point(x: -2, y: -4, z: -6))
    }
    
    func testSubtractTwoVectors() {
        let v1 = Vector(x: 3, y: 2, z: 1)
        let v2 = Vector(x: 5, y: 6, z: 7)
        let result = v1 - v2
        
        XCTAssert(result is Vector)
        XCTAssert(result == Vector(x: -2, y: -4, z: -6))
    }
    
    func testSubtractVectorFromZeroVector() {
        let v0 = Vector(x: 0, y: 0, z: 0)
        let v = Vector(x: 1, y: 2, z: 3)
        let result = v0 - v
        
        XCTAssert(result is Vector)
        XCTAssert(result == Vector(x: -1, y: -2, z: -3))
    }
    
    func testNegateTuple() {
        let t = Tuple(x: 1, y: -2, z: 3, w: 4)
        
        XCTAssert(-t == Tuple(x: -1, y: 2, z: -3, w: -4))
    }
}
