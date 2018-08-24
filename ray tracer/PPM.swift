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
            var row = ""
            for x in 0..<canvas.width {
                let color = canvas[x, y]
                let r = clamp(color.r * scaleMax)
                let g = clamp(color.g * scaleMax)
                let b = clamp(color.b * scaleMax)
                
                row.append("\(r) \(g) \(b) ")
            }
            acc.append("\(String(row.dropLast()))\n")
        }
        let result = enforceLineLength(acc)
        return result
    }
    
    fileprivate func enforceLineLength(_ content: String) -> String {
        let components: [String] = content.components(separatedBy: " ")
        var newContents = ""
        
        components.forEach { component in
            // +1 to take into account space.
            if (newContents.count % 70 + component.count + 1 >= 70) {
                newContents.append("\(String(newContents.dropLast()))\n")
                newContents.append(component)
            } else {
                newContents.append(component + " ")
            }
        }
        
        return newContents
    } 
    
    fileprivate func clamp(_ value: Float) -> Int {
        let val = Int(abs(value) + 0.5)
        return min(max(val, 0), Int(scaleMax))
    }
}
