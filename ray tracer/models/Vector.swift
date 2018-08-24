//
//  Vector.swift
//  ray tracer
//
//  Created by Christopher Paterson on 22/08/2018.
//  Copyright © 2018 Christopher Paterson. All rights reserved.
//

import Foundation

class Vector: Tuple {
    var magnitude: Float {
        get {
            return sqrt(x*x + y*y + z*z)
        }
    }
    
    init(x: Float, y: Float, z: Float) {
        super.init(x: x, y: y, z: z, w: 0.0)
    }
    
    override init(x: Float, y: Float, z: Float, w: Float) {
        super.init(x: x, y: y, z: z, w: w)
    }
    
    static func -(lhs: Vector, rhs: Vector) -> Vector {
        return Vector(x: lhs.x - rhs.x,
                      y: lhs.y - rhs.y,
                      z: lhs.z - rhs.z,
                      w: lhs.w - rhs.w)
    }
    
    static func +(lhs: Vector, rhs: Vector) -> Vector {
        return Vector(x: lhs.x + rhs.x,
                      y: lhs.y + rhs.y,
                      z: lhs.z + rhs.z,
                      w: lhs.w + rhs.w)
    }
    
    func normalize() -> Vector {
        return Vector(x: x / magnitude,
                     y: y / magnitude,
                     z: z / magnitude,
                     w: w / magnitude)
    }
    
    func dot(_ v: Vector) -> Float {
        return (x * v.x +
            y*v.y +
            z * v.z +
            w * v.w)
    }
    
    func cross(_ v: Vector) -> Vector {
        return Vector(x: y * v.z - z * v.y,
                      y: z * v.x - x * v.z,
                      z: x * v.y - y * v.x)
    }
}
