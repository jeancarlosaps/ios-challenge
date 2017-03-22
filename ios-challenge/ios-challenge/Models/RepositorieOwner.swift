//
//  RepositorieOwner.swift
//  ios-challenge
//
//  Created by Marcos Lacerda on 10/03/17.
//  Copyright © 2017 Jean Carlos. All rights reserved.
//

import Foundation
import ObjectMapper

class RepositorieOwner: Mappable {
    var login:String?
    var avatarURL:String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        login <- map["login"]
        avatarURL <- map["avatar_url"]
    }
}
