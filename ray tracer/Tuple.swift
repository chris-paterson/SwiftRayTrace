//
//  Tuple.swift
//  ray tracer
//
//  Created by Christopher Paterson on 22/08/2018.
//  Copyright © 2018 Christopher Paterson. All rights reserved.
//

class Tuple {
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
    
    func TupleFactory() -> Tuple {
        switch w {
        case 0.0:
            return Vector(x: x, y: y, z: z)
        case 1.0:
            return Point(x: x, y: y, z: z)
        default:
            return self
        }
    }
}
