//
//  AddPostTableViewController.swift
//  CloudShareCKPractice
//
//  Created by Ilias Basha on 9/29/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import UIKit

class AddPostTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    @IBOutlet var textField: UITextField!
    @IBOutlet var selectPhotoButton: UIButton!
    @IBOutlet var imageView: UIImageView!
    
    @IBAction func selectPhotoButtonTapped(_ sender: Any) {
        selectPhotoButton.setTitle("", for: .normal)
    }
    
    
    @IBAction func addPostButtonTapped(_ sender: Any) {
        if let image = imageView.image,
            let text = textField.text, !text.isEmpty {
            PostController.sharedController.createPostWith(image: image, with: text)
        } else {
            showAlert()
        }
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true) {
            self.imageView.image = nil
            self.textField.text = ""
            self.selectPhotoButton.setTitle("Select Photo", for: .normal)
        }
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Empty Values", message: "Fill in empty feilds to post.", preferredStyle: .alert)
        let dismiss = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        alert.addAction(dismiss)
        present(alert, animated: true, completion: nil)
    }
}
