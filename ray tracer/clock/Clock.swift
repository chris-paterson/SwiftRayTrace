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
    
    let canvas: Canvas
    
    init() {
        self.canvas = Canvas(width: 64, height: 64)
        drawFace()
        canvas.save(fileName: "clock.ppm")
    }
    
    fileprivate func drawFace() {
        let _12 = Point(x: 0, y: -1, z: 0)
        let radsPerHourRot: Float = .pi / 6.0
        let origin = Point(x: Float(width / 2), y: Float(height / 2), z: 0)
        
        for i in 0..<12 {
            let r = Transform.rotateZ(Float(i) * radsPerHourRot)
            let point = origin + r * _12 * Float(radius)
            canvas[Int(point.x), Int(point.y)] = Color(r: 1, g: 0, b: 1)
        }
    }
}
