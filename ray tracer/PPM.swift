//
//  PPM.swift
//  ray tracer
//
//  Created by Christopher Paterson on 23/08/2018.
//  Copyright © 2018 Christopher Paterson. All rights reserved.
//

class PPM {
    let scaleMax: Float = 255.0

    func generateContents(from canvas: Canvas) -> String {
        let head = generateHead(width: canvas.width, height: canvas.height)
        let body = generateBody(canvas: canvas)
        return "\(head)\n\(body)"
    }
    
    fileprivate func generateHead(width: Int, height: Int) -> String {
        return """
            P3
            \(width) \(height)
            \(Int(scaleMax))
            """
    }
    
    
    
    fileprivate func generateBody(canvas: Canvas) -> String {
        var acc = ""
        for y in 0..<canvas.height {
            for x in 0..<canvas.width {
                let color = canvas[x, y]
                let r = clamp(color.r * scaleMax)
                let g = clamp(color.g * scaleMax)
                let b = clamp(color.b * scaleMax)
                
                acc.append("\(r) \(g) \(b)")
            }
            acc.append("\n")
        }
        
        return acc
    }
    
    fileprivate func clamp(_ value: Float) -> Int {
        let val = abs(Int(value + 0.5))
        return min(max(val, 0), Int(scaleMax))
    }
}
