//
//  main.swift
//  ray tracer
//
//  Created by Christopher Paterson on 22/08/2018.
//  Copyright © 2018 Christopher Paterson. All rights reserved.
//

import Foundation

//let start = Point(x: 0, y: 1, z: 0)
//let velocity = Vector(x: 1, y: 1.8, z: 0).normalize() * 11.25
//var projectile = Projectile(position: start, velocity: velocity)
//
//let gravity = Vector(x: 0, y: -0.1, z: 0)
//let wind = Vector(x: -0.01, y: 0, z: 0)
//let world = World(gravity: gravity, wind: wind)
//
//let canvas = Canvas(width: 900, height: 550)
//
//for _ in 0..<100 {
//    projectile = world.tick(projectile: projectile)
//    let x = Int(projectile.position.x)
//    let y = Int(projectile.position.y)
//    canvas[x, y] = Color(r: 1.0, g: 0, b: 0)
//}
//
//canvas.save()
//print("Done")


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//let c = Clock()


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//let rayOrigin = Point(x: 0, y: 0, z: -5)
//
//let wallZ: Float = 10.0
//let wallSize: Float = 7.0
//
//let canvasSize = 100
//let canvas = Canvas(width: canvasSize, height: canvasSize)
//
//let s = Sphere()
//
//let pixelSize = wallSize / Float(canvasSize)
//
//let half = Float(wallSize / 2)
//
//let color = Color(r: 1.0, g: 0, b: 0)
//for y in 0..<canvas.height {
//    let worldY: Float = half - pixelSize * Float(y)
//    
//    for x in 0..<canvas.width {
//        let worldX: Float = pixelSize * Float(x) - half
//        
//        let target = Point(x: worldX, y: worldY, z: wallZ)
//        let r = Ray(origin: rayOrigin, direction: (target - rayOrigin).normalize())
//        let xs = r.intersects(sphere: s)
//
//        if Ray.hit(intersections: xs) != nil {
//            canvas[x, y] = color
//        }
//    }
//}
//
//canvas.save(fileName: "2d.ppm")

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Creating a sphere
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

let sphereMaterial = Material(
    color: Color(r: 1.0, g: 0.2, b: 1.0), 
    ambient: nil, 
    diffuse: nil, 
    specular: nil, 
    shininess: nil
)

let s = Sphere(material: sphereMaterial)

let lightPosition = Point(x: -10, y: 10, z: -10)
let lightColor = Color(r: 1.0, g: 1.0, b: 1.0)
let light = Light(position: lightPosition, intensity: lightColor)


// Mostly the same setup as 2d
let rayOrigin = Point(x: 0, y: 0, z: -5)

let wallZ: Float = 10.0
let wallSize: Float = 7.0

let canvasSize = 100
let canvas = Canvas(width: canvasSize, height: canvasSize)

let pixelSize = wallSize / Float(canvasSize)

let half = Float(wallSize / 2)

for y in 0..<canvas.height {
    let worldY: Float = half - pixelSize * Float(y)
    
    if y % 20 == 0 { print("Row \(y)") }
    
    for x in 0..<canvas.width {
        let worldX: Float = pixelSize * Float(x) - half
        
        let target = Point(x: worldX, y: worldY, z: wallZ)
        let r = Ray(origin: rayOrigin, direction: (target - rayOrigin).normalize())
        let xs = r.intersects(sphere: s)

        if let hit = Ray.hit(intersections: xs) {
            let obj = hit.object as! Sphere
            let point = r.position(atTime: hit.t)
            let normal = obj.normalAt(point: point)
            let eye = Vector(tuple: -r.direction)
            
            let color = Light.lighting(m: obj.material, light: light, position: point, eyev: eye, normal: normal)
            canvas[x, y] = color
        }
    }
}

canvas.save(fileName: "3d.ppm")
