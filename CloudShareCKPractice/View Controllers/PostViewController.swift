//
//  PostViewController.swift
//  CloudShareCKPractice
//
//  Created by Ilias Basha on 10/2/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import UIKit
import Foundation

class PostViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    var searchController: UISearchController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()

        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func setupNavBar() {
        let resultsController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SearchResultsTableViewController")
        searchController = UISearchController(searchResultsController: resultsController)
        searchController?.searchResultsUpdater = self
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationController?.navigationBar.prefersLargeTitles = true
        definesPresentationContext = true
    }

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPostDetail" {
            if let destinationVC = segue.destination as? PostDetailTableViewController {
                if let indexPath = tableView.indexPathForSelectedRow {
                    guard let post = PostController.sharedController.posts?[indexPath.row] else { return }
                    destinationVC.post = post
                }
            }
        }
        
        if segue.identifier == "toPostDetailFromSearch" {
            if let destinationVC = segue.destination as? PostDetailTableViewController {
                if let sender = sender as? PostTableViewCell {
                    if let indexPath = (searchController?.searchResultsController as? SearchResultsTableViewController)?.tableView.indexPath(for: sender) {
                        if let searchTerm = searchController?.searchBar.text?.lowercased() {
                            let posts = PostController.sharedController.posts?.filter({$0.matches(searchTerm: searchTerm)})
                            let post = posts?[indexPath.row]
                            destinationVC.post = post
                        }
                    }
                }
            }
        }
    }

}

extension PostViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let resultsVC = searchController.searchResultsController as? SearchResultsTableViewController,
            let searchTerm = searchController.searchBar.text?.lowercased() {
            
            let posts = PostController.sharedController.posts
            let filteredPosts = posts?.filter { $0.matches(searchTerm: searchTerm) }.map { $0 as Searchable }
            resultsVC.resultsArray = filteredPosts
            resultsVC.tableView.reloadData()
        }
    }
    
    
}

extension PostViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PostController.sharedController.posts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as? PostTableViewCell
        guard let post = PostController.sharedController.posts?[indexPath.row] else { return UITableViewCell() }
        cell?.post = post
        return cell ?? UITableViewCell()
    }
}
