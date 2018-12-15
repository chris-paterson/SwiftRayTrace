//
//  MaterialTests.swift
//  ray tracer unit tests
//
//  Created by Chris Paterson on 2018-12-11.
//  Copyright © 2018 Christopher Paterson. All rights reserved.
//

import XCTest

class MaterialTest: XCTestCase {
    
    func testDefaultMaterial() {
        let m = Material()
        XCTAssert(m.color == Color(r: 1, g: 1, b: 1))
        XCTAssert(m.ambient == 0.1)
        XCTAssert(m.diffuse == 0.9)
        XCTAssert(m.shininess == 200)
    }
    
    func testLightingWithEyeBetweenSurfaceAndLight() {
        let m = Material()
        let position = Point(x: 0, y: 0, z: 0)
        let eyev = Vector(x: 0, y: 0, z: -1)
        let normal = Vector(x: 0, y: 0, z: -1)
        let light = Light(position: Point(x: 0, y: 0, z: -10), intensity: Color(r: 1, g: 1, b: 1))
        
        let result = Light.lighting(m: m, light: light, position: position, eyev: eyev, normal: normal)
        
        XCTAssert(result == Color(r: 1.9, g: 1.9, b: 1.9))
    }
    
    func testLightingWithEyeBetweenSurfaceAndLightAt45Deg() {
        let m = Material()
        let position = Point(x: 0, y: 0, z: 0)
        let eyev = Vector(x: 0, y: sqrt(2)/2, z: -sqrt(2)/2)
        let normal = Vector(x: 0, y: 0, z: -1)
        let light = Light(position: Point(x: 0, y: 0, z: -10), intensity: Color(r: 1, g: 1, b: 1))
        
        let result = Light.lighting(m: m, light: light, position: position, eyev: eyev, normal: normal)
        
        XCTAssert(result == Color(r: 1.0, g: 1.0, b: 1.0))
    }
    
    func testLightWithEyeOppositeSurfaceLightOffset45Deg() {
        let m = Material()
        let position = Point(x: 0, y: 0, z: 0)
        let eyev = Vector(x: 0, y: 0, z: -1)
        let normal = Vector(x: 0, y: 0, z: -1)
        let light = Light(position: Point(x: 0, y: 10, z: -10), intensity: Color(r: 1, g: 1, b: 1))
        
        let result = Light.lighting(m: m, light: light, position: position, eyev: eyev, normal: normal)
        
        XCTAssert(result == Color(r: 0.7364, g: 0.7364, b: 0.7364))
    }
    
    func testLightWithEyeInPathOfReflectionVector() {
        let m = Material()
        let position = Point(x: 0, y: 0, z: 0)
        let eyev = Vector(x: 0, y: -sqrt(2)/2, z: -sqrt(2)/2)
        let normal = Vector(x: 0, y: 0, z: -1)
        let light = Light(position: Point(x: 0, y: 10, z: -10), intensity: Color(r: 1, g: 1, b: 1))
        
        let result = Light.lighting(m: m, light: light, position: position, eyev: eyev, normal: normal)
        
        XCTAssert(result == Color(r: 1.6364, g: 1.6364, b: 1.6364))
    }
    
    func testLightBehindSurface() {
        let m = Material()
        let position = Point(x: 0, y: 0, z: 0)
        let eyev = Vector(x: 0, y: 0, z: -1)
        let normal = Vector(x: 0, y: 0, z: -1)
        let light = Light(position: Point(x: 0, y: 0, z: 10), intensity: Color(r: 1, g: 1, b: 1))
        
        let result = Light.lighting(m: m, light: light, position: position, eyev: eyev, normal: normal)
        
        XCTAssert(result == Color(r: 0.1, g: 0.1, b: 0.1))
    }
}
