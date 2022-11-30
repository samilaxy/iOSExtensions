//
//  UserRepository.swift
//  AegisRider-iOS
//
//  Created by Abdul Suraj on 14/12/2021.
//
import Foundation
import Alamofire
import AuthenticationServices
import SwiftyJSON

final class UserRepository {
    
    // generic request
    func nonParamRequest( timeStamp: String = "", endPoint: EndPointEnum, completion: @escaping CompletionNetworkAny) {
        guard let requestedURL = endPoint.url else {
            return completion((false, "URL is not valid", ""))
        }
        func getRightEndPoint() -> String {
            var endpointUsed = requestedURL
            if endPoint == .deleteRide || endPoint == .singleUserRide || endPoint == .fetchPolyline{
                endpointUsed = requestedURL + timeStamp
            } else if endPoint == .createSummarizedVideo  {
                endpointUsed = requestedURL 
            } else {
                endpointUsed = requestedURL
            }
            return endpointUsed
        }
        NetworkManager.shared.makeNonParamRequest(getRightEndPoint(), endPoint.httpMethod, isJsonEncoded: endPoint.isJSONEncoded, isAuthReq: endPoint.isAuthRequired) { result in
            if let resultValue = result as? (Bool, JSON, String, StatusCodes) {
                if resultValue.0 {
                    
                    // endpoint is login
                    if endPoint == .signedInUser {
                        if let profileDetail = try? JSONDecoder().decode(NewGeneralProfile.self, from: resultValue.1.rawData()) {
                            AppDefaults.shared.currentUser = profileDetail

                                // send notification
                            NotificationCenter.default.post(name: .UpdateProfile, object: nil, userInfo: nil)

                            profileDetail.data?.fullName

                            UserData.saveMode()
                        }
                    } else if endPoint == .singleUserRide {
                        var stats: SingleRideDTO?
                        if let data = try? resultValue.1.rawData() {
                            if let filterStats = try? JSONDecoder().decode(SingleRideDTO.self, from: data) {
                                stats = filterStats
                            }
                        }
                        completion((resultValue.0, resultValue.2, stats))
                    }  else if endPoint == .fetchPolyline {
                        
                        var polyline: [PolyLineData] = []
                        var rideLocations: [RidePoints] = []
                        
                        let polylines = resultValue.1["data"]["polyline"]
                        let locations = resultValue.1["data"]["ride_locations"]
                        
                        if let data = try? polylines.rawData() {
                            if let polyLineData = try? JSONDecoder().decode([PolyLineData].self, from: data) {
                                polyline = polyLineData
                            }
                        }
                        
                        if let data = try? locations.rawData() {
                            if let rideLocationData = try? JSONDecoder().decode([RidePoints].self, from: data) {
                                rideLocations = rideLocationData
                            }
                        }
                        
                        completion((resultValue.0, resultValue.2, polyline, rideLocations))
                    }
                    
                    // Completion for case 200 and 201
                    completion((resultValue.0, resultValue.2, resultValue.3))
                } else {
                    completion((resultValue.0, resultValue.2, resultValue.3))
                }
            }
        }
    }
    // generic post request
    func makeGeneralRequest(with params: Params, timeStamp: String = "", endPoint: EndPointEnum, completion: @escaping CompletionNetworkAny) {
        func getTimestamp() -> String {
            return String(Int(Date().timeIntervalSince1970))
        }
        
        guard let requestedURL = endPoint.url else {
            return completion((false, "URL is not valid", ""))
        }
        NetworkManager.shared.request(requestedURL, endPoint.httpMethod, params, isJsonEncoded: endPoint.isJSONEncoded, isAuthReq: endPoint.isAuthRequired) { result in
            if let resultValue = result as? (Bool, JSON, String, StatusCodes) {
                print("resultValue is  \(resultValue)")
                if resultValue.0 {
                    if endPoint == .filterRides {
                        var stats: RideStats?
                        if let data = try? resultValue.1.rawData() {
                            if let filterStats = try? JSONDecoder().decode(RideStats.self, from: data) {
                                stats = filterStats
                            }
                        }
                        completion((resultValue.0, resultValue.2, stats))
                    } else {
                        
                        // endpoint is login
                        if endPoint == .login || endPoint == .appleLogin || endPoint == .googleLogin {
                            
                            // parsing User data
                            let userData = try? JSONDecoder().decode(LogInAuth.self, from: resultValue.1.rawData())
                            let token = userData?.data.access ?? ""
                            let userId = userData?.data.user.userKey ?? ""
                            // save token to user defaults
                            AppDefaults.shared.saveToken(token: "\(token)")
                            AppDefaults.shared.setUserLogin(true)
                            AppDefaults.shared.saveUserKey(userKey: "\(userId)")
                            if endPoint == .appleLogin {
                                let appleEmail = userData?.data.user.email ?? ""
                                func validateAppleEmail() -> (String) {
                                    if appleEmail.isEmail() {
                                        return (appleEmail)
                                    } else {
                                    return ""
                                    }
                                }
                                AppDefaults.shared.saveEmail(email: validateAppleEmail())
                            }
                        } else if endPoint == .verifyCode {
                            
                            let verifiedUser = try? JSONDecoder().decode(VerifiedResetCode.self, from: resultValue.1.rawData())
                            AppDefaults.shared.saveUserKey(userKey: verifiedUser?.data.userKey ?? "")
                            
                        }  else if endPoint == .editProfile {
//                            if let profileDetail = try? JSONDecoder().decode(NewGeneralProfile.self, from: resultValue.1.rawData()) {
//
//                                // Save Data
//                                AppDefaults.shared.currentUser = profileDetail
//                                UserData.saveMode()
//
//                                // send notification
//                                NotificationCenter.default.post(name: .UpdateProfile, object: nil, userInfo: nil)
//                            }
                        }
                        
                        completion((resultValue.0, resultValue.2, resultValue.3))
                    }
                    
                } else {
                    completion((resultValue.0, resultValue.2, resultValue.3))
                }
            }
        }
    }
    // generic post request
    func fetchRides(with params: Params, timeStamp: String = "", endPoint: EndPointEnum, completion: @escaping GenericModelCompletion<AllRidesDTO>) {
        // Request Intercepter
        // let endPoint = EndPointEnum.registration
        // New concept
        // Tuple -> single -> return multiple [Int,  Double, String, [String]]
        // Check if url is not nil
        
        // function to get current timestamp
        func getTimestamp() -> String {
            return String(NSDate().timeIntervalSince1970)
        }
        guard let requestedURL = endPoint.url else {
            return completion(false, "URL is not valid", nil)
        }
        
        // function to get the end point with or without timestamp
        func getRightEndPoint() -> String {
            var endpointUsed = requestedURL
            if  endPoint == .allUserRides {
                endpointUsed = requestedURL
            } else {
                endpointUsed = requestedURL
            }
            return endpointUsed
        }
        
        NetworkManager.shared.request(getRightEndPoint(), endPoint.httpMethod, params, isJsonEncoded: endPoint.isJSONEncoded, isAuthReq: endPoint.isAuthRequired) { result in
            if let resultValue = result as? (Bool, JSON, String, StatusCodes) {
                print("resultValue is  \(resultValue)")
                if resultValue.0 {
                    if endPoint == .allUserRides {
                        if let data = try? JSONDecoder().decode(AllRidesDTO.self, from: resultValue.1.rawData()) {
                            completion(true, "", data)
                        }
                    }
                    // Completion for case 200 and 201
                } else {
                    completion(false, resultValue.2, nil)
                }
            }
        }
    }
    // function to upload any image/picture🌆
    func uploadImage(_ image: UIImage, endPoint: EndPointEnum, name: String, fileName: String,completion: @escaping CompletionNetworkAny){
        guard let requestedURL = endPoint.url else {
            return completion((false, "URL is not valid", ""))
        }
        
        NetworkManager.shared.imagesUpload(requestedURL, endPoint.httpMethod, image, isJsonEncoded: endPoint.isJSONEncoded, name: name, fileName: fileName, mimeType: "image/*", isAuthReq: endPoint.isAuthRequired) { result in
            if let resultValue = result as? (Bool, JSON, String, StatusCodes) {
                if resultValue.0 {
                    
                    if endPoint == .imageFileUpload {
                        let profileImage = try? JSONDecoder().decode(ProfileImage.self, from: resultValue.1.rawData())
                        AppDefaults.shared.currentUser.data?.profileImage =  profileImage?.data.imageUrl ?? ""
                    } else {
                        let coverImage = try? JSONDecoder().decode(CoverImage.self, from: resultValue.1.rawData())
                        AppDefaults.shared.currentUser.data?.coverPhoto =  coverImage?.data.imageUrl ?? ""
                    }
                    
                    // send notification
                    NotificationCenter.default.post(name: .ImageUploaded, object: nil, userInfo: nil)
                    
                    // Save User Data
                    UserData.saveMode()
                    
                    // Completion
                    completion((resultValue.0, resultValue.2, resultValue.3))
                } else {
                    completion((resultValue.0, resultValue.2, resultValue.3))
                }
            }
        }
    }
    // function to upload any videos🌆  ⚠️ check if added parameters work
    func uploadVideo(with params: Params, _ video: Data, endPoint: EndPointEnum, name: String, fileName: String, mimeType: String, completion: @escaping CompletionNetworkAny){
        guard let requestedURL = endPoint.url else {
            return completion((false, "URL is not valid", ""))
        }
   
        print("Params: \(params)")
        print("fileName: \(fileName)")
        print("mimeType: \(mimeType)")
        print("name: \(name)")
        NetworkManager.shared.videoUpload(requestedURL, endPoint.httpMethod, video, params, isJsonEncoded: endPoint.isJSONEncoded, name: name, fileName: fileName, mimeType: "video/*", isAuthReq: endPoint.isAuthRequired) { result in
            if let resultValue = result as? (Bool, JSON, String, StatusCodes) {
                // Handle response
                if resultValue.0 {
                    // success
                    if endPoint == .uploadVideo {
                        // endPoint condition handling
                        completion((resultValue.0, resultValue.2, resultValue.3, resultValue.1["url"].stringValue))
                    } else {
                        // Completion
                        completion((resultValue.0, resultValue.2, resultValue.3, ""))
                    }
                } else {
                    completion((resultValue.0, resultValue.2, resultValue.3, ""))
                }
            }
        }
    }
    // function to upload csv
    func uploadCSV(csvUrl: URL, endPoint: EndPointEnum, name: String, fileName: String, params: Params, mimeType: String, timeStamp: String, completion: @escaping CompletionNetworkAny) {
        guard let requestedURL = endPoint.url else {
            return completion((false, "URL is not valid", ""))
        }
        NetworkManager.shared.upload(requestedURL, endPoint.httpMethod, csvUrl, params, isJsonEncoded: endPoint.isJSONEncoded, name: name, fileName: fileName, mimeType: "text/csv", isAuthReq: endPoint.isAuthRequired) { result in
            if let resultValue = result as? (Bool, JSON, String, StatusCodes) {
                if resultValue.0 {
                    
                    // Notification
                    NotificationCenter.default.post(name: .RideCreated, object: nil, userInfo: nil)
                    
                    // Completion
                    completion((resultValue.0, resultValue.2, resultValue.3))
                } else {
                    completion((resultValue.0, resultValue.2, resultValue.3))
                }
            }
        }
    }
    func requestedAppleFields(_ request: ASAuthorizationAppleIDRequest) {
        request.requestedScopes = [.fullName, .email]
    }
}

