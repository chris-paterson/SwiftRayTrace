//
//  FileUtil.swift
//  ray tracer
//
//  Created by Christopher Paterson on 23/08/2018.
//  Copyright © 2018 Christopher Paterson. All rights reserved.
//

import Cocoa

class FileUtil {
    static let DEFAULT_FILENAME = "out.ppm"
    
    static func save(canvas: Canvas, fileName: String = DEFAULT_FILENAME) {
        let ppm = PPM()
        let content = ppm.generateContents(from: canvas)
        
        let documentUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0] as URL
        let fileUrl = documentUrl.appendingPathComponent(fileName)
        print("Saving file to: \(fileUrl)")
        try! content.write(to: fileUrl, atomically: true, encoding: String.Encoding.utf8)
    }
    
    static func loadFile(fileName: String = DEFAULT_FILENAME) -> String {
        let documentUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0] as URL
        let fileUrl = documentUrl.appendingPathComponent(fileName)
        guard let contents = try? String(contentsOf: fileUrl) else { return "" }
        
        return contents
    }
    
    // TODO: Add delete for cleanup
}
