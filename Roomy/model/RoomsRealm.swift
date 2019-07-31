//
//  RoomsRealm.swift
//  Roomy
//
//  Created by shawky on 7/26/19.
//  Copyright © 2019 shawky. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class RoomsRealm: Object, Mappable{
    
    @objc dynamic var  title = ""
    @objc dynamic var  price = ""
    @objc dynamic var  place = ""
    @objc dynamic var  image = ""
    @objc dynamic var  roomDescription = ""

    required convenience init?(map: Map) {
     self.init()
    }
    
     func mapping(map: Map) {
      
        title              <- map["title"]
        price              <- map["price"]
        place              <- map["place"]
        image              <- map["image"]
        roomDescription    <- map["roomDescription"]
        
    }
    
    
    




}

