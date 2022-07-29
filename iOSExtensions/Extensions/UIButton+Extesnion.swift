//
//  UIButton+Extesnion.swift
//  Limou Cloud
//
//  Created by developer on 18/03/2021.
//

import Foundation
import UIKit
import Kingfisher

let LoadingTag = 100000000 // Tag

extension UIButton {
    
    func setImage(_ url: String) {
        self.imageView?.kf.indicatorType = .activity
       // self.kf.setImage(with: URL(string: url), for: .normal)
    }
    
    func manageLoader(_ visible: Bool, _ isChangeColor: Bool = true, isSocial: Bool = false) {
        if isSocial {
            if visible {
                addLoader()
            } else {
                removeLoader()
            }
        } else {
            if visible {
                addLoader(isChangeColor)
            } else {
                removeLoader(isChangeColor)
            }
        }
    }
    
    private func addLoader(_ isChangeColor: Bool) {
        let loading = UIActivityIndicatorView()
        loading.frame = CGRect(x: (self.frame.width / 2) - 12.5, y: (self.frame.height / 2) - 12.5, width: 25, height: 25)
        loading.color = .white
        loading.style = .medium
        loading.tag = LoadingTag
        self.addSubview(loading)
        loading.startAnimating()
        self.titleLabel?.isHidden = true
        self.isUserInteractionEnabled = false
        if isChangeColor {
            if let color = UIColor(named: "ColorGreenAdaptive") {
                self.configuration?.background.backgroundColor = color.withAlphaComponent(0.5)
            }
        }
    }
    
    private func removeLoader(_ isChangeColor: Bool) {
        if let animationView = self.viewWithTag(LoadingTag) as? UIActivityIndicatorView {
            if animationView.isAnimating {
                animationView.removeFromSuperview()
            }
        }
        
        
        if isChangeColor {
            if let color = UIColor(named: "ColorGreenAdaptive") {
                self.configuration?.background.backgroundColor = color
            }
        }
        
        self.titleLabel?.isHidden = false
        self.isUserInteractionEnabled = true
    }
    
    
    private func addLoader() {
        let loading = UIActivityIndicatorView()
        loading.frame = CGRect(x: (self.frame.width / 2) - 12.5, y: (self.frame.height / 2) - 12.5, width: 25, height: 25)
        loading.color = UIColor(named: "TextColor")
        loading.style = .medium
        loading.tag = LoadingTag
        self.addSubview(loading)
        loading.startAnimating()
        self.titleLabel?.isHidden = true
        self.isUserInteractionEnabled = false
        // self.configuration?.background.backgroundColor = .black
    }
    
    private func removeLoader() {
        if let animationView = self.viewWithTag(LoadingTag) as? UIActivityIndicatorView {
            if animationView.isAnimating {
                animationView.removeFromSuperview()
            }
        }
        // self.configuration?.background.backgroundColor = .clear
        self.titleLabel?.isHidden = false
        self.isUserInteractionEnabled = true
    }
}
