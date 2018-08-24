//
//  main.swift
//  ray tracer
//
//  Created by Christopher Paterson on 22/08/2018.
//  Copyright © 2018 Christopher Paterson. All rights reserved.
//

import Foundation

let world = World(gravity: Vector(x: 0, y: 9.8, z: 0),
                  wind: Vector(x: 0, y: 0, z: 0))

var projectile = Projectile(position: Point(x: 3, y: 100, z: 0),
                            velocity: Vector(x: 60, y: 20, z: 0))


for _ in 0..<100 {
    projectile = world.tick(projectile: projectile)
    print(projectile.position.x, projectile.position.y)
}
