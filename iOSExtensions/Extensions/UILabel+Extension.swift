//
//  UILabel+Extension.swift
//  Limou Cloud
//
//  Created by developer on 19/03/2021.
//

import Foundation
import UIKit

extension UILabel {
    
    func applyFont(with fontFaily: FontFamily, _ point: CGFloat) {
        self.font = UIFont(name: fontFaily.rawValue, size: point)
    }
    func setMargins(_ margin: CGFloat = 10) {
        if let textString = self.text {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.firstLineHeadIndent = margin
            paragraphStyle.headIndent = margin
            paragraphStyle.tailIndent = -margin
            
            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))
            attributedText = attributedString
        }
    }
    
    func boldText(_ title: String, boldString: String, isBold: Bool = false, _ color: UIColor = .white, _ fontSize: CGFloat = 14, boldFont: String, regularFont: String) {
        let font = isBold ? UIFont(name: boldFont, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize, weight: .bold) : UIFont(name: regularFont, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
        let boldAtrributes: [NSAttributedString.Key: Any] = [ .font: font, .foregroundColor: color]
        let attributes: [NSAttributedString.Key: Any] = [.font: UIFont(name: regularFont, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize), .foregroundColor: color]
        let bold = NSMutableAttributedString(string: boldString, attributes: boldAtrributes)
        let simple = NSMutableAttributedString(string: title, attributes: attributes)
        
        // Combine
        let combination = NSMutableAttributedString()
        combination.append(simple)
        combination.append(bold)
        
        // Set title
        self.attributedText = combination
    }
    
    func setColor(forText:String, in text: String, color: UIColor) {
        let range = (text as NSString).range(of: forText)
        let attributedString = NSMutableAttributedString(string:text)
        attributedString.addAttribute(.foregroundColor, value: color, range: range)
        self.attributedText = attributedString
    }
    
    func setURL(forText:String, in text: String, color: UIColor) {
        let range = (text as NSString).range(of: forText)
        let attributedString = NSMutableAttributedString(string:text)
        attributedString.addAttributes([.link: "https://\(text)",
                                        .foregroundColor: color],
                                       range: range)
        self.isUserInteractionEnabled = true
        self.attributedText = attributedString
    }
    
}

extension NSAttributedString.Key {
    static let hyperlink = NSAttributedString.Key("hyperlink")
}
