//
//  Linespacing+Extension.swift
//  AegisRiderCommunityApp
//
//  Created by devadmin on 10/02/2022.
//

import Foundation
import UIKit


fileprivate func addSpaceing(_ text: String, _ spacing: CGFloat) -> NSMutableAttributedString {
    let attributedString = NSMutableAttributedString(string: text)
    attributedString.addAttribute(NSAttributedString.Key.kern, value: spacing, range: NSRange(location: 0, length: text.count))
    attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont(name: Utilities.FontFamily.light, size: 18) ?? .systemFont(ofSize: 18), range: NSRange(location: 0, length: text.count))
    return attributedString
}

extension UIButton{
    func addTextSpacing(_ spacing: CGFloat) {
        guard let text = self.titleLabel?.text else {
            return
        }
        self.setAttributedTitle(addSpaceing(text, spacing), for: .normal)
    }
}

extension UILabel{
    func addTextSpacing(_ spacing: CGFloat) {
        guard let text = self.text else {
            return
        }
        self.attributedText = addSpaceing(text, spacing)
    }
}

extension UITextField{
    func addPlaceholderSpacing(_ spacing: CGFloat) {
        guard let text = self.placeholder else {
            return
        }
        self.attributedText = addSpaceing(text, spacing)
    }
}
