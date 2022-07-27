//
//  UserData.swift
//  AegisRiderCommunityApp
//
//  Created by devadmin on 19/02/2022.
//

import Foundation
import UIKit

/// Saves user info to UserDefaults
struct UserData {
    
    // MARK: - User Default Keys
    static private let currentUser = "currentUser"
    
    // MARK: - Data Functions
    // Local Storage functions
    /// Saves the user data
    static func saveMode() {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(AppDefaults.shared.currentUser), forKey: Utilities.Defaults.userData)
        UserDefaults.standard.synchronize()
        getSaveModel()
    }
    
    /// Removes the user data
    static func removeModel() {
        UserDefaults.standard.removeObject(forKey: Utilities.Defaults.userData)
        UserDefaults.standard.synchronize()
    }
    
    /// Gets the user data
    static func getSaveModel() {
        if let data = UserDefaults.standard.value(forKey: Utilities.Defaults.userData) as? Data {
            guard let dataSet = try? PropertyListDecoder().decode(NewGeneralProfile.self, from: data) else {
                return
            }
            AppDefaults.shared.currentUser =  dataSet
            print("User data found: \(AppDefaults.shared.currentUser)")
        }
    }
}
