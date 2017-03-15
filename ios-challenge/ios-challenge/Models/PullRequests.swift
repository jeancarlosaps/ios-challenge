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
    var user:PullRequestsUser?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        title <- map["title"]
        body <- map["body"]
        user <- map["user"]
        
    }
    
//    init(login:String, title:String, avatar_URL_PR:String, body:String, createdAt:String, numberPR:Int) {
//        self.title = title
//        self.login = login
//        self.avatar_URL_PR = avatar_URL_PR
//        self.body = body
//        self.createdAt = createdAt
//        self.numberPR = numberPR
//    }
}
