//
//  IntersectionTests.swift
//  ray tracer unit tests
//
//  Created by Christopher Paterson on 04/09/2018.
//  Copyright © 2018 Christopher Paterson. All rights reserved.
//

import XCTest

class IntersectionTests: XCTestCase {

    func testIntersectionHasTandObject() {
        let s = Sphere()
        let i = Intersection(t: 2.5, object: s)
        
        XCTAssert(i.t == 2.5)
        XCTAssert(i.object == s)
    }
    
    func testIntersectionAggregation() {
        let s = Sphere()
        let i1 = Intersection(t: 1, object: s)
        let i2 = Intersection(t: 2, object: s)
        
        let xs = [i1, i2]
        
        XCTAssert(xs.count == 2)
        XCTAssert(xs[0].t == 1)
        XCTAssert(xs[1].t == 2)
    }
    
    func testIntersectSetsObjectOnIntersection() {
        let r = Ray(origin: Point(x: 0, y: 0, z: -5), direction: Vector(x: 0, y: 0, z: 1))
        let s = Sphere()
        
        let xs = r.intersects(sphere: s)
        XCTAssert(xs.count == 2)
        XCTAssert(xs[0].t == 4)
        XCTAssert(xs[1].t == 6)
        XCTAssert(xs[1].object == s)
        XCTAssert(xs[1].object == s)
    }

}
