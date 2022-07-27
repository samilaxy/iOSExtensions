//
//  UIAlertController+Eextension.swift
//  AegisRiderCommunityApp
//
//  Created by devadmin on 30/03/2022.
//

import Foundation
import UIKit

extension UIAlertController {
    func set(_ color: UIColor) {
        for action in self.actions {
            action.setValue(color, forKey: "titleTextColor")
        }
    }
}
