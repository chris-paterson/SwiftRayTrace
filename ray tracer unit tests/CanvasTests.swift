//
//  CanvasTests.swift
//  ray tracer unit tests
//
//  Created by Christopher Paterson on 23/08/2018.
//  Copyright © 2018 Christopher Paterson. All rights reserved.
//

import XCTest

class CanvasTests: XCTestCase {
    let width = 10
    let height = 20
    

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCreateCanvas() {
        let canvas = Canvas(width: width, height: height)
        XCTAssert(canvas.width == 10)
        XCTAssert(canvas.height == 20)
        
        for x in 0..<width {
            for y in 0..<height {
                XCTAssert(canvas[x, y] == Color(r: 0, g: 0, b: 0))
            }
        }
    }
    
    func testWritePixelToCanvas() {
        let canvas = Canvas(width: width, height: height)
        let red = Color(r: 1.0, g: 0.0, b: 0.0)
        
        let x = 2
        let y = 3
        canvas[x, y] = red
        XCTAssert(canvas[x, y] == red)
    }
    
    func testWritePPMHeader() {
        let canvas = Canvas(width: width, height: height)
        canvas.save()
        let header = FileUtil.loadFile()
            .split(separator: "\n")
            .prefix(3)
            .joined(separator: "\n")
        let testString = """
            P3
            10 20
            255
            """
        
        XCTAssert(header == testString)
    }
    
    func testWritePPMContents() {
        let canvas = Canvas(width: 5, height: 3)
        let c1 = Color(r: 1.5, g: 0.0, b: 0.0)
        let c2 = Color(r: 0.0, g: 0.5, b: 0.0)
        let c3 = Color(r: -0.5, g: 0.0, b: 1.0)

        canvas[0, 0] = c1
        canvas[2, 1] = c2
        canvas[4, 2] = c3
        
        canvas.save(fileName: "ColourTest.ppm")
        let contents = FileUtil.loadFile()
            .split(separator: "\n")
            .dropFirst(3)
            .joined(separator: "\n")
        let testString = """
            255 0 0 0 0 0 0 0 0 0 0 0 0 0 0
            0 0 0 0 0 0 0 128 0 0 0 0 0 0 0
            0 0 0 0 0 0 0 0 0 0 0 0 128 0 255
            """
        
        XCTAssert(contents == testString)
    }

}
