//
//  Sphere.swift
//  ray tracer
//
//  Created by Christopher Paterson on 03/09/2018.
//  Copyright © 2018 Christopher Paterson. All rights reserved.
//

class Sphere: BaseObject {
    let material: Material
    
    override init() {
        self.material = Material()
        super.init()
    }
    
    init(material: Material) {
        self.material = material
        super.init()
    }
    
    func normalAt(point: Point) -> Vector {
        let objectPoint = self.transform.inverse() * point
        let objectNormal = objectPoint - Point(x: 0, y: 0, z: 0)
        let worldNormal = self.transform.inverse().transposed() * objectNormal
        let ret = Vector(x: worldNormal.x, y: worldNormal.y, z: worldNormal.z)
        return ret.normalize()
    }
    
}
