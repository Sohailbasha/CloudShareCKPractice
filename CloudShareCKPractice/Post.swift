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
    
    init(photoData: Data?, let timeStamp: Date = Date(), var comments: [Comment] = []) {
        self.photoData = photoData
        self.timeStamp = timeStamp
        self.comments = comments
    }
    
    
    
}
