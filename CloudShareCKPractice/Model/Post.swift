//
//  Post.swift
//  CloudShareCKPractice
//
//  Created by Ilias Basha on 9/29/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import Foundation
import UIKit


class Post {
    
    let photoData: Data?
    let timeStamp: Date
    var comments: [Comment]
    
    init(photoData: Data?, timeStamp: Date = Date(), comments: [Comment] = []) {
        self.photoData = photoData
        self.timeStamp = timeStamp
        self.comments = comments
    }
    
    
    var photo: UIImage? {
        guard let data = self.photoData else { return nil }
        return UIImage(data: data)
    }
}

extension Post: Searchable {
    func matches(searchTerm: String) -> Bool {
        let matchingComments = comments.filter{ $0.matches(searchTerm: searchTerm)}
        return !matchingComments.isEmpty
    }
}
