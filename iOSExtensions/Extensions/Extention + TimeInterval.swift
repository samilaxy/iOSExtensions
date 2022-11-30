//
//  Extention + TimeInterval.swift
//  AegisRiderCommunityApp
//
//  Created by Sajjad Malik on 23.02.22.
//

import Foundation
extension TimeInterval {
    func TimeFormat() -> String? {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad

        return formatter.string(from: self)
    }
}
