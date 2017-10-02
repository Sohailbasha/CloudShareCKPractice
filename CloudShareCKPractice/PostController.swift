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
        let post = Post(photoData: UIImagePNGRepresentation(image))
        addComment(caption, to: post)
    }
    
    
    
    private func addComment(_ text: String, to post: Post) {
        let comment = Comment(text: text, post: post)
        post.comments.append(comment)
    }
    
}
