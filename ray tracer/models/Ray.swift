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
    
    public func intersects(sphere s: Sphere) -> [Intersection] {
        let translatedRay = self * s.transform.inverse()
        let sphereToRay = translatedRay.origin - Point(x: 0, y: 0, z: 0)
        let a = translatedRay.direction.dot(translatedRay.direction)
        let b = 2 * translatedRay.direction.dot(sphereToRay)
        let c = sphereToRay.dot(sphereToRay) - 1
        let discriminant = b * b - 4 * a * c
        
        // No intersection if discriminant is < 0
        if discriminant < 0 {
            return []
        }
        
        let t1 = (-b - sqrt(discriminant)) / (2 * a)
        let t2 = (-b + sqrt(discriminant)) / (2 * a)
        
        let intersection1 = Intersection(t: t1, object: s)
        let intersection2 = Intersection(t: t2, object: s)
        
        var intersections: [Intersection] = [intersection1, intersection2]
        intersections.sort { $0.t < $1.t }
        
        return intersections
    }
    
    public static func hit(intersections: [Intersection]) -> Intersection? {
        let positiveIntersections = intersections.filter { $0.t > 0 }
        guard positiveIntersections.count > 0 else { return nil }
        return positiveIntersections.min { $0.t < $1.t }
    }
    
    public static func *(lhs: Ray, rhs: Matrix) -> Ray {
        let newOrigin = Point(tuple: lhs.origin * rhs)
        let newDirection = Vector(tuple: lhs.direction * rhs)
        return Ray(origin: newOrigin, direction: newDirection)
    }
    
    public static func *(lhs: Matrix, rhs: Ray) -> Ray {
        return rhs * lhs
    }
}
