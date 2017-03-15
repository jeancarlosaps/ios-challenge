//
//  PullRequestsUser.swift
//  ios-challenge
//
//  Created by Jean Carlos on 3/15/17.
//  Copyright © 2017 Jean Carlos. All rights reserved.
//

import Foundation
import ObjectMapper

class PullRequestsUser: Mappable{
    var login:String?
    var avatarURL:String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        login <- map["login"]
        avatarURL <- map["avatar_url"]
    }
}
