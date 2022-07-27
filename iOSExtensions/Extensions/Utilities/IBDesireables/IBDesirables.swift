//
//  IBDesirables.swift
//  Limou Cloud
//
//  Created by Husnain Ali on 13/10/2021.
//

import Foundation
import UIKit

@IBDesignable
extension UIView {
    @IBInspectable var borderColor: UIColor? {
        set {
            layer.borderColor = newValue!.cgColor
        }
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor:color)
            }
            else {
                return nil
            }
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius:CGFloat {
        set {
            layer.cornerRadius = newValue
            clipsToBounds = newValue > 0
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var cornerRadTL:CGFloat {
        set {
            layer.cornerRadius = newValue
            if #available(iOS 11.0, *) {
                layer.maskedCorners = [.layerMinXMinYCorner]
            } else {
                // Fallback on earlier versions
            }
            clipsToBounds = newValue > 0
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var cornerRadTR:CGFloat {
        set {
            layer.cornerRadius = newValue
            if #available(iOS 11.0, *) {
                layer.maskedCorners = [.layerMaxXMinYCorner]
            } else {
                // Fallback on earlier versions
            }
            clipsToBounds = newValue > 0
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var cornerRadBL:CGFloat {
        set {
            layer.cornerRadius = newValue
            if #available(iOS 11.0, *) {
                layer.maskedCorners = [.layerMinXMaxYCorner]
            } else {
                // Fallback on earlier versions
            }
            clipsToBounds = newValue > 0
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var cornerRadBR:CGFloat {
        set {
            layer.cornerRadius = newValue
            if #available(iOS 11.0, *) {
                layer.maskedCorners = [.layerMaxXMaxYCorner]
            } else {
                // Fallback on earlier versions
            }
            clipsToBounds = newValue > 0
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var corBRTR:CGFloat {
        set {
            layer.cornerRadius = newValue
            if #available(iOS 11.0, *) {
                layer.maskedCorners = [.layerMaxXMinYCorner,.layerMaxXMaxYCorner]
            } else {
                // Fallback on earlier versions
            }
            clipsToBounds = newValue > 0
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var corBLTL:CGFloat {
        set {
            layer.cornerRadius = newValue
            if #available(iOS 11.0, *) {
                layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner]
            } else {
                // Fallback on earlier versions
            }
            clipsToBounds = newValue > 0
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var padding:CGFloat {
        set {
            self.bounds = self.frame.insetBy(dx: newValue, dy: padding);
        }
        get {
            return self.bounds.origin.x
        }
    }
    
    class func loadFromNibNamed(_ nibNamed: String, bundle : Bundle? = nil,owner: AnyObject) -> UIView? {
        return UINib(
            nibName: nibNamed,
            bundle: bundle
        ).instantiate(withOwner: owner, options: nil)[0] as? UIView
    }
}
