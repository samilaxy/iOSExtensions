//
//  UIViewController+Extension.swift
//  AegisRiderCommunityApp
//
//  Created by devadmin on 13/02/2022.
//

import Foundation
import UIKit

extension UINavigationController {
    func popToViewController(ofClass: AnyClass, animated: Bool = true) {
        if let vc = viewControllers.last(where: {$0.isKind(of: ofClass)}) {
            popToViewController(vc, animated: animated)
        }
    }
}
