//
//  Rooms.swift
//  Roomy
//
//  Created by shawky on 7/23/19.
//  Copyright © 2019 shawky. All rights reserved.
//

import UIKit
import ObjectMapper

class Rooms: Mappable{
    var title = ""
    var price = 0
    var place = ""
    var image = ""
    var roomDescription = ""
    
    required init?(map: Map) {
    }
    
func mapping(map: Map) {
        title    <- map["title"]
        price    <- map["price"]
        place    <- map["place"]
        image    <- map["image"]
        roomDescription    <- map["roomDescription"]
    }
    
}

