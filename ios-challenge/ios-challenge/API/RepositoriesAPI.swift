//
//  RepositoriesAPI.swift
//  ios-challenge
//
//  Created by Jean Carlos on 3/8/17.
//  Copyright © 2017 Jean Carlos. All rights reserved.
//

import Foundation
import Alamofire

class RepositoriesAPI {
    
    func getRepositoriesAPI(_ page:Int, completion: @escaping ([Repositories]) -> Void) {
        let url : String = String(format: "https://api.github.com/search/repositories?q=language:Swift&sort=stars&page=%i", page)
        
        Alamofire.request(url).validate().responseJSON { response in
            switch response.result{
            case .success:
                
                if let json = response.result.value as? [String: Any] {
                    let items = json["items"] as? [[String : Any]]
                    var repositories = [Repositories]()
                    
                    for repositorieJSON in items! {
                        let repositorie : Repositories = Repositories(id:repositorieJSON["id"] as! Int, nameRepositories:repositorieJSON["name"] as! String, full_name:repositorieJSON["full_name"] as! String, description:repositorieJSON["description"] as! String, owner : repositorieJSON["owner"] as! RepositorieOwner)
                        
                        repositories.append(repositorie)
                    }
                    // devolve para a classe que chamo o resultado
                    completion(repositories)
                } else {
                    
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
//    func getPullRequests(_ pullRequestCreator:String, pullRequestRepository:String) -> Void{
//
//        //"https://api.github.com/repos/\(prCreator = userName)/\(prRepository = repositorieName)/pulls" name & login
//    }

}
