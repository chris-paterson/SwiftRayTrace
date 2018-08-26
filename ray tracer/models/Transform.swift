//
//  Transform.swift
//  ray tracer
//
//  Created by Christopher Paterson on 26/08/2018.
//  Copyright © 2018 Christopher Paterson. All rights reserved.
//

class Transform {
    static func transform(x: Float, y: Float, z: Float) -> Matrix {
        return Matrix([
            [1, 0, 0, x],
            [0, 1, 0, y],
            [0, 0, 1, z],
            [0, 0, 0, 1],
        ])
    }
    
    static func scale(x: Float, y: Float, z: Float) -> Matrix {
        return Matrix([
            [x, 0, 0, 0],
            [0, y, 0, 0],
            [0, 0, z, 0],
            [0, 0, 0, 1],
        ])
    }
}
