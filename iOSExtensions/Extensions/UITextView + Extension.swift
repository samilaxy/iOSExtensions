//
//  UITextView + Extension.swift
//  Limou Cloud
//
//  Created by developer on 06/08/2021.
//

import Foundation
import UIKit

enum LinkType: String {
    case TermsOfUse = "https://aegisrider.com"
    case PrivacyPolicy = "https://aegisrider.com/"
}

extension UITextView {
    func setPrivacyText() {
        self.hyperLink(originalText: "By using our app, you confirm that you accept our \nTerms of Use and Privacy Policy.", linkTextsAndTypes: ["Terms of Use": LinkType.TermsOfUse.rawValue, "Privacy Policy": LinkType.PrivacyPolicy.rawValue])
    }
    
    private func hyperLink(originalText: String, linkTextsAndTypes: [String: String]) {
        
        let style = NSMutableParagraphStyle()
        style.alignment = .center
        
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(named: "TextColor") ?? UIColor.white, .font: UIFont(name: Utilities.FontFamily.light, size: 13) ?? .systemFont(ofSize: 13)
        ]
        
        let attributedOriginalText = NSMutableAttributedString(string: originalText)
        for linkTextAndType in linkTextsAndTypes {
            let linkRange = attributedOriginalText.mutableString.range(of: linkTextAndType.key)
            let fullRange = NSRange(location: 0, length: attributedOriginalText.length)
            attributedOriginalText.addAttribute(NSAttributedString.Key.link, value: linkTextAndType.value, range: linkRange)
            attributedOriginalText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red, range: linkRange)
            attributedOriginalText.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: fullRange)
            attributedOriginalText.addAttributes(attributes, range: fullRange)
        }
        self.attributedText = attributedOriginalText
        self.tintColor = UIColor(named: "LinkColor")
    }
}
