//
//  Comment.swift
//  CloudShareCKPractice
//
//  Created by Ilias Basha on 9/29/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import Foundation

class Comment {
    
    let text: String
    let timeStamp: Date
    let post: Post
    
    init(text: String, timeStamp: Date = Date(), post: Post) {
        self.text = text
        self.timeStamp = timeStamp
        self.post = post
    }
}

extension Comment: Searchable {
    func matches(searchTerm: String) -> Bool {
        return text.contains(searchTerm)
    }
}
