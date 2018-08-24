//
//  Color.swift
//  ray tracer
//
//  Created by Christopher Paterson on 23/08/2018.
//  Copyright © 2018 Christopher Paterson. All rights reserved.
//

class Color: Tuple {
    var r: Float
    var g: Float
    var b: Float
    
    init(r: Float, g: Float, b: Float) {
        self.r = r
        self.g = g
        self.b = b
        super.init(x: r, y: g, z: b, w: 0.0)
    }
    
    static func +(lhs: Color, rhs: Color) -> Color {
        return Color(r: lhs.r + rhs.r,
                     g: lhs.g + rhs.g,
                     b: lhs.b + rhs.b)
    }
    
    // Hadamard product
    static func *(lhs: Color, rhs: Color) -> Color {
        return Color(r: lhs.r * rhs.r,
                     g: lhs.g * rhs.g,
                     b: lhs.b * rhs.b)
    }
}
