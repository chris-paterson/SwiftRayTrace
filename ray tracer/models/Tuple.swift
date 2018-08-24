//
//  Tuple.swift
//  ray tracer
//
//  Created by Christopher Paterson on 22/08/2018.
//  Copyright © 2018 Christopher Paterson. All rights reserved.
//

class Tuple {
    static let EPSILON: Float = 0.0001 // Threshold
    
    let x: Float
    let y: Float
    let z: Float
    let w: Float
    
    init(x: Float, y: Float, z: Float, w: Float) {
        self.x = x
        self.y = y
        self.z = z
        self.w = w
    }
    
    static func ==(lhs: Tuple, rhs: Tuple) -> Bool {
        return (lhs.x - rhs.x) < EPSILON &&
            abs(lhs.y - rhs.y) < EPSILON &&
            abs(lhs.z - rhs.z) < EPSILON &&
            abs(lhs.w - rhs.w) < EPSILON
    }
    
    static func +(lhs: Tuple, rhs: Tuple) -> Tuple {
        return Tuple(x: lhs.x + rhs.x,
                     y: lhs.y + rhs.y,
                     z: lhs.z + rhs.z,
                     w: lhs.w + rhs.w)
    }
    
    static func -(lhs: Tuple, rhs: Tuple) -> Tuple {
        return Tuple(x: lhs.x - rhs.x,
                     y: lhs.y - rhs.y,
                     z: lhs.z - rhs.z,
                     w: lhs.w - rhs.w)
    }
    
    static func *(lhs: Tuple, rhs: Float) -> Tuple {
        return Tuple(x: lhs.x * rhs,
                     y: lhs.y * rhs,
                     z: lhs.z * rhs,
                     w: lhs.w * rhs)
    }
    
    static func /(lhs: Tuple, rhs: Float) -> Tuple {
        return Tuple(x: lhs.x / rhs,
                     y: lhs.y / rhs,
                     z: lhs.z / rhs,
                     w: lhs.w / rhs)
    }
    
    static prefix func -(t: Tuple) -> Tuple {
        return Tuple(x: -t.x, y: -t.y, z: -t.z, w: -t.w)
    }
}
