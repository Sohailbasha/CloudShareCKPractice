//
//  CloudKitManager.swift
//  CloudShareCKPractice
//
//  Created by Ilias Basha on 10/16/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import Foundation
import CloudKit

class CloudKitManager {
    let publicDatabase: CKDatabase
    let privateDatabase: CKDatabase
    
    init()
    
    func fetchLoggedInUserRecord(_ completion: ((_ record: CKRecord?, _ error: Error?) -> Void)?) {
        
    }
    
}
