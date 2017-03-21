//
//  PullRequestsViewController.swift
//  ios-challenge
//
//  Created by Jean Carlos on 3/14/17.
//  Copyright © 2017 Jean Carlos. All rights reserved.
//

import UIKit

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
        configureTableView()
        loadData()
    }
    
    func configureTableView() {
        tableViewPullRequests.register(UINib(nibName: "PullRequestsTableViewCell", bundle: nil), forCellReuseIdentifier: "PullRequestCell")
    }
    
    func loadData() {
        // Chamar a API e popular os dados que vao alimentar a tableView
        tableViewPullRequests.delegate = self
        tableViewPullRequests.dataSource = self
        
        tableViewPullRequests.reloadData()
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
