//
//  Light.swift
//  ray tracer
//
//  Created by Chris Paterson on 2018-12-11.
//  Copyright © 2018 Christopher Paterson. All rights reserved.
//

import Foundation

class Light {
    let position: Point
    let intensity: Color
    
    init(position: Point, intensity: Color) {
        self.position = position
        self.intensity = intensity
    }
    
    static func lighting(m: Material, light: Light, position: Point, eyev: Vector, normal: Vector) -> Color {
        let effective_color = m.color * light.intensity // Combine surface color with light's color/intensity.
        let lightv = (light.position - Point(x: 0, y: 0, z: 0)).normalize() // Find direction to light source.
        let ambient = effective_color * m.ambient // Compute ambient contribution
        
        // A negative value means the light is on the other side of the surface.
        let lightDotNormal = lightv.dot(normal)
        
        var diffuse: Color = Color(r: 0, g: 0, b: 0)
        var specular = Color(r: 0, g: 0, b: 0)
        
        if lightDotNormal > 0 {
            diffuse = Color(tuple: effective_color * m.diffuse * lightDotNormal)
            
            let reflectv = Vector.reflect(v: Vector(tuple: -lightv), normal: normal)
            let reflectDotEye = reflectv.dot(eyev)
            
            if reflectDotEye > 0 {
                let factor = pow(reflectDotEye, Float(m.shininess))
                specular = Color(tuple: light.intensity * m.specular * factor)
            }
        }
        
        return Color(tuple: (ambient + diffuse + specular)) 
    }
}
