//
//  PostViewController.swift
//  CloudShareCKPractice
//
//  Created by Ilias Basha on 10/2/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
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
