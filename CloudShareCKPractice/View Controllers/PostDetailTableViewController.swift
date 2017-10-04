//
//  PostDetailTableViewController.swift
//  CloudShareCKPractice
//
//  Created by Ilias Basha on 10/2/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import UIKit

class PostDetailTableViewController: UITableViewController {

    var post: Post? {
        didSet {
            updateViews()
        }
    }
    
    var comments: [Comment]? {
        return post?.comments
    }
    
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 40
    }


    private func updateViews() {
        guard let post = post, isViewLoaded else { return }
        imageView.image = post.photo
        tableView.reloadData()
    }
    
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return post?.comments.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "comments", for: indexPath)
        guard let timeStamp = post?.comments[indexPath.row].timeStamp, let commentText = post?.comments[indexPath.row].text else { return UITableViewCell() }
        cell.textLabel?.text = "\(timeStamp)"
        cell.detailTextLabel?.text = commentText
        return cell
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func commentTapped(_ sender: Any) {
        
        let alert = UIAlertController(title: "Add Comment", message: "", preferredStyle: .alert)
        let textFieldText = UITextField()
        
        alert.addTextField { (textField) in
            textField.keyboardType = .default
            textFieldText.text = textField.text
        }
        let add = UIAlertAction(title: "Add", style: .default) { (_) in
            if let text = textFieldText.text, !text.isEmpty {
                if let post = self.post {
                    PostController.sharedController.addComment(text, to: post)
                }
            }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(add)
        alert.addAction(cancel)
    }
    
    @IBAction func shareTapped(_ sender: Any) {
    }
    
    @IBAction func followTapped(_ sender: Any) {
    }
    
    
}









