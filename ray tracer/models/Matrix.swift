//
//  Matrix.swift
//  ray tracer unit tests
//
//  Created by Christopher Paterson on 24/08/2018.
//  Copyright © 2018 Christopher Paterson. All rights reserved.
//

class Matrix {
    static let EPSILON: Float = 0.0001
    
    private var matrix: [[Float]]
    let height: Int
    let width: Int
    
    var isInvertable: Bool {
        get {
            return self.det() != 0
        }
    }
    
    // TODO: Should this be a class var to accomodate to more than just 4x4?
    // Maybe make it a static function passing in the size (width/height should be the same)
    static let identity = Matrix([
        [1, 0, 0, 0],
        [0, 1, 0, 0],
        [0, 0, 1, 0],
        [0, 0, 0, 1],
    ])
    
    init(_ m: [[Float]]) {
        self.height = m.count
        self.width = m[0].count
        self.matrix = m
    }
    
    convenience init(width: Int, height: Int, repeating r: Float = 0.0) {
        let m = Array(repeating: Array(repeating: r, count: width), count: height)
        self.init(m)
    }
    
    convenience init(tuple t: Tuple) {
        let m = [t.x, t.y, t.z, t.w].map { [$0] }
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
    
    func transposed() -> Matrix {
        let transposedMatrix = Matrix(width: self.width, height: self.height)
        
        for r in 0..<self.height {
            for c in 0..<self.width {
                transposedMatrix[r, c] = self[c, r]
            }
        }
        
        return transposedMatrix
    }
    
    func det() -> Float {
        if self.width == 1 && self.height == 1 {
            return self[0, 0]
        }
        
        if self.width == 2 && self.height == 2 {
            return self[0, 0] * self[1, 1] - self[0, 1] * self[1, 0]
        }
        
        var acc: Float = 0
        for c in 0..<self.width {
            acc += self[0, c] * cofactor(row: 0, col: c)
        }
        
        return acc
    }
    
    func subMatrix(row: Int, col: Int) -> Matrix {
        var acc = [[Float]]()
        for r in 0..<self.height {
            if r == row { continue }
            var newRow = [Float]()
            for c in 0..<self.width {
                if c == col { continue }
                newRow.append(self[r, c])
            }
            acc.append(newRow)
        }
        
        return Matrix(acc)
    }
    
    func minor(row: Int, col: Int) -> Float {
        let subMat = self.subMatrix(row: row, col: col)
        return subMat.det()
    }
    
    func cofactor(row: Int, col: Int) -> Float {
        let minor = self.minor(row: row, col: col)
        return (row + col) % 2 == 0
            ? minor
            : minor * -1
    }
    
    func inverse() -> Matrix {
        let cofactorMatrix = Matrix(width: self.width, height: self.height)
        
        for r in 0..<self.height {
            for c in 0..<self.width {
                cofactorMatrix[r, c] = self.cofactor(row: r, col: c)
            }
        }
        
        let transposedCofactorMatrix = cofactorMatrix.transposed()
        return transposedCofactorMatrix / self.det()
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
                if abs(lhs[r, c] - rhs[r, c]) > EPSILON {
                    return false
                }
            }
        }
        
        return true
    }
    
    static func *(lhs: Matrix, rhs: Tuple) -> Tuple {
        let tupleAsMatrix = Matrix(tuple: rhs)
        let matmul = lhs * tupleAsMatrix
        
        return Tuple(x: matmul[0, 0], y: matmul[1, 0], z: matmul[2, 0], w: matmul[3, 0])
    }
    
    static func *(lhs: Tuple, rhs: Matrix) -> Tuple {
        return rhs * lhs
    }
    
    static func /(lhs: Matrix, rhs: Float) -> Matrix {
        let m = Matrix(width: lhs.width, height: lhs.height)
        
        for r in 0..<lhs.height {
            for c in 0..<lhs.width {
                m[r, c] = lhs[r, c] / rhs
            }
        }
        
        return m
    }
}
