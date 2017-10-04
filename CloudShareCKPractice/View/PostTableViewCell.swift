//
//  PostTableViewCell.swift
//  CloudShareCKPractice
//
//  Created by Ilias Basha on 10/2/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    var post: Post? {
        didSet {
            if let post = self.post {
                self.postImage.image = post.photo
            }
        }
    }
    
    @IBOutlet var postImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
