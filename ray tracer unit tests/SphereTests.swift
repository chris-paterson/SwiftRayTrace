//
//  SphereTests.swift
//  ray tracer unit tests
//
//  Created by Christopher Paterson on 03/09/2018.
//  Copyright © 2018 Christopher Paterson. All rights reserved.
//

import XCTest

class SphereTests: XCTestCase {

    func testRayIntersectsAtTwoPoints() {
        let r = Ray(origin: Point(x: 0, y: 0, z: -5), direction: Vector(x: 0, y: 0, z: 1))
        let s = Sphere()
        
        let xs = r.intersects(sphere: s)
        XCTAssert(xs.count == 2)
        XCTAssert(xs[0] == 4)
        XCTAssert(xs[1] == 6)
    }
    
    func testRayIntersectsAtTangent() {
        let r = Ray(origin: Point(x: 0, y: 1, z: -5), direction: Vector(x: 0, y: 0, z: 1))
        let s = Sphere()
        
        let xs = r.intersects(sphere: s)
        XCTAssert(xs.count == 2)
        XCTAssert(xs[0] == 5)
        XCTAssert(xs[1] == 5)
    }

    func testRayMisses()  {
        let r = Ray(origin: Point(x: 0, y: 2, z: -5), direction: Vector(x: 0, y: 0, z: 1))
        let s = Sphere()
        
        let xs = r.intersects(sphere: s)
        XCTAssert(xs.count == 0)
    }
    
    func testRayOrigintesInside()  {
        let r = Ray(origin: Point(x: 0, y: 0, z: 0), direction: Vector(x: 0, y: 0, z: 1))
        let s = Sphere()
        
        let xs = r.intersects(sphere: s)
        XCTAssert(xs.count == 2)
        XCTAssert(xs[0] == -1)
        XCTAssert(xs[1] == 1)
    }
    
    func testSphereBehindRay()  {
        let r = Ray(origin: Point(x: 0, y: 0, z: 5), direction: Vector(x: 0, y: 0, z: 1))
        let s = Sphere()
        
        let xs = r.intersects(sphere: s)
        XCTAssert(xs.count == 2)
        XCTAssert(xs[0] == -6)
        XCTAssert(xs[1] == -4)
    }
}
