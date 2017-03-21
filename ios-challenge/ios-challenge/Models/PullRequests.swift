//
//  PullRequests.swift
//  ios-challenge
//
//  Created by Jean Carlos on 3/8/17.
//  Copyright © 2017 Jean Carlos. All rights reserved.
//

import Foundation
import ObjectMapper

class PullRequests: Mappable{
    var title:String? //Título do PR;
    var body:String? //Body do PR;
    var user:RepositorieOwner?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        title <- map["title"]
        body <- map["body"]
        user <- map["user"]
        
    }
}
