//
//  CustomTableViewCell.swift
//  ios-challenge
//
//  Created by Jean Carlos on 3/8/17.
//  Copyright © 2017 Jean Carlos. All rights reserved.
//

import UIKit
import SDWebImage

class RepositoiresTableViewCell: UITableViewCell {

    @IBOutlet weak var lblRepositorieName: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblNameSurname: UILabel!
    
    // Metodo para customização de elementos da celular chamada no lifecycle da tableview
    override func awakeFromNib() {
        imgAvatar.layer.borderWidth = 1
        imgAvatar.layer.masksToBounds = true
        imgAvatar.layer.borderColor = UIColor.clear.cgColor
        imgAvatar.layer.cornerRadius = imgAvatar.frame.height / 2
    }
   
    func initWithRepositorie(_ repositorie : Repositories) {
        lblRepositorieName.text = repositorie.nameRepositories
        lblDescription.text = repositorie.description
        
        let imgAvatarURL = URL(string: (repositorie.owner?.avatarURL)!)
        imgAvatar.sd_setImage(with: imgAvatarURL)
        
        lblUserName.text = repositorie.owner?.login
        lblNameSurname.text = repositorie.full_name
    }
}
