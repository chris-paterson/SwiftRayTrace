//
//  Light.swift
//  ray tracer
//
//  Created by Chris Paterson on 2018-12-11.
//  Copyright © 2018 Christopher Paterson. All rights reserved.
//

class Light {
    let position: Point
    let intensity: Color
    
    init(position: Point, intensity: Color) {
        self.position = position
        self.intensity = intensity
    }
}
