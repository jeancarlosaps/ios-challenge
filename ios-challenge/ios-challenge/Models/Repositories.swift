//
//  Repositories.swift
//  ios-challenge
//
//  Created by Jean Carlos on 3/8/17.
//  Copyright © 2017 Jean Carlos. All rights reserved.
//

import Foundation
import ObjectMapper

extension String{
    var userName:String{
        return components(separatedBy: "/").first ?? ""
    }
}

class Repositories: Mappable {
    var id:Int?
    var nameRepositories:String? //Nome do repositório;
    var full_name:String? //UserName + Nome do repositório;
    var description:String? //Descrição do respositório;
    var owner:RepositorieOwner?
    
    required init(map: Map) {
        
    }
    
    func mapping(map: Map){
        id <- map["id"]
        nameRepositories <- map["name"]
        full_name <- map["full_name"]
        description <- map["description"]
        owner <- map["owner"]
    }
    
//    init(id:Int, nameRepositories:String, full_name:String, description:String, owner : RepositorieOwner) {
//        self.id = id
//        self.nameRepositories = nameRepositories
//        self.full_name = full_name
//        self.description = description
//        self.owner = owner
//    }
}
