//
//  PullRequestsViewController.swift
//  ios-challenge
//
//  Created by Jean Carlos on 3/14/17.
//  Copyright © 2017 Jean Carlos. All rights reserved.
//

import UIKit
import PKHUD

class PullRequestsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: Variáveis de controle
    let api = API()
    var pullRequests = [PullRequests]()
    var login:String? = ""
    var repositorieName:String? = ""
    
    //MARK: Outlets
    @IBOutlet var tableViewPullRequests : UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configurar Pull To Refresh
        addPullToRefresh()
        
        configureTableView()
        loadData(true)
    }
    
    func addPullToRefresh() {
        tableViewPullRequests.addPullToRefreshHandler {
            //self.page = 1
            
            self.tableViewPullRequests.dataSource = nil
            self.tableViewPullRequests.delegate = nil
            
            self.pullRequests.removeAll()
            self.loadData(false)
        }
    }
    
    func configureTableView() {
        tableViewPullRequests.register(UINib(nibName: "PullRequestsTableViewCell", bundle: nil), forCellReuseIdentifier: "PullRequestCell")
    }
    
    func loadData(_ showProgress: Bool) {
        // Chamar a API e popular os dados que vao alimentar a tableView
        if showProgress == true{
            HUD.show(.progress)
        }
        
        api.getPullRequests(login!, pullRequestRepository: repositorieName!) { response in
            if showProgress == true {
                HUD.flash(.success, delay: 1.0)
            }
            
            self.tableViewPullRequests.pullToRefreshView?.stopAnimating()
            self.tableViewPullRequests.infiniteScrollingView?.stopAnimating()
            
            self.pullRequests.append(contentsOf: response)
            
            if self.pullRequests.count > 0{
                self.tableViewPullRequests.delegate = self
                self.tableViewPullRequests.dataSource = self
                
                self.tableViewPullRequests.reloadData()
            }else{
                //Array vazio
            }
        }
    }
    
    //MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pullRequests.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : PullRequestsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "PullRequestCell", for: indexPath) as! PullRequestsTableViewCell
        let pullRequest = pullRequests[indexPath.row] as PullRequests
        
        cell.initWithPullRequest(pullRequest)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 155
    }

}
