//
//  ViewController.swift
//  ios-challenge
//
//  Created by Jean Carlos on 3/7/17.
//  Copyright © 2017 Jean Carlos. All rights reserved.
//

import UIKit
import ICSPullToRefresh
import PKHUD

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //MARK: Variáveis de controle
    let api = RepositoriesAPI()
    var repositories = [Repositories]()
    var page : Int = 1
    
    //MARK: Outlets
    @IBOutlet weak var tableViewRepositories: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configurar Pull To Refresh e o Infinite Scrolling
        addPullToRefresh()
        addInfiniteScrolling()
        
        // Registrar celula custom na tableview (usar somente quando usar XIB)
//        tableViewRepositories.register(RepositoiresTableViewCell.classForCoder(), forCellReuseIdentifier: "RepositoriesCell")
        
        loadRepositoires(true)
    }
    
    func addPullToRefresh() {
        tableViewRepositories.addPullToRefreshHandler {
            self.page = 1
            
            self.tableViewRepositories.dataSource = nil
            self.tableViewRepositories.delegate = nil
            
            self.repositories.removeAll()
            self.loadRepositoires(false)
        }
    }
    
    func addInfiniteScrolling() {
        tableViewRepositories.addInfiniteScrollingWithHandler {
            self.page += 1
            self.loadRepositoires(false)
        }
    }
    
    func loadRepositoires(_ showProgress : Bool) {
        // Mostrar PKHUD
        if showProgress == true {
            HUD.show(.progress)
        }
        
        api.getRepositoriesAPI(page) { response in
            // Esconder PKHUD
            if showProgress == true {
                HUD.flash(.success, delay: 1.0)
            }
            
            self.tableViewRepositories.pullToRefreshView?.stopAnimating()
            self.tableViewRepositories.infiniteScrollingView?.stopAnimating()
            
            self.repositories.append(contentsOf: response)
            
            if self.repositories.count > 0 {
                // Retornou alguma coisa
                self.tableViewRepositories.dataSource = self
                self.tableViewRepositories.delegate = self
                
                self.tableViewRepositories.reloadData()
            } else {
                // Array vazio
            }
        }
    }
    
    //MARK: Métodos de UITableViewDataSource e UITableViewDelegate
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : RepositoiresTableViewCell = tableView.dequeueReusableCell(withIdentifier: "RepositoriesCell", for: indexPath) as! RepositoiresTableViewCell
        let repositorie = repositories[indexPath.row] as Repositories
        
        print("Desenhando celula : \(indexPath.row)")
        
        cell.initWithRepositorie(repositorie)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let repositorie = repositories[indexPath.row] as Repositories
        let owner = repositorie.owner
        let login = owner?.login
        let repositorieName = repositorie.nameRepositories
        
        let pullRequestController = UIViewController()
        
//        pullRequestController.login = login
//        pullRequestController.repositorieName = repositorieName
        
        self.navigationController?.pushViewController(pullRequestController, animated: true)
    }

}
