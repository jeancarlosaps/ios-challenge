//
//  Repositories.swift
//  ios-challenge
//
//  Created by Jean Carlos on 3/8/17.
//  Copyright © 2017 Jean Carlos. All rights reserved.
//

import Foundation

extension String{
    var userName:String{
        return components(separatedBy: "/").first ?? ""
    }
}

class Repositories {
    let id:Int
    let nameRepositories:String //Nome do repositório;
    let full_name:String //UserName + Nome do repositório;
    let login:String
    let description:String //Descrição do respositório;
    let avatar_url:String //Avatar do usuário/autor do PR (se tiver);
    
    init(id:Int, nameRepositories:String, full_name:String, login:String, description:String, avatar_url:String) {
        self.id = id
        self.nameRepositories = nameRepositories
        self.full_name = full_name
        self.login = login
        self.description = description
        self.avatar_url = avatar_url
    }
}

