//
//  PostController.swift
//  CloudShareCKPractice
//
//  Created by Ilias Basha on 10/2/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import Foundation
import UIKit

class PostController {
    
    static let sharedController = PostController()
    var posts: [Post]? = []
    
    
    func createPostWith(image: UIImage, with caption: String) {
        let post = Post(photoData: UIImagePNGRepresentation(image))
        addComment(caption, to: post)
        posts?.append(post)
    }
    
    
    func addComment(_ text: String, to post: Post) {
        let comment = Comment(text: text, post: post)
        post.comments.append(comment)
    }
    
}
