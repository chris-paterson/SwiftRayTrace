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
        let components: [String] = content
            .replacingOccurrences(of: "\n", with: " \n ") // Since we split on string, pad new lines so they are their own component
            .components(separatedBy: " ")
        var newContents = ""
        
        var countSinceLastNewLine = 0
        for (index, component) in components.enumerated() {
            if component == "\n" {
                newContents.append("\n")
                countSinceLastNewLine = 0
                continue
            }
            
            // +1 to take into account space.
            if (countSinceLastNewLine + component.count + 1 > 70) {
                newContents.append("\n")
                newContents.append(component)
                countSinceLastNewLine = component.count
                continue
            }
            
            if index == 0 || newContents.suffix(1) == "\n" {
                newContents.append(component)
                countSinceLastNewLine += component.count
                continue
            }
            
            newContents.append(" " + component)
            countSinceLastNewLine += component.count + 1 // +1 for the space
        }
        
        return newContents
    } 
    
    fileprivate func clamp(_ value: Float) -> Int {
        let val = Int(abs(value) + 0.5)
        return min(max(val, 0), Int(scaleMax))
    }
}
