//
//  AppSingleton.swift
//  AegisRiderCommunityApp
//
//  Created by Abdul Suraj on 05/02/2022.
//

import Foundation
import UIKit
import FittedSheets

enum IPHONESIZE: String {
    case Iphone12
    case Iphone10
    case other
    case none
}

class AppSingleton: NSObject {
    
    // MARK: - Shared instance
    static let shared = AppSingleton()
    
    // MARK: - Shared Variables
    // APP Delegate
    let appDelegate: AppDelegate!
    
    // App Variables
    //    var airports = [Airport]()
    
    var page = 1
    var pageStatus = [false, false, false, false]
    
    // Formators
    let timeFormate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        return formatter
    }()
    
    let checkList: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/YYYY"
        return formatter
    }()
    
    let serverDateFormate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    let serverTimeFormate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        return formatter
    }()
    
    let dateFormate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy" // "yyyy-MM-dd" //
        return formatter
    }()
    
    let serverFormate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    // MARK: - Init
    override init() {
        //        request = ChecklistRequestDTO()
        appDelegate = UIApplication.shared.delegate as? AppDelegate
    }
    
    // MARK: - Shared methods
    func getStoryboardReference(storyboard: StoryboardReference) -> UIStoryboard {
        return UIStoryboard(name: storyboard.rawValue, bundle: nil)
    }
    
    func navigateView(viewRef: ViewControllerReference, storyboard: StoryboardReference) -> UIViewController {
        let view = getStoryboardReference(storyboard: storyboard).instantiateViewController(withIdentifier: viewRef.rawValue)
        return view
    }
    
    func setRoot(_ view: UIViewController) {
        if let scene = UIApplication.shared.connectedScenes.first {
            guard let windowScene = (scene as? UIWindowScene) else { return }
            let window: UIWindow = UIWindow(frame: windowScene.coordinateSpace.bounds)
            self.appDelegate.window = window
            window.windowScene = windowScene
            window.rootViewController = view
            window.makeKeyAndVisible()
        }
    }
    
    func setNavigationRoot(_ view: UINavigationController) {
        if let scene = UIApplication.shared.connectedScenes.first {
            guard let windowScene = (scene as? UIWindowScene) else { return }
            let window: UIWindow = UIWindow(frame: windowScene.coordinateSpace.bounds)
            self.appDelegate.window = window
            window.windowScene = windowScene
            window.rootViewController = view
            window.makeKeyAndVisible()
        }
    }
    
    func openBottomSheet(_ view: UIViewController, _ destination: UIViewController, _ percent: Float = 0.50) {
        let sheetController = SheetViewController( controller: destination, sizes: [.percent(percent)])
        sheetController.cornerRadius = 20
        sheetController.dismissOnOverlayTap = true
        sheetController.dismissOnPull = true
        sheetController.autoAdjustToKeyboard = true
        sheetController.allowPullingPastMaxHeight = false
        sheetController.hasBlurBackground = true
        sheetController.blurEffect = UIBlurEffect(style: .systemChromeMaterialDark)
        sheetController.animateIn(duration: 0.5, completion: nil)
        view.present(sheetController, animated: true, completion: nil)
    }
    
    func setToDefault() {
        //        request = ChecklistRequestDTO()
        page = 1
        pageStatus = [false, false, false, false]
    }
    
    func checkStatus() -> Bool {
        let values = self.pageStatus.filter({$0 == false})
        return values.count == 0
    }
    
    func getServerFormatedDate(_ string: String) -> String {
        print("Display Formate is: \(string)")
        if let date = dateFormate.date(from: string) {
            let formatedDate = serverFormate.string(from: date)
            print("Server Formate is: \(formatedDate)")
            return formatedDate
        } else {
            print("Return the same formate: \(string)")
            return string
        }
    }
    
    func getDateString(_ string: String) -> String {
        // "2021-12-23T05:26:08.108425Z"
        let components = string.components(separatedBy: "T")
        
        // Date
        var dateString = components.first ?? ""
        
        // Time
        var timeString = components.last?.components(separatedBy: ".").first ?? ""
        if let time = serverTimeFormate.date(from: dateString + "T" + timeString) {
            timeString = time.timeAgoDisplay()
        }
        
        if let date = serverDateFormate.date(from: dateString) {
            dateString = dateFormate.string(from: date)
        }
        
        // Return date and time
        return "\(timeString)"
    }
    
    func cheeckIphoneX() -> Bool {
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 1136, 1334, 1920, 2208:
                return false
            case 2436, 2688, 1792:
                return true
            default:
                return false
            }
        } else {
            return false
        }
    }
}


extension UIDevice {
    var hasTopNotch: Bool {
        if #available(iOS 11.0, tvOS 11.0, *) {
            return UIApplication.shared.delegate?.window??.safeAreaInsets.top ?? 0 > 20
        }
        return false
    }
}
