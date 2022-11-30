//
//  Reachability.swift
//  AegisRiderCommunityApp
//
//  Created by devadmin on 25/02/2022.
//

import Foundation
import Network
import SystemConfiguration

class Reachability {
    
    // MARK: - Shared Variables
    static let shared = Reachability()
    
    // MARK: - Variables
    let monitor = NWPathMonitor()
    private var status: NWPath.Status = .requiresConnection
    var isReachable: Bool { status == .satisfied }  // If status is satisfied return true
    var isReachableOnCellular: Bool = true
    var isRepeat = false
    var isSync = false
    
    // MARK: - Custom Functions
    func startMonitoring() {
        monitor.pathUpdateHandler = { [weak self] path in
            
            self?.status = path.status
            self?.isReachableOnCellular = path.isExpensive
            
            // Check Signal Strength
            if path.status == .satisfied {
                
                print("We're connected!")
                // post connected notification
            
                DispatchQueue.main.async {
                    NotificationCenter.default.post(name: .ConnectRetained, object: nil, userInfo: nil)
                }
                
            } else {
                print("No connection.")
                // post disconnected notification
                
                DispatchQueue.main.async {
                    NotificationCenter.default.post(name: .NoInternet, object: nil, userInfo: nil)
                }
            }
            
            print(path.isExpensive)
        }
        
        let queue = DispatchQueue(label: "NetworkMonitor")
        monitor.start(queue: queue)
    }
    
    func stopMonitoring() {
        monitor.cancel()
    }
}
