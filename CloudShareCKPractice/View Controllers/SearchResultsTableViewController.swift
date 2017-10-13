//
//  SearchResultsTableViewController.swift
//  CloudShareCKPractice
//
//  Created by Ilias Basha on 10/12/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import UIKit

class SearchResultsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    
    var resultsArray: [Searchable]?

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return resultsArray?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "searchResult", for: indexPath) as? PostTableViewCell,
            let result = resultsArray?[indexPath.row] as? Post else { return UITableViewCell() }
        cell.post = result
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        self.presentingViewController?.performSegue(withIdentifier: "toPostDetailFromSearch", sender: cell)
    }


}
