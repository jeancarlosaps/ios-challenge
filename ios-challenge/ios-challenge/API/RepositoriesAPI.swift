//
//  RepositoriesAPI.swift
//  ios-challenge
//
//  Created by Jean Carlos on 3/8/17.
//  Copyright © 2017 Jean Carlos. All rights reserved.
//

import Foundation
import Alamofire

var arrayRepositoriesList = [Repositories]()
func repositoriesAPI() -> Void {
    let url:String = "https://api.github.com/search/repositories?q=language:Swift&sort=stars&"
    
    Alamofire.request(url).validate().responseJSON { response in
        switch response.result{
        case .success:
            
            if let json = response.result.value as? [String: Any]{
                print("JSON \(json)")
                
                let repositories = Repositories(id:json["id"] as! Int, nameRepositories:json["name"] as! String, full_name:json["full_name"] as! String, login:json["login"] as! String, description:json["description"] as! String, avatar_url:json["avatar_url"] as! String)
                
                arrayRepositoriesList.append(repositories)
                
            } else {
                
            }
        case .failure(let error):
            print(error)
        }        
    }
}
