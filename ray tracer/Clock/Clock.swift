//
//  Clock.swift
//  ray tracer
//
//  Created by Chris Paterson on 2018-08-29.
//  Copyright © 2018 Christopher Paterson. All rights reserved.
//

class Clock {
    let width = 64
    let height = 64
    let radius = 16
    
    let origin: Point
    
    init(hour: Int) {
        let canvas = Canvas(width: 64, height: 64)
        self.origin = Point(x: 0, y: 0, z: 0)
        drawFace()
        
    }
    
    fileprivate func drawFace() {
        let _12 = Point(x: 0, y: 1, z: 0)
        
        for i in 0..<12 {
            let r = Transform.rotateY(Float(i) * (.pi / 6))
            let point = r * _12 * Float(radius)
            print(point.x, point.y)
        }
    }
}
