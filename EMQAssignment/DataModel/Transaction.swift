//
//  Transaction.swift
//  EMQAssignment
//
//  Created by Sean Zeng on 6/25/16.
//  Copyright © 2016 Yahoo. All rights reserved.
//

import Foundation
import ObjectMapper

class Transaction: Mappable {
    var id: Int?
    var created: String?
    var destination: Destination?
    var source: Source?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        created <- map["created"]
        destination <- map["destination"]
        source <- map["source"]
    }
}