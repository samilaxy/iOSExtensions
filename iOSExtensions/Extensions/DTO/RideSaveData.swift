//
//  RideSaveData.swift
//  AegisRiderCommunityApp
//
//  Created by devadmin on 26/02/2022.
//

import Foundation

/// Saves ride info to UserDefaults
struct RideSaveData {
    
    // MARK: - User Default Keys
    static private let offlineRideData = "OfflineRideData"
    
    // MARK: - Data Functions
    // Local Storage functions
    /// Saves the ride data
    static func saveRide(_ rideData: RideSave) {
        
        var rides = getSaveRides()
        rides.append(rideData)
        
        UserDefaults.standard.set(try? PropertyListEncoder().encode(rides), forKey: offlineRideData)
        UserDefaults.standard.synchronize()
    }
    
    /// Removes the ride data
    static func removeModel() {
        UserDefaults.standard.removeObject(forKey: offlineRideData)
        UserDefaults.standard.synchronize()
    }
    
    static func removeRide(_ timestamp: String) {
        var rides = getSaveRides()
        if let index = rides.firstIndex(where: { innerRide in
            return timestamp == innerRide.timestamp
        }) {
            rides.remove(at: index)
        }
        UserDefaults.standard.set(try? PropertyListEncoder().encode(rides), forKey: offlineRideData)
        UserDefaults.standard.synchronize()
    }
    
    /// Get the rides data
    static func getSaveRides() -> [RideSave] {
        if let data = UserDefaults.standard.value(forKey: offlineRideData) as? Data {
            guard let ridedataSet = try? PropertyListDecoder().decode([RideSave].self, from: data) else {
                return []
            }
            
            print("\(ridedataSet.count) rides data found")
            return ridedataSet
        } else {
            return []
        }
    }
}
