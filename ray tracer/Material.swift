//
//  Material.swift
//  ray tracer
//
//  Created by Chris Paterson on 2018-12-11.
//  Copyright © 2018 Christopher Paterson. All rights reserved.
//

class Material: Equatable {
    let color: Color
    let ambient: Float
    let diffuse: Float
    let specular: Float
    let shininess: Int
    
    init() {
        self.color = Color(r: 1, g: 1, b: 1)
        self.ambient = 0.1
        self.diffuse = 0.9
        self.specular = 0.9
        self.shininess = 200
    }
    
    init(color: Color?, ambient: Float?, diffuse: Float?, specular: Float?, shininess: Int?) {
        self.color = color ?? Color(r: 1, g: 1, b: 1)
        self.ambient = ambient ?? 0.1
        self.diffuse = diffuse ?? 0.9
        self.specular = specular ?? 0.9
        self.shininess = shininess ?? 200
    }
    
    static func == (lhs: Material, rhs: Material) -> Bool {
        return lhs.color == rhs.color &&
            lhs.ambient == rhs.ambient &&
            lhs.diffuse == rhs.diffuse &&
            lhs.specular == rhs.specular &&
            lhs.shininess == rhs.shininess
    }
}
