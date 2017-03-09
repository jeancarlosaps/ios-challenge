//
//  ViewController.swift
//  ios-challenge
//
//  Created by Jean Carlos on 3/7/17.
//  Copyright © 2017 Jean Carlos. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //MARK: Variáveis de controle
    var getAPIRepo = RepositoriesAPI()
    var arrayRepositories = [Repositories]()
    var parameterPage:Int = 1
    
    //MARK: Outlets
    @IBOutlet weak var tableViewRepositories: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewRepositories.dataSource = self
        self.tableViewRepositories.delegate = self
        
        getAPIRepo.getRepositoriesAPI(page: parameterPage, completation: arrayRepositories)
        self.tableViewRepositories.reloadData()
    }
    
    
    //MARK: Métodos de UITableViewDataSource e UITableViewDelegate
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        let repositories = arrayRepositories[indexPath.row]
        let avatarURL = URL(string: repositories.avatar_url)
        
        cell.lblRepositorieName.text = getAPIRepo.arrayRepositoriesList[indexPath.row].nameRepositories
        cell.txtviewDescription.text = getAPIRepo.arrayRepositoriesList[indexPath.row].description
        cell.lblUserName.text = getAPIRepo.arrayRepositoriesList[indexPath.row].login
        cell.lblNameSurname.text = getAPIRepo.arrayRepositoriesList[indexPath.row].full_name
        
        cell.imgAvatar.sd_setImage(with: avatarURL)
        //Colocar UIImagem igual avatar (WhatsApp)
        cell.imgAvatar.layer.borderWidth = 1
        cell.imgAvatar.layer.masksToBounds = true
        cell.imgAvatar.layer.borderColor = UIColor.clear.cgColor
        cell.imgAvatar.layer.cornerRadius = cell.imgAvatar.frame.height / 2
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayRepositories.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //TODO
    }


}

