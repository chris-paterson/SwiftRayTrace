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
        let i = Intersection(t: 3.5, object: s)
        
        XCTAssert(i.t == 3.5)
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
        XCTAssert(xs[0].object == s)
        XCTAssert(xs[1].object == s)
    }
    
    func testHitWhenAllPositive() {
        let s = Sphere()
        let i1 = Intersection(t: 1, object: s)
        let i2 = Intersection(t: 2, object: s)
        let xs = [i2, i1]
        
        let h = Ray.hit(intersections: xs)
        
        XCTAssert(h! == i1)
    }
    
    func testHitWhenOneNegative() {
        let s = Sphere()
        let i1 = Intersection(t: -1, object: s)
        let i2 = Intersection(t: 1, object: s)
        let xs = [i2, i1]
        
        let h = Ray.hit(intersections: xs)
        
        XCTAssert(h! == i2)
    }
    
    func testHitWhenAllNegative() {
        let s = Sphere()
        let i1 = Intersection(t: -2, object: s)
        let i2 = Intersection(t: -1, object: s)
        let xs = [i2, i1]
        
        let h = Ray.hit(intersections: xs)
        
        XCTAssert(h == nil)
    }
    
    func testHitLowestNonNegative() {
        let s = Sphere()
        let i1 = Intersection(t: 5, object: s)
        let i2 = Intersection(t: 7, object: s)
        let i3 = Intersection(t: -3, object: s)
        let i4 = Intersection(t: 2, object: s)
        let xs = [i1, i2, i3, i4]
        
        let h = Ray.hit(intersections: xs)
        
        XCTAssert(h! == i4)
    }

}
