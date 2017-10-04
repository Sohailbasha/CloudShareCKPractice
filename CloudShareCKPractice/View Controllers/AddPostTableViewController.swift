//
//  AddPostTableViewController.swift
//  CloudShareCKPractice
//
//  Created by Ilias Basha on 9/29/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import UIKit

class AddPostTableViewController: UITableViewController {

    var image: UIImage?
    

    @IBOutlet var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addPostButtonTapped(_ sender: Any) {
        if let image = image,
            let text = textField.text, !text.isEmpty {
            PostController.sharedController.createPostWith(image: image, with: text)
            self.dismiss(animated: true, completion: nil)
        } else {
            showAlert()
        }
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true) {
            self.textField.text = ""
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "embeddedPhotoSelect" {
            if let embedded = segue.destination as? PhotoSelectViewController {
                embedded.delegate = self
            }
        }
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Empty Values", message: "Fill in empty feilds to post.", preferredStyle: .alert)
        let dismiss = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        alert.addAction(dismiss)
        present(alert, animated: true, completion: nil)
    }
}

extension AddPostTableViewController: PhotoselectViewcontrollerDelegate {
    func photoSelectViewControllerSelected(image: UIImage) {
        self.image = image
    }
}

