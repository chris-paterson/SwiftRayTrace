//
//  Transform.swift
//  ray tracer
//
//  Created by Christopher Paterson on 26/08/2018.
//  Copyright © 2018 Christopher Paterson. All rights reserved.
//

import Foundation

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
    
    static func rotateX(_ rads: Float) -> Matrix {
        return Matrix([
            [1,     0,          0,          0],
            [0,     cos(rads),  -sin(rads), 0],
            [0,     sin(rads),  cos(rads),  0],
            [0,     0,          0,          1],
        ])
    }
    
    static func rotateY(_ rads: Float) -> Matrix {
        return Matrix([
            [cos(rads),     0, sin(rads),   0],
            [0,             1, 0,           0],
            [-sin(rads),    0, cos(rads),   0],
            [0,             0, 0,           1],
        ])
    }
    
    static func rotateZ(_ rads: Float) -> Matrix {
        return Matrix([
            [cos(rads), -sin(rads), 0, 0],
            [sin(rads), cos(rads),  0, 0],
            [0,         0,          1, 0],
            [0,         0,          0, 1],
        ])
    }
    
    static func shear(xy: Float, xz: Float, yx: Float, yz: Float, zx: Float, zy: Float) -> Matrix {
        return Matrix([
            [1, xy, xz, 0],
            [yx, 1, yz, 0],
            [zx, zy, 1, 0],
            [0, 0, 0, 1],
        ])
    }
}
