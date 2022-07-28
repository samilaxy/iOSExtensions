//
//  TextField+Extesnion.swift
//  Limou Cloud
//
//  Created by developer on 19/03/2021.
//

import Foundation
import UIKit

extension UITextField {
    func updatePlaceHolder(_ color: UIColor? = UIColor(named: "TextColor")) {
        if let color = color {
            self.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "",
                                                            attributes: [NSAttributedString.Key.foregroundColor: color])
        }
    }
    
    func confirmDelagte(to view: UIViewController, with type: UIReturnKeyType) {
        self.delegate = view as? UITextFieldDelegate
        self.returnKeyType = type
    }
    
    func allowedLength(_ max: Int, _ range: NSRange, _ string: String) -> Bool {
        // check max length
        let currentString: NSString = self.text as NSString? ?? ""
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= max
    }
    
    func allowed(characterSet: String, _ string: String) -> Bool {
        let allowedCharacters = characterSet
        let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
        let typedCharacterSet = CharacterSet(charactersIn: string)
        let alphabet = allowedCharacterSet.isSuperset(of: typedCharacterSet)
        return alphabet
    }
    
    func setLeftPaddingPoints(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    func setRightPaddingPoints(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = 
    }

   @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
}
