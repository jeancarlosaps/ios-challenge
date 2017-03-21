//
//  Repositorie.swift
//  ios-challenge
//
//  Created by Marcos Lacerda on 16/03/17.
//  Copyright © 2017 Jean Carlos. All rights reserved.
//

import Foundation
import ObjectMapper

class Repositorie: Mappable {
    var id:Int? = 0
    var nameRepositories:String? = "" //Nome do repositório;
    var full_name:String? = "" //UserName + Nome do repositório;
    var description:String? = ""  //Descrição do respositório;
    var owner:RepositorieOwner? = nil
    
    required init(map: Map) {
        
    }
    
    func mapping(map: Map){
        id <- map["id"]
        nameRepositories <- map["name"]
        full_name <- map["full_name"]
        description <- map["description"]
        owner <- map["owner"]
    }
}
