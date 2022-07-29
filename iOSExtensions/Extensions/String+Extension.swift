//
//  String+Extension.swift
//  Limou Cloud
//
//  Created by developer on 19/05/2021.
//

import Foundation
import UIKit

var defaultLanguage: String!

extension String {
    
    // swiftlint:disable identifier_name
    func isEmail() -> Bool {
        let firstpart = "[A-Z0-9a-z]([A-Z0-9a-z._%+-]{0,30}[A-Z0-9a-z])?"
        let serverpart = "([A-Z0-9a-z]([A-Z0-9a-z-]{0,30}[A-Z0-9a-z])?\\.){1,5}"
        let emailRegex = firstpart + "@" + serverpart + "[A-Za-z]{2,8}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: self)
    }
    
    // Evaluate Password
    func isPassword() -> Bool {
        //  regex for password validations
    //    let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^{1}(?:.){6,}$")
        return passwordTest.evaluate(with: self)
    }
    
    // Evalute Facebook link
    // https://gist.github.com/marcgg/733592
    func isFacebookLink() -> Bool {
        //  regex for facebook link validations
        let facebookLinkTest = NSPredicate(format: "SELF MATCHES %@", "(?:(?:http|https):\\/\\/)?(?:www.)?facebook.com\\/(?:(?:\\w)*#!\\/)?(?:pages\\/)?(?:[?\\w\\-]*\\/)?(?:profile.php\\?id=(?=\\d.*))?([\\w\\\\-]*)?")
        return facebookLinkTest.evaluate(with: self)
    }
    
    // Evalute Instagram link
    // https://regex101.com/library/Ci3DA9
    //https://stackoverflow.com/questions/51744224/get-instagram-username-from-url-ignore-periods-with-regex
    func isInstagramLink() -> Bool {
        //  regex for instagram link validations
        let instagramLinkTest = NSPredicate(format: "SELF MATCHES %@", "(?:(?:http|https):\\/\\/)?(?:www.)?instagram.com\\/(?:(?:\\w)*#!\\/)?(?:pages\\/)?(?:[?\\w\\-]*\\/)?(?:profile.php\\?id=(?=\\d.*))?([\\w\\\\-]*)?")
        return instagramLinkTest.evaluate(with: self)
    }
    
    // Evalute Twitter link
    // https://stackoverflow.com/questions/6024848/regex-to-validate-a-twitter-url
    func isTwitterLink() -> Bool {
        //  regex for twitter link validations
        let twitterLinkTest = NSPredicate(format: "SELF MATCHES %@", "^((?:http://)?|(?:https://)?)?(?:www\\.)?twitter\\.com/(\\w+)$")
        return twitterLinkTest.evaluate(with: self)
    }
    
    // Evalute Whatsapp link
    func isWhatsApp() -> Bool {
        //  regex for Whatsapp link validations
        let whatsappTest = NSPredicate(format: "SELF MATCHES %@", "^(\\(?\\+?[0-9]*\\)?)?[0-9_\\- \\(\\)]*$")
        return whatsappTest.evaluate(with: self)
    }
    
    func isAlphabets() -> Bool {
        return NSPredicate(format: "SELF MATCHES %@", ".*[^A-Za-z ].*").evaluate(with: self)
        
    }
    
    // Make Encoded URL
    func encodedStringForUrl() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
    }
    
    // Width of string
    func width(_ font: UIFont) -> CGFloat {
        return self.size(withAttributes: [NSAttributedString.Key.font: font]).width
    }
    
    // height of string
    func height(_ font: UIFont) -> CGFloat {
        return self.size(withAttributes: [NSAttributedString.Key.font: font]).height
    }
    
    // Remove all white spaces
    func trim() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func trimWordSpace() -> String {
        return self.replacingOccurrences(of: " ", with: "")
    }
    
    func trimNewLine() -> String {
        return self.replacingOccurrences(of: "\n", with: "")
    }
    
    func newLine() -> String {
        return self.replacingOccurrences(of: "\\n", with: "\n")
    }
    
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(boundingBox.height)
    }
    
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(boundingBox.width)
    }
    func trunc(length: Int, trailing: String = "") -> String {
        return (self.count > length) ? self.prefix(length) + trailing : self
    }
    
    var htmlToAttributedString: NSAttributedString? {
        guard
            let data = self.data(using: .utf8)
        else { return nil }
        do {
            return try NSAttributedString(data: data, options: [
                NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html,
                NSAttributedString.DocumentReadingOptionKey.characterEncoding: String.Encoding.utf8.rawValue
            ], documentAttributes: nil)
        } catch let error as NSError {
            print(error.localizedDescription)
            return  nil
        }
    }
    
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
    
    var encodeEmoji: String {
        if let encodeStr = NSString(cString: self.cString(using: .nonLossyASCII)!, encoding: String.Encoding.utf8.rawValue) {
            return encodeStr as String
        }
        return self
    }
    
    var decodeEmoji: String {
        let data = self.data(using: String.Encoding.utf8)
        let decodedStr = NSString(data: data!, encoding: String.Encoding.nonLossyASCII.rawValue)
        if let str = decodedStr {
            return str as String
        }
        return self
    }
    
    // Gets first nth character
    func first(char: Int) -> String {
        return String(self.prefix(char))
    }
    
    // Gets last nth character
    func last(char: Int) -> String {
        return String(self.suffix(char))
    }
    
    // exclude first nth character
    func excludingFirst(char: Int) -> String {
        return String(self.suffix(self.count - char))
    }
    
    // exclude last nth character
    func excludingLast(char: Int) -> String {
        return String(self.prefix(self.count - char))
    }
}
