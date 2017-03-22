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
    var title:String? //Título do pull request;
    var body:String? //Body do pull request;
    var url:String? //URL do pull request
    var user:RepositorieOwner?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        title <- map["title"]
        body <- map["body"]
        url <- map["html_url"]
        user <- map["user"]
        
    }
}
