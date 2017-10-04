//
//  PhotoSelectViewController.swift
//  CloudShareCKPractice
//
//  Created by Ilias Basha on 10/4/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import UIKit

class PhotoSelectViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    weak var delegate: PhotoselectViewcontrollerDelegate?

    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var button: UIButton!
    
    @IBAction func buttonTapped(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let alert = UIAlertController(title: "Photo Library", message: nil, preferredStyle: .actionSheet)
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            alert.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (_) in
                imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true, completion: nil)
            }))
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (_) in
                imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true, completion: nil)
            }))
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

extension PhotoSelectViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            delegate?.photoSelectViewControllerSelected(image: image)
            button.setTitle("", for: .normal)
            imageView.image = image
        }
    }
}


protocol PhotoselectViewcontrollerDelegate: class {
    func photoSelectViewControllerSelected(image: UIImage)
}
