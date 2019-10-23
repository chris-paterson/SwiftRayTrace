//
//  Canvas.swift
//  ray tracer
//
//  Created by Christopher Paterson on 23/08/2018.
//  Copyright © 2018 Christopher Paterson. All rights reserved.
//

class Canvas {
    let width: Int
    let height: Int
    
    var pixels = [Color]()
    
    init(width: Int, height: Int) {
        self.width = width
        self.height = height
        self.pixels = Array(repeating: Color(r: 0, g: 0, b: 0), count: width * height)
    }
    
    fileprivate func indexIsValid(x: Int, y: Int) -> Bool {
        return x >= 0 && x < width && y >= 0 && y < height
    }
    
    subscript(x: Int, y: Int) -> Color {
        get {
            assert(indexIsValid(x: x, y: y), "Index out of range")
            return pixels[(width * y) + x]
        }
        set {
            assert(indexIsValid(x: x, y: y), "Index out of range")
            pixels[(width * y) + x] = newValue
        }
    }
    
    func save(fileName: String = FileUtil.DEFAULT_FILENAME) {
        FileUtil.save(canvas: self, fileName: fileName)
    }
}
