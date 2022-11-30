//
//  UINotification+Extension.swift
//  Limou Cloud
//
//  Created by developer on 24/03/2021.
//

import Foundation

extension Notification.Name {
    static let LoginBroadcast = Notification.Name(rawValue: "LoginBroadcast")
    static let SessionExpiredBroadcast = Notification.Name(rawValue: "SessionExpiredBroadcast")
    static let UpdateProfile = Notification.Name(rawValue: "UpdateProfile")
    static let RefreshData = Notification.Name(rawValue: "RefreshData")
    static let AppMode = Notification.Name(rawValue: "AppMode")
    static let UploadingProgress = Notification.Name("UploadingProgress")
    static let ImageUploaded = Notification.Name("ImageUploaded")
    
    static let NoInternet = Notification.Name("NoInternet")
    static let ConnectRetained = Notification.Name("ConnectRetained")
    static let CheckUploads = Notification.Name("CheckUploads")
    static let RideCreated = Notification.Name("RideCreated")
}
