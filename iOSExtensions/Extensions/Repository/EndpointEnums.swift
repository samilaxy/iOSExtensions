    //
    //  EndpointEnums.swift
    //  AegisRider-iOS
    //
    //  Created by Abdul Suraj on 14/12/2021.
    //

import Foundation
import Alamofire
    /// Intercerptor for  HTTP requests
enum EndPointEnum {
        // User Repository
    case checkUser
    case login
    case registration
    case appleLogin
    case googleLogin
    case changePassword
    case sendPasswordResetMail
    
        // Endpoint for resending a verification code to a user to reset their password
    case resendEmail
    case resetPassword
    case verifyCode
    
        // accounts
    case editProfile
    case imageFileUpload
    case coverImageUpload
    case signedInUser
    
        // statistics
    case filterRides
    case startRide
    case startRideOffline
    case favouriteRide
    case deleteRide
    case allUserRides
    case singleUserRide
    case saveUserDevice
    case fetchPolyline
    case renameRide
    case uploadCSV
    case uploadVideo
    case deleteVideo
    case createSummarizedVideo
}

    /// defining end point types
extension EndPointEnum: EndPointType {
    var isAuthRequired: Bool {
        switch self {
            case .checkUser, .login, .resetPassword, .verifyCode, .registration, .appleLogin, .googleLogin, .sendPasswordResetMail, .resendEmail:
                return false
            case .imageFileUpload, .coverImageUpload, .editProfile, .signedInUser, .startRide, .startRideOffline, .changePassword, .favouriteRide, .deleteRide, .allUserRides, .singleUserRide, .saveUserDevice, .fetchPolyline, .renameRide, .filterRides, .uploadCSV, .uploadVideo, .deleteVideo, .createSummarizedVideo:
                return true
        }
    }
        // is Json encoded
    var isJSONEncoded: Bool {
        switch self {
            case .checkUser, .login, .resetPassword, .verifyCode, .registration, .appleLogin,.googleLogin, .changePassword, .sendPasswordResetMail, .resendEmail, .signedInUser, .editProfile, .startRide, .startRideOffline, .favouriteRide, .deleteRide, .allUserRides, .singleUserRide, .saveUserDevice, .fetchPolyline, .renameRide, .filterRides, .deleteVideo, .createSummarizedVideo:
                return true
            case .imageFileUpload, .coverImageUpload, .uploadCSV, .uploadVideo:
                return false
        }
    }
        // is http request methods
    var httpMethod: HTTPMethod {
        switch self {
                    // Post Method
            case .checkUser, .login, .resetPassword, .verifyCode, .registration, .appleLogin, .googleLogin, .sendPasswordResetMail, .resendEmail, .startRide, .startRideOffline, .favouriteRide, .saveUserDevice, .allUserRides, .renameRide, .filterRides, .uploadCSV, .uploadVideo, .deleteVideo, .createSummarizedVideo:
                return .post
                    // GET Method
            case .signedInUser, .singleUserRide, .fetchPolyline:
                return .get
                    // PUT method
            case  .changePassword, .imageFileUpload, .coverImageUpload, .editProfile:
                return .put
                    // delete Method
            case .deleteRide:
                return .delete
        }
    }
        // urls
    var url: String? {
        
        let url = APIURLs()
        
        switch self {
            // User Repository
            case .checkUser:
                return url.checkUser
            case .login:
                return url.login
            case .appleLogin:
                return url.appleLogin
            case .googleLogin:
                return url.googleLogin
            case .registration:
                return url.registration
            case .resetPassword:
                return url.resetPassword
            case .verifyCode:
                return url.verifyCode
            case .changePassword:
                return url.changePassword
            case .sendPasswordResetMail:
                return url.sendPasswordResetMail
            case .resendEmail:
                return url.resendEmail
                    // accounts
            case .signedInUser:
                return url.signedInUser
            case .editProfile:
                return url.editProfile
                    // media
            case .imageFileUpload:
                return url.imageFileUpload
            case .coverImageUpload:
                return url.coverImageUpload
                    // statistics
            case .startRide:
                return url.startRide
            case .startRideOffline:
                return url.startRide
            case .favouriteRide:
                return url.favouriteRide
            case .deleteRide:
                return url.deleteRide
            case .allUserRides:
                return url.allUserRides
            case .singleUserRide:
                return url.singleUserRide
            case .saveUserDevice:
                return url.saveUserDevice
            case .fetchPolyline:
                return url.fetchPolyline
            case .renameRide:
                return url.renameRide
            case .filterRides:
                return url.filterRides
            case .uploadCSV:
                return url.uploadCSV
            case .uploadVideo:
                return url.uploadVideo
            case .deleteVideo:
                return url.deleteVideo
            case .createSummarizedVideo:
                return url.createSummarizedVideo
        }
    }
}
