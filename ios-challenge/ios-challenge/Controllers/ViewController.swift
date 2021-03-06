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
    let api = API()
    var repositories = [Repositorie]()
    var page:Int = 1
    
    //MARK: Outlets
    @IBOutlet weak var tableViewRepositories: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Github Swift"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        // Configurar Pull To Refresh e o Infinite Scrolling
        addPullToRefresh()
        addInfiniteScrolling()
        
        loadRepositories(true)
    }
    
    func addPullToRefresh() {
        tableViewRepositories.addPullToRefreshHandler {
            self.page = 1
            
            self.tableViewRepositories.dataSource = nil
            self.tableViewRepositories.delegate = nil
            
            self.repositories.removeAll()
            self.loadRepositories(false)
        }
    }
    
    func addInfiniteScrolling() {
        tableViewRepositories.addInfiniteScrollingWithHandler {
            self.page += 1
            self.loadRepositories(false)
        }
    }
    
    func loadRepositories(_ showProgress : Bool) {
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
        let repositorie = repositories[indexPath.row] as Repositorie
        
        cell.initWithRepositorie(repositorie)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let repositorie = repositories[indexPath.row] as Repositorie
        let owner = repositorie.owner
        let login = owner?.login
        let repositorieName = repositorie.nameRepositories
        
        let pullRequestController = PullRequestsViewController()
        
        pullRequestController.login = login
        pullRequestController.repositorieName = repositorieName
        
        self.navigationController?.pushViewController(pullRequestController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

}
