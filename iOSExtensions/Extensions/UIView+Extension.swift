//
//  UIView+Extension.swift
//  Limou Cloud
//
//  Created by developer on 18/03/2021.
//

import UIKit

extension UIView {
    
    func addBorder(vBorder: ViewBorder, color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.name = vBorder.rawValue
        switch vBorder {
        case .left:
            border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
        case .right:
            border.frame = CGRect(x: self.frame.size.width - width, y: 0, width: width, height: self.frame.size.height)
        case .top:
            border.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: width)
        case .bottom:
            border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: width)
        }
        self.layer.addSublayer(border)
    }
    
    func fadeTransition(_ duration: CFTimeInterval) {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.fade
        animation.duration = duration
        layer.add(animation, forKey: CATransitionType.fade.rawValue)
    }
    
    func applyNavBarConstraints(size: (width: CGFloat, height: CGFloat)) {
        let widthConstraint = self.widthAnchor.constraint(equalToConstant: size.width)
        let heightConstraint = self.heightAnchor.constraint(equalToConstant: size.height)
        heightConstraint.isActive = true
        widthConstraint.isActive = true
    }
    
    func updateBorder(color: UIColor? = .clear) {
        self.layer.borderColor = color?.cgColor
        self.layer.borderWidth = 1
    }
    
    func updateBorder(color: UIColor? = .clear, border: CGFloat = 1) {
        self.layer.borderColor = color?.cgColor
        self.layer.borderWidth = border
    }
    
    func round() {
        self.layer.cornerRadius = self.bounds.height / 2
        self.layer.masksToBounds = true
    }
    
    func round(_ round: CGFloat) {
        self.layer.cornerRadius = round
        self.layer.masksToBounds = true
    }
    
    func round(_ corners: UIRectCorner, radius: CGFloat) {
        if #available(iOS 11.0, *) {
            clipsToBounds = true
            layer.cornerRadius = radius
            layer.maskedCorners = CACornerMask(rawValue: corners.rawValue)
        } else {
            let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            layer.mask = mask
        }
    }

    var globalPoint: CGPoint? {
        return self.superview?.convert(self.frame.origin, to: nil)
    }
    
    var globalFrame: CGRect? {
        return self.superview?.convert(self.frame, to: nil)
    }
}
