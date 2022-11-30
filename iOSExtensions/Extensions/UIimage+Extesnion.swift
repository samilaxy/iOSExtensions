//
//  UIimage+Extesnion.swift
//  Limou Cloud
//
//  Created by developer on 19/03/2021.
//

import Foundation
import UIKit
import Kingfisher
import SwiftUI

class ImageToken: ImageDownloadRequestModifier {
    let token:String
    
    init(_ token:String) {
        self.token = token
    }
    
    func modified(for request: URLRequest) -> URLRequest? {
        var request = request
        request.addValue(token, forHTTPHeaderField: Utilities.Headers.auth)
        return request
    }
}
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}



extension UIImageView {
    func handleMainKSC(_ isDark: Bool) {
        self.image = UIImage(named: isDark ? "darkBG" : "lightBG")
    }
    
    func handleRegStepOne(_ isDark: Bool) {
        self.image = UIImage(named: isDark ? "registerBottomDark" : "registerBottomLight")
    }
    
    func setImage(_ image: UIImage?, animated: Bool = true) {
        let duration = animated ? 0.3 : 0.0
        UIView.transition(with: self, duration: duration, options: .transitionCrossDissolve, animations: {
            self.image = image
        }, completion: nil)
    }
    
    func setImage(_ url: String, _ isProfileImages: Bool) {
        print("url: \(url)")
        self.kf.indicatorType = .activity
        self.kf.setImage(with: URL(string: url.encodedStringForUrl()), placeholder: UIImage(named: Utilities.Assets.placeholderimg))
    }
    
    func uploadWithLoader(_ isShowLoading: Bool) {
        if isShowLoading {
            let loading = UIActivityIndicatorView()
            loading.frame = CGRect(x: (self.frame.width / 2) - 12.5, y: (self.frame.height / 2) - 12.5, width: 25, height: 25)
            loading.color = .white
            loading.style = .medium
            loading.tag = LoadingTag
            self.addSubview(loading)
            loading.startAnimating()
            
            self.alpha = 0.5
        } else {
            if let animationView = self.viewWithTag(LoadingTag) as? UIActivityIndicatorView {
                if animationView.isAnimating {
                    animationView.removeFromSuperview()
                }
            }
            
            self.alpha = 1.0
        }
    }
    
    func ofColor(_ color: UIColor) {
        self.image = self.image?.withRenderingMode(.alwaysTemplate)
        self.tintColor = color
    }
    
}

extension UIImage {
    func getPixelColor(pos: CGPoint) -> UIColor {
        let pixelData = self.cgImage!.dataProvider!.data
        let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
        let pixelInfo: Int = ((Int(self.size.width) * Int(pos.y)) + Int(pos.x)) * 4
        let r = CGFloat(data[pixelInfo]) / CGFloat(255.0)
        let g = CGFloat(data[pixelInfo+1]) / CGFloat(255.0)
        let b = CGFloat(data[pixelInfo+2]) / CGFloat(255.0)
        let a = CGFloat(data[pixelInfo+3]) / CGFloat(255.0)
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
    public class func gifImageWithData(_ data: Data) -> UIImage? {
            guard let source = CGImageSourceCreateWithData(data as CFData, nil) else {
                print("image doesn't exist")
                return nil
            }
            
            return UIImage.animatedImageWithSource(source)
        }
        
        public class func gifImageWithURL(_ gifUrl:String) -> UIImage? {
            guard let bundleURL:URL? = URL(string: gifUrl)
                else {
                    print("image named \"\(gifUrl)\" doesn't exist")
                    return nil
            }
            guard let imageData = try? Data(contentsOf: bundleURL!) else {
                print("image named \"\(gifUrl)\" into NSData")
                return nil
            }
            
            return gifImageWithData(imageData)
        }
        
        public class func gifImageWithName(_ name: String) -> UIImage? {
            guard let bundleURL = Bundle.main
                .url(forResource: name, withExtension: "gif") else {
                    print("SwiftGif: This image named \"\(name)\" does not exist")
                    return nil
            }
            guard let imageData = try? Data(contentsOf: bundleURL) else {
                print("SwiftGif: Cannot turn image named \"\(name)\" into NSData")
                return nil
            }
            
            return gifImageWithData(imageData)
        }
        
        class func delayForImageAtIndex(_ index: Int, source: CGImageSource!) -> Double {
            var delay = 0.1
            
            let cfProperties = CGImageSourceCopyPropertiesAtIndex(source, index, nil)
            let gifProperties: CFDictionary = unsafeBitCast(
                CFDictionaryGetValue(cfProperties,
                    Unmanaged.passUnretained(kCGImagePropertyGIFDictionary).toOpaque()),
                to: CFDictionary.self)
            
            var delayObject: AnyObject = unsafeBitCast(
                CFDictionaryGetValue(gifProperties,
                    Unmanaged.passUnretained(kCGImagePropertyGIFUnclampedDelayTime).toOpaque()),
                to: AnyObject.self)
            if delayObject.doubleValue == 0 {
                delayObject = unsafeBitCast(CFDictionaryGetValue(gifProperties,
                    Unmanaged.passUnretained(kCGImagePropertyGIFDelayTime).toOpaque()), to: AnyObject.self)
            }
            
            delay = delayObject as! Double
            
            if delay < 0.1 {
                delay = 0.1
            }
            
            return delay
        }
        
        class func gcdForPair(_ a: Int?, _ b: Int?) -> Int {
            var a = a
            var b = b
            if b == nil || a == nil {
                if b != nil {
                    return b!
                } else if a != nil {
                    return a!
                } else {
                    return 0
                }
            }
            
            if a < b {
                let c = a
                a = b
                b = c
            }
            
            var rest: Int
            while true {
                rest = a! % b!
                
                if rest == 0 {
                    return b!
                } else {
                    a = b
                    b = rest
                }
            }
        }
        
        class func gcdForArray(_ array: Array<Int>) -> Int {
            if array.isEmpty {
                return 1
            }
            
            var gcd = array[0]
            
            for val in array {
                gcd = UIImage.gcdForPair(val, gcd)
            }
            
            return gcd
        }
        
        class func animatedImageWithSource(_ source: CGImageSource) -> UIImage? {
            let count = CGImageSourceGetCount(source)
            var images = [CGImage]()
            var delays = [Int]()
            
            for i in 0..<count {
                if let image = CGImageSourceCreateImageAtIndex(source, i, nil) {
                    images.append(image)
                }
                
                let delaySeconds = UIImage.delayForImageAtIndex(Int(i),
                    source: source)
                delays.append(Int(delaySeconds * 1000.0)) // Seconds to ms
            }
            
            let duration: Int = {
                var sum = 0
                
                for val: Int in delays {
                    sum += val
                }
                
                return sum
            }()
            
            let gcd = gcdForArray(delays)
            var frames = [UIImage]()
            
            var frame: UIImage
            var frameCount: Int
            for i in 0..<count {
                frame = UIImage(cgImage: images[Int(i)])
                frameCount = Int(delays[Int(i)] / gcd)
                
                for _ in 0..<frameCount {
                    frames.append(frame)
                }
            }
            
            let animation = UIImage.animatedImage(with: frames,
                duration: Double(duration) / 1000.0)
            
            return animation
        }
}
