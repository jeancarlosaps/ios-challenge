//
//  Repositories.swift
//  ios-challenge
//
//  Created by Jean Carlos on 3/8/17.
//  Copyright © 2017 Jean Carlos. All rights reserved.
//

import Foundation
import ObjectMapper

class Repositories: Mappable {
    var total_count:Int? = 0
    var incomplete_results:Bool? = false
    var items:[Repositorie]?
    
    required init(map: Map) {
        
    }
    
    func mapping(map: Map){
        total_count <- map["total_count"]
        incomplete_results <- map["incomplete_results"]
        items <- map["items"]
    }
    
//    init(id:Int, nameRepositories:String, full_name:String, description:String, owner : RepositorieOwner) {
//        self.id = id
//        self.nameRepositories = nameRepositories
//        self.full_name = full_name
//        self.description = description
//        self.owner = owner
//    }
}
