//
//  Searchable.swift
//  CloudShareCKPractice
//
//  Created by Ilias Basha on 10/12/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import Foundation

protocol Searchable {
    func matches(searchTerm: String) -> Bool
}
