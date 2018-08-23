//
//  Vector.swift
//  ray tracer
//
//  Created by Christopher Paterson on 22/08/2018.
//  Copyright © 2018 Christopher Paterson. All rights reserved.
//

class Vector: Tuple {
    init(x: Float, y: Float, z: Float) {
        super.init(x: x, y: y, z: z, w: 0.0)
    }
}
