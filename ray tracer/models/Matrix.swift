//
//  Matrix.swift
//  ray tracer unit tests
//
//  Created by Christopher Paterson on 24/08/2018.
//  Copyright © 2018 Christopher Paterson. All rights reserved.
//

class Matrix {
    private var matrix: [[Float]]
    let height: Int
    let width: Int
    
    init(_ m: [[Float]]) {
        self.height = m.count
        self.width = m[0].count
        self.matrix = m
    }
    
    convenience init(width: Int, height: Int, repeating r: Float) {
        var m = Array(repeating: Array(repeating: r, count: width), count: height)
        
        self.init(m)
    }
    
    fileprivate func indexIsValid(y: Int, x: Int) -> Bool {
        return x >= 0 && x < width && y >= 0 && y < height
    }
    
    // Matricies are row-major order.
    subscript(y: Int, x: Int) -> Float {
        get {
            assert(indexIsValid(y: y, x: x), "Index out of range")
            return matrix[y][x]
        }
        set {
            assert(indexIsValid(y: y, x: y), "Index out of range")
            return matrix[y][x] = newValue
        }
    }
}
