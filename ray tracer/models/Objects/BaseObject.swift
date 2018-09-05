//
//  BaseObject.swift
//  ray tracer
//
//  Created by Christopher Paterson on 04/09/2018.
//  Copyright © 2018 Christopher Paterson. All rights reserved.
//

import Foundation

class BaseObject: Equatable {
    let uuid: String
    
    init() {
        self.uuid = UUID().uuidString
    }
    
    static func == (lhs: BaseObject, rhs: BaseObject) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}
