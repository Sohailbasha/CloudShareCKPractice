//
//  PostController.swift
//  CloudShareCKPractice
//
//  Created by Ilias Basha on 9/29/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import UIKit

class PostController {
    
    let sharedController = PostController()
    let posts: [Post]? = []
    
    
    func createPostWith(image: UIImage, with caption: String) {
        
    }
    
    
    
    private func addComment(_ text: String, to post: Post) {
        _ = Comment(text: text, post: post)
    }
    
}
