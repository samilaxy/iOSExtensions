//
//  MaskView.swift
//  AegisRiderCommunityApp
//
//  Created by devadmin on 17/02/2022.
//

import Foundation
import UIKit

@IBDesignable
class UIImageViewWithMask: UIImageView {
    var maskImageView = UIImageView()
    
    @IBInspectable
    var maskImage: UIImage? {
        didSet {
            maskImageView.image = maskImage
            updateView()
        }
    }
    
    // This updates mask size when changing device orientation (portrait/landscape)
    override func layoutSubviews() {
        super.layoutSubviews()
        updateView()
    }
    
    func updateView() {
        if maskImageView.image != nil {
            maskImageView.frame = bounds
            mask = maskImageView
        }
    }
}
