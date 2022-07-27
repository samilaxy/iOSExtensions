//
//  UITabBarItem+Extension.swift
//  AegisRiderCommunityApp
//
//  Created by devadmin on 24/02/2022.
//

import Foundation
import UIKit
import Kingfisher

extension UITabBarItem {
    func setImage(_ url: String) {
        guard let url = URL(string: url) else {
            return
        }
        
        let resource = ImageResource(downloadURL: url)
        KingfisherManager.shared.retrieveImage(with: resource, options: nil, progressBlock: nil) { result in
            switch result {
            case .success(let value):
                let newImage = value.image.imageResized(to: CGSize(width: 20, height: 20)).rounded(with: UIColor(named: "ColorGreenAdaptive") ?? .black)
                DispatchQueue.main.async {
                    self.image = newImage
                    self.image = self.image?.withRenderingMode(.alwaysOriginal)
                }
            case .failure:
                return
            }
        }
    }
}

extension UIImage {
    func imageResized(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
    
    var roundedImage: UIImage {
        let rect = CGRect(origin:CGPoint(x: 0, y: 0), size: self.size)
        UIGraphicsBeginImageContextWithOptions(self.size, false, 1)
        UIBezierPath(
            roundedRect: rect,
            cornerRadius: self.size.height
        ).addClip()
        self.draw(in: rect)
        return UIGraphicsGetImageFromCurrentImageContext()!
    }

    func rounded(with color: UIColor, width: CGFloat = 2) -> UIImage? {
        let bleed = breadthRect.insetBy(dx: -width, dy: -width)
        UIGraphicsBeginImageContextWithOptions(bleed.size, false, scale)
        defer { UIGraphicsEndImageContext() }
        guard let cgImage = cgImage?.cropping(to: CGRect(origin: CGPoint(
            x: isLandscape ? ((size.width-size.height)/2).rounded(.down) : 0,
            y: isPortrait  ? ((size.height-size.width)/2).rounded(.down) : 0),
            size: breadthSize))
        else { return nil }
        UIBezierPath(ovalIn: .init(origin: .zero, size: bleed.size)).addClip()
        var strokeRect =  breadthRect.insetBy(dx: -width/2, dy: -width/2)
        strokeRect.origin = .init(x: width/2, y: width/2)
        UIImage(cgImage: cgImage, scale: 1, orientation: imageOrientation)
            .draw(in: strokeRect.insetBy(dx: width/2, dy: width/2))
        color.set()
        let line: UIBezierPath = .init(ovalIn: strokeRect)
        line.lineWidth = width
        line.stroke()
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
