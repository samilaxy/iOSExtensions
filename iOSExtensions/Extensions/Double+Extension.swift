//
//  Double+Extension.swift
//  AegisRiderCommunityApp
//
//  Created by devadmin on 21/02/2022.
//

import Foundation

extension Double {
    func asString(style: DateComponentsFormatter.UnitsStyle) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = style
        
        
        if style == .positional {
            let time = formatter.string(from: self) ?? ""
            var components = time.components(separatedBy: ":")
            if components.indices.contains(2) {
                components.remove(at: 2)
            }
            
            return components.joined(separator: ":")
        } else {
            return formatter.string(from: self) ?? ""
        }
    }
    
    func toString() -> String {
        let data = secondsToHoursMinutesSeconds(Int(self))
        return "\(String(format: "%02d", data.0)):\(String(format: "%02d", data.1))"
    }
    
    func secondsToHoursMinutesSeconds(_ seconds: Int) -> (Int, Int, Int) {
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
}
