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
        XCTAssert(xs[0].t == 4)
        XCTAssert(xs[1].t == 6)
    }
    
    func testRayIntersectsAtTangent() {
        let r = Ray(origin: Point(x: 0, y: 1, z: -5), direction: Vector(x: 0, y: 0, z: 1))
        let s = Sphere()
        
        let xs = r.intersects(sphere: s)
        XCTAssert(xs.count == 2)
        XCTAssert(xs[0].t == 5)
        XCTAssert(xs[1].t == 5)
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
        XCTAssert(xs[0].t == -1)
        XCTAssert(xs[1].t == 1)
    }
    
    func testSphereBehindRay()  {
        let r = Ray(origin: Point(x: 0, y: 0, z: 5), direction: Vector(x: 0, y: 0, z: 1))
        let s = Sphere()
        
        let xs = r.intersects(sphere: s)
        XCTAssert(xs.count == 2)
        XCTAssert(xs[0].t == -6)
        XCTAssert(xs[1].t == -4)
    }
    
    func testSphereDefaultTransformation() {
        let s = Sphere()
        XCTAssert(s.transform == Matrix.identity)
    }
    
    func testChangeSphereTransormation() {
        let s = Sphere()
        let t = Transform.translate(x: 2, y: 3, z: 4)
        s.transform = t
        
        XCTAssert(s.transform == t)
    }
    
    func testIntersectAScaledSphere() {
        let r = Ray(origin: Point(x: 0, y: 0, z: -5), direction: Vector(x: 0, y: 0, z: 1))
        let s = Sphere()
        s.transform = Transform.scale(x: 2, y: 2, z: 2)
        let xs = r.intersects(sphere: s)
        
        XCTAssert(xs.count == 2)
        XCTAssert(xs[0].t == 3)
        XCTAssert(xs[1].t == 7)
    }
    
    func testIntersectTranslatedSphere() {
        let r = Ray(origin: Point(x: 0, y: 0, z: -5), direction: Vector(x: 0, y: 0, z: 1))
        let s = Sphere()
        s.transform = Transform.translate(x: 5, y: 0, z: 0)
        let xs = r.intersects(sphere: s)
        
        XCTAssert(xs.count == 0)
    }
    
    func testNormalAtPointOnXAxis() {
        let s = Sphere()
        let n = s.normalAt(point: Point(x: 1, y: 0, z: 0))
        
        XCTAssert(n == Vector(x: 1, y: 0, z: 0))
    }
    
    func testNormalAtPointOnYAxis() {
        let s = Sphere()
        let n = s.normalAt(point: Point(x: 0, y: 1, z: 0))
        
        XCTAssert(n == Vector(x: 0, y: 1, z: 0))
    }
    
    func testNormalAtPointOnZAxis() {
        let s = Sphere()
        let n = s.normalAt(point: Point(x: 0, y: 0, z: 1))
        
        XCTAssert(n == Vector(x: 0, y: 0, z: 1))
    }
    
    func testNormalAtNonAxialPoint() {
        let s = Sphere()
        let n = s.normalAt(point: Point(x: sqrt(3)/3, y: sqrt(3)/3, z: sqrt(3)/3))
        
        XCTAssert(n == Vector(x: sqrt(3)/3, y: sqrt(3)/3, z: sqrt(3)/3))
    }
    
    func testNormalIsNormalizedVector() {
        let s = Sphere()
        let n = s.normalAt(point: Point(x: sqrt(3)/3, y: sqrt(3)/3, z: sqrt(3)/3))
        XCTAssert(n == n.normalize())
    }
}
