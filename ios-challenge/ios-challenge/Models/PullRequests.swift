//
//  PullRequests.swift
//  ios-challenge
//
//  Created by Jean Carlos on 3/8/17.
//  Copyright © 2017 Jean Carlos. All rights reserved.
//

import Foundation

class PullRequests{
    let title:String //Título do PR;
    let login:String //Nome do autor do PR;
    let avatar_URL_PR:String //Avatar do usuário/autor do PR (se tiver);
    let body:String //Body do PR;
    let createdAt:String //Data do PR;
    let numberPR:Int //Número do PR;
    
    init(login:String, title:String, avatar_URL_PR:String, body:String, createdAt:String, numberPR:Int) {
        self.title = title
        self.login = login
        self.avatar_URL_PR = avatar_URL_PR
        self.body = body
        self.createdAt = createdAt
        self.numberPR = numberPR
    }
}
