//
//  RepositoriesAPI.swift
//  ios-challenge
//
//  Created by Jean Carlos on 3/8/17.
//  Copyright © 2017 Jean Carlos. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class API {
    
    func getRepositoriesAPI(_ page:Int, completion: @escaping ([Repositorie]) -> Void) {
        let url : String = String(format: "https://api.github.com/search/repositories?q=language:Swift&sort=stars&page=%i", page)
        
        Alamofire.request(url).validate().responseObject { (response : DataResponse<Repositories>) in
            switch response.result {
            case .success:
                if let responseData = response.result.value{
                    // devolve para a classe que chamou o resultado
                    completion(responseData.items!)
                }else{

                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getPullRequests(_ pullRequestCreator:String, pullRequestRepository:String, completion: @escaping ([PullRequests]) -> Void) {
        
        let url:String = "https://api.github.com/repos/\(pullRequestCreator)/\(pullRequestRepository)/pulls"
        
        Alamofire.request(url).validate().responseObject { (response : DataResponse<PullRequests>) in
            switch response.result{
            case .success:
                if let responseData = response.result.value{
                    completion([responseData])
                }else{
                    
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

    
    
//    UIApplication.shared.openURL(URL(string: "http://www.stackoverflow.com")!)
    
}
