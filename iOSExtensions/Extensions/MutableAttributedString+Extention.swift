//
//  MutableAttributedString+Extention.swift
//  Limou Cloud
//
//  Created by Dev ILI on 15/04/2021.
//

import Foundation
import UIKit
extension NSMutableAttributedString {
    var fontSize: CGFloat { return 14 }
    
    func bold(_ value: String, boldFont: UIFont) -> NSMutableAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: boldFont
        ]
        self.append(NSAttributedString(string: value, attributes: attributes))
        return self
    }
    func normal(_ value: String, normalFont: UIFont) -> NSMutableAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: normalFont
        ]
        self.append(NSAttributedString(string: value, attributes: attributes))
        return self
    }
    func underlined(_ value: String, normalFont: UIFont) -> NSMutableAttributedString {
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: normalFont,
            .underlineStyle: NSUnderlineStyle.single.rawValue
            
        ]
        
        self.append(NSAttributedString(string: value, attributes: attributes))
        return self
    }
    
    func textColor(color: String) -> NSMutableAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(named: color)!
        ]
        self.append(NSAttributedString(string: color, attributes: attributes))
        return self
    }
}
