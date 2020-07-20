//
//  objectService.swift
//  kavak
//
//  Created by Javier Hernandez on 19/07/20.
//  Copyright © 2020 Javier Hernandez. All rights reserved.
//

import ObjectMapper
class Gnome: Mappable {
 
    var id: Int?
    var name: String?
    var age: Int?
    var thumbnail: String?
    var weight: Int?
    var height: Int?
    var hair_color: String?
    var professions = [String]()
    var friends = [String]()
    init(){}
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        age <- map["age"]
        thumbnail <- map["thumbnail"]
        weight <- map["weight"]
        height <- map["height"]
        hair_color <- map["hair_color"]
        professions <- map["professions"]
        friends <- map["friends"]
    }
}
