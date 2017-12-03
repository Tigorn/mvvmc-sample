//
//  Vehicle.swift
//  MVVMC
//
//  Created by Dennis Merli on 11/29/17.
//  Copyright © 2017 Dennis Merli. All rights reserved.
//

import Foundation
import ObjectMapper

class Vehicle : Mappable {
    var id: String?
    var name: String?
    var brand: Brand?
    var urlImage: URL?
    var vehicleDescription: String?
    
    
    required init?(map: Map) {

    }
    
   func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        brand <- map["brand"]
        urlImage <- (map["pictureAddress"], TransformersUtils.URLTransformer)
        vehicleDescription <- map["vehicleDescription"]
    }
}
    
