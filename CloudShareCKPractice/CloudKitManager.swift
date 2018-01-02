//
//  CloudKitManager.swift
//  CloudShareCKPractice
//
//  Created by Ilias Basha on 10/16/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import Foundation
import CloudKit
import UIKit

class CloudKitManager {
    let publicDatabase: CKDatabase
    let privateDatabase: CKDatabase
    
    init() {
        
    }
    // check CloudKit availability
    
    
    // MARK: - User Info Discovery
    
    func fetchLoggedInUserRecord(_ completion: ((_ record: CKRecord?, _ error: Error? ) -> Void)?) {
        
    }
    
    func fetchUsername(for recordID: CKRecordID,
                       completion: @escaping ((_ givenName: String?, _ familyName: String?) -> Void) = { _,_ in }) {
        
    }
    
    func fetchAllDiscoverableUsers(completion: @escaping ((_ userInfoRecords: [CKUserIdentity]?) -> Void) = { _ in }) {
        
    }
    
    // MARK: - Fetch Records
    
    func fetchRecord(withID recordID: CKRecordID, completion: ((_ record: CKRecord?, _ error: Error?) -> Void)?) {
        
    }
    
    func fetchRecordsWithType(_ type: String,
                              predicate: NSPredicate = NSPredicate(value: true),
                              recordFetchedBlock: ((_ record: CKRecord) -> Void)?,
                              completion: ((_ records: [CKRecord]?, _ error: Error?) -> Void)?) {
        
    }
    
    func fetchCurrentUserRecords(_ type: String, completion: ((_ records: [CKRecord]?, _ error: Error?) -> Void)?) {
        
    }
    
    func fetchRecordsFromDateRange(_ type: String, recordType: String, fromDate: Date, toDate: Date, completion: ((_ records: [CKRecord]?, _ error: Error?) -> Void)?) {
        
    }
    
    // MARK: - Delete Records
    
    func deleteRecordWithID(_ recordID: CKRecordID, completion: ((_ recordID: CKRecordID?, _ error: Error?) -> Void)?) {
        
        func deleteRecordsWithID(_ recordIDs: [CKRecordID], completion: ((_ records: [CKRecord]?, _ recordIDs: [CKRecordID]?, _ error: Error?) -> Void)?) {
            
        }
        
        
        // MARK: - Save Records
        
        func saveRecords(_ records: [CKRecord], perRecordCompletion: ((_ record: CKRecord?, _ error: Error?) -> Void)?, completion: ((_ records: [CKRecord]?, _ error: Error?) -> Void)?) {
            
        }
        
        func saveRecord(_ record: CKRecord, completion: ((_ record: CKRecord?, _ error: Error?) -> Void)?) {
            
        }
        
        func modifyRecords(_ records: [CKRecord], perRecordCompletion: ((_ record: CKRecord?, _ error: Error?) -> Void)?, completion: ((_ records: [CKRecord]?, _ error: Error?) -> Void)?) {
            
        }
        
        
        // MARK: - CloudKit Availability
        
        func checkCloudKitAvailability() {}
        
        func handleCloudKitUnavailable(_ accountStatus: CKAccountStatus, error:Error?) { }
        
        func displayCloudKitNotAvailableError(_ errorText: String) { }
        
        
        // MARK: - CloudKit User Discoverability
        
        func requestDiscoverabilityPermission() { }
        
        func handleCloudKitPermissionStatus(_ permissionStatus: CKApplicationPermissionStatus, error:Error?) { }
        
        func displayCloudKitPermissionsNotGrantedError(_ errorText: String) { }

    
    
}
