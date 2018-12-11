//
//  LightTests.swift
//  ray tracer unit tests
//
//  Created by Chris Paterson on 2018-12-11.
//  Copyright © 2018 Christopher Paterson. All rights reserved.
//

import XCTest

class LightTests: XCTestCase {
    
    func testPointLightHasPositionAndIntensity() {
        let intensity = Color(r: 1, g: 1, b: 1)
        let position = Point(x: 0, y: 0, z: 0)
        let light = Light(position: position, intensity: intensity)
        
        XCTAssert(light.position == position)
        XCTAssert(light.intensity == intensity)
    }
}
