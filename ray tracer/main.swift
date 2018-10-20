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

let rayOrigin = Point(x: 0, y: 0, z: -5)

let wallZ: Float = 10.0
let wallSize: Float = 7.0

let canvasSize = 100
let canvas = Canvas(width: canvasSize, height: canvasSize)

let s = Sphere()

let pixelSize = wallSize / Float(canvasSize)

let half = Float(wallSize / 2)

let color = Color(r: 1.0, g: 0, b: 0)
for y in 0..<canvas.height {
    let worldY: Float = half - pixelSize * Float(y)
    
    for x in 0..<canvas.width {
        let worldX: Float = pixelSize * Float(x) - half
        
        let target = Point(x: worldX, y: worldY, z: wallZ)
        let r = Ray(origin: rayOrigin, direction: (target - rayOrigin).normalize())
        let xs = r.intersects(sphere: s)

        if Ray.hit(intersections: xs) != nil {
            canvas[x, y] = color
        }
    }
}

canvas.save(fileName: "2d.ppm")


























