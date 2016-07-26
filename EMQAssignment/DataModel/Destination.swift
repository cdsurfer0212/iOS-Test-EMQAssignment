//
//  Destination.swift
//  EMQAssignment
//
//  Created by Sean Zeng on 6/25/16.
//  Copyright © 2016 Yahoo. All rights reserved.
//

import Foundation
import ObjectMapper

class Destination: Mappable {
    var amount: Int?
    var currency: String?
    var recipient: String?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        amount <- map["amount"]
        currency <- map["currency"]
        recipient <- map["recipient"]
    }
}