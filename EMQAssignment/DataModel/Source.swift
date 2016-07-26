//
//  Source.swift
//  EMQAssignment
//
//  Created by Sean Zeng on 6/25/16.
//  Copyright © 2016 Yahoo. All rights reserved.
//

import Foundation
import ObjectMapper

class Source: Mappable {
    var note: String?
    var sender: String?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        note <- map["note"]
        sender <- map["sender"]
    }
}