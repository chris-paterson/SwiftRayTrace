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
    
    convenience init(width: Int, height: Int, repeating r: Float = 0.0) {
        let m = Array(repeating: Array(repeating: r, count: width), count: height)
        self.init(m)
    }
    
    fileprivate func indexIsValid(row: Int, column: Int) -> Bool {
        return column >= 0 && column < width && row >= 0 && row < height
    }
    
    // Matricies are row-major order.
    subscript(row: Int, column: Int) -> Float {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return matrix[row][column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return matrix[row][column] = newValue
        }
    }
    
    func getColumn(col: Int) -> [Float] {
        // Get all rows in the column
        var colValues = [Float]()
        for r in 0..<self.height {
            colValues.append(self[r, col])
        }
        
        return colValues
    }
    
    fileprivate func getRow(row: Int) -> [Float] {
        // Get all columns in that row.
        var rowValues = [Float]()
        for c in 0..<self.width {
            rowValues.append(self[row, c])
        }
        
        return rowValues
    }
    
    static func *(lhs: Matrix, rhs: Matrix) -> Matrix {
        assert(lhs.width == rhs.height, "lhs width must be the same as rhs height")
        
        let m = Matrix(width: lhs.width, height: lhs.height)
        
        for r in 0..<lhs.height {
            for c in 0..<rhs.width {
                let row = lhs.getRow(row: r)
                let col = rhs.getColumn(col: c)

                m[r, c] = zip(col, row).map { $0 * $1 }.reduce(0, +)
            }
        }
        return m
    }
    
    static func ==(lhs: Matrix, rhs: Matrix) -> Bool {
        assert(lhs.width == rhs.width && lhs.height == rhs.height, "Matricies must have the same dimensions")
        
        for r in 0..<lhs.height {
            for c in 0..<lhs.width {
                if lhs[r, c] != rhs[r, c] {
                    return false
                }
            }
        }
        
        return true
    }
}
