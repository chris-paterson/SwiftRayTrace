//
//  Sphere.swift
//  ray tracer
//
//  Created by Christopher Paterson on 03/09/2018.
//  Copyright © 2018 Christopher Paterson. All rights reserved.
//

class Sphere: BaseObject {
    override init() {
        super.init()
    }
    
    func normalAt(point: Point) -> Vector {
        let v = point - Point(x: 0, y: 0, z: 0)
        return v.normalize()
    }
}
