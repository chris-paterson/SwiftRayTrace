//
//  World.swift
//  ray tracer
//
//  Created by Christopher Paterson on 23/08/2018.
//  Copyright © 2018 Christopher Paterson. All rights reserved.
//

class World {
    let gravity: Vector
    let wind: Vector
    
    init(gravity: Vector, wind: Vector) {
        self.gravity = gravity
        self.wind = wind
    }
    
    func tick(projectile: Projectile) -> Projectile {
        let position = projectile.position + projectile.velocity
        let velocity = projectile.velocity + self.wind + self.gravity as! Vector
        
        return Projectile(position: position, velocity: velocity)
    }
}
