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
    
    func tupleFactory() -> Tuple {
        switch w {
        case 0.0:
            return Vector(x: x, y: y, z: z)
        case 1.0:
            return Point(x: x, y: y, z: z)
        default:
            return self
        }
    }
    
    static func ==(lhs: Tuple, rhs: Tuple) -> Bool {
        return (lhs.x - rhs.x) < EPSILON &&
            abs(lhs.y - rhs.y) < EPSILON &&
            abs(lhs.z - rhs.z) < EPSILON &&
            abs(lhs.w - rhs.w) < EPSILON
    }
    
    static func +(lhs: Tuple, rhs: Tuple) -> Tuple {
        let x = lhs.x + rhs.x
        let y = lhs.y + rhs.y
        let z = lhs.z + rhs.z
        let w = lhs.w + rhs.w
        
        return Tuple(x: x, y: y, z: z, w: w).tupleFactory()
    }
    
    static func -(lhs: Tuple, rhs: Tuple) -> Tuple {
        let x = lhs.x - rhs.x
        let y = lhs.y - rhs.y
        let z = lhs.z - rhs.z
        let w = lhs.w - rhs.w
        
        return Tuple(x: x, y: y, z: z, w: w).tupleFactory()
    }
}
