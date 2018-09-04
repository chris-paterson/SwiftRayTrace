//
//  Ray.swift
//  ray tracer
//
//  Created by Christopher Paterson on 03/09/2018.
//  Copyright © 2018 Christopher Paterson. All rights reserved.
//

import Foundation

class Ray {
    let origin: Point
    let direction: Vector
    
    init(origin: Point, direction: Vector) {
        self.origin = origin
        self.direction = direction
    }
    
    public func position(atTime time: Float) -> Point {
        return origin + direction * time
    }
    
    public func intersects(sphere s: Sphere) -> [Float] {
        let sphereToRay = origin - Point(x: 0, y: 0, z: 0)
        let a = direction.dot(direction)
        let b = 2 * direction.dot(sphereToRay)
        let c = sphereToRay.dot(sphereToRay) - 1
        let discriminant = b * b - 4 * a * c
        
        // No intersection if discriminant is < 0
        if discriminant < 0 {
            return []
        }
        
        let t1 = (-b - sqrt(discriminant)) / (2 * a)
        let t2 = (-b + sqrt(discriminant)) / (2 * a)
        
        var intersections: [Float] = [t1, t2]
        intersections.sort()
        
        return intersections
    }
}
