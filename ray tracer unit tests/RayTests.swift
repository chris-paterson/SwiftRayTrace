//
//  RayTests.swift
//  ray tracer unit tests
//
//  Created by Christopher Paterson on 03/09/2018.
//  Copyright © 2018 Christopher Paterson. All rights reserved.
//

import XCTest

class RayTests: XCTestCase {

    func testCreateAndQueryRay() {
        let origin = Point(x: 1, y: 2, z: 3)
        let direction = Vector(x: 4, y: 5, z: 6)
        let r = Ray(origin: origin, direction: direction)
        
        XCTAssert(r.origin == origin)
        XCTAssert(r.direction == direction)
    }
    
    func testComputePointFromDistance() {
        let r = Ray(origin: Point(x: 2, y: 3, z: 4), direction: Vector(x: 1, y: 0, z: 0))
        
        XCTAssert(r.position(atTime: 0) == Point(x: 2, y: 3, z: 4))
        XCTAssert(r.position(atTime: 1) == Point(x: 3, y: 3, z: 4))
        XCTAssert(r.position(atTime: -1) == Point(x: 1, y: 3, z: 4))
        XCTAssert(r.position(atTime: 2.5) == Point(x: 4.5, y: 3, z: 4))
    }

}
