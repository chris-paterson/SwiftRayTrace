//
//  Point.swift
//  ray tracer
//
//  Created by Christopher Paterson on 22/08/2018.
//  Copyright © 2018 Christopher Paterson. All rights reserved.
//

class Point: Tuple {
    init(x: Float, y: Float, z: Float) {
        super.init(x: x, y: y, z: z, w: 1.0)
    }
    
    static func +(lhs: Point, rhs: Vector) -> Point {
        return Point(x: lhs.x + rhs.x,
                     y: lhs.y + rhs.y,
                     z: lhs.z + rhs.z)
    }
}
