import Foundation
import UIKit
import SystemConfiguration
import Alamofire
import SwiftyJSON
import SwiftUI
// MARK: - Network Manager

enum StatusCodes: Int {
    case success = 200
    case created = 201
    case userExistsButNotVerified = 320
    case userDoesNotExist = 310
    case emailDoesNotExist = 333
    case userAlreadyExists = 311
    case rideNotFound = 312
    case invalidCSV = 313
    case rideIsNotSupported = 314
    case rideAlreadyExists = 315
    case rideNoLongerExists = 316
    case fileAlreadyExists = 317
    case keyError = 318
    case userAccountDeactivated = 309
    case codeNotFound = 321
    case deviceAlreadyExists = 322
    case wrongePassword = 324
    case accountAlreadyExistWithAppleAuth = 326
    case accountAlreadyExistWithGoogleAuth = 327
    case accountAlreadyExistWithEmailAuth = 328
    case dataValidationError = 335
    case internalServerError = 500
    case unauthorized = 401
    case noInternetConnection = 400
    case none = 0
}

class NetworkManager: NSObject {
    
    // MARK: - Shared instance
    static let shared = NetworkManager()
    
    // MARK: - Shared Variables
    // MARK: - Variables
    
    // MARK: - Shared methods
    // MARK: - Check internet connection is available
    func isConnectedToNetwork() -> Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else {
            return false
        }
        
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return (isReachable && !needsConnection)
    }
    // MARK: - method to set http headers
    private func addAuthHeaders(_ isAuth: Bool = false, _ isJson: Bool = false) -> (Bool, HTTPHeaders) {
        var header: HTTPHeaders = [:]
        if isAuth {
            header[Utilities.Headers.auth] = "Bearer \( AppDefaults.shared.getToken())"
        }
        header[Utilities.Headers.contentType] = Utilities.Headers.JsonEncoded
        // DEVICE INFO👇🏽
//        header[Utilities.Headers.platform] = "\(UIDevice.current.systemName)"
//        header[Utilities.Headers.deviceOS] = "\(ProcessInfo().operatingSystemVersion.getFullVersion())"
//        header[Utilities.Headers.deviceID] = "\(UIDevice.current.identifierForVendor?.uuidString ?? "")"
        
        print("Headers -> \n", header)
        return (true, header)
    }
    // MARK: - method perform network http requests
    func request(_ requestedURl: String,_ method: HTTPMethod = .get, _ params: Params, isJsonEncoded: Bool, isAuthReq: Bool = false, completion: @escaping CompletionNetworkAny) {
        if !isConnectedToNetwork() {
            print("no internet")
            completion((false, JSON(), "No internet access, please connect to internet.", StatusCodes.noInternetConnection))
            return
        }
        print("reqUrl: \(requestedURl)")
        print("params: \(params)")
        print("http method: \(method.rawValue)")
        AF.request(requestedURl, method: method, parameters: params, encoding: (isJsonEncoded ? JSONEncoding.default : URLEncoding.default), headers: self.addAuthHeaders(isAuthReq).1)
            .validate(statusCode: 200..<600)
            .responseJSON { response in
                self.manageResponse(response: response, completion: completion)
            }
    }
    func makeNonParamRequest(_ requestedURl: String,_ method: HTTPMethod = .get, isJsonEncoded: Bool,isAuthReq: Bool = false,completion: @escaping CompletionNetworkAny) {
        if !isConnectedToNetwork() {
            print("no internet")
            completion((false, JSON(), "No internet access, please connect to internet.", StatusCodes.noInternetConnection))
            return
        }
        print("reqUrl:>>>>>>> \(requestedURl)")
        AF.request(requestedURl, method: method, parameters: nil, encoding: (isJsonEncoded ? JSONEncoding.default : URLEncoding.default), headers: self.addAuthHeaders(isAuthReq).1)
            .validate(statusCode: 200..<600)
            .responseJSON { response in
                self.manageResponse(response: response, completion: completion)
            }
    }
    func upload(_ requestedURl: String, _ method: HTTPMethod = .get, _ csvUrl: URL,_ params: Params, isJsonEncoded: Bool, name: String, fileName: String, mimeType: String, isAuthReq: Bool = false, completion: @escaping CompletionNetworkAny) {
        if !isConnectedToNetwork() {
            print("no internet")
            completion((false, JSON(), "No internet access, please connect to internet."))
            return
        }
        
        print("reqUrl: \(requestedURl)")
        AF.upload(multipartFormData: { multiPart in
            multiPart.append(csvUrl, withName: name, fileName: fileName, mimeType: mimeType)
                // import parameters
            for (key, value) in params {
                multiPart.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
            }
        }, to: requestedURl, method: method, headers: self.addAuthHeaders(isAuthReq).1)
            .uploadProgress(queue: .main, closure: { progress in
                // handle notification
                let progres = ["progress": progress.fractionCompleted]
                NotificationCenter.default.post(name: Notification.Name("NotificationIdentifier"), object: progres, userInfo: progres )
                // Recieve notification
            })
            .responseJSON { response  in
                // make this a generic function
                self.manageResponse(response: response, completion: completion)
            }
    }
    func imagesUpload(_ requestedURl: String, _ method: HTTPMethod = .get, _ image: UIImage, isJsonEncoded: Bool, name: String, fileName: String, mimeType: String, isAuthReq: Bool = false, completion: @escaping CompletionNetworkAny) {
        if !isConnectedToNetwork() {
            print("no internet")
            completion((false, JSON(), "No internet access, please connect to internet."))
            return
        }
        AF.upload(multipartFormData: { multiPart in
            print("endpoint-----------------\(requestedURl)")
            multiPart.append((image).jpegData(compressionQuality: 1.0)!, withName: name, fileName: fileName, mimeType: mimeType)
        }, to: requestedURl, method: method, headers: self.addAuthHeaders(isAuthReq).1)
            .uploadProgress(queue: .main, closure: { progress in
                // handle notification
                let uploadProgress = ["progress": progress.fractionCompleted]
                NotificationCenter.default.post(name: .UploadingProgress, object: uploadProgress, userInfo: uploadProgress)
                print("progress...\(progress.fractionCompleted)")
            })
            .responseJSON { response  in
                // make this a generic function
                self.manageResponse(response: response, completion: completion)
            }
    }
    
    func videoUpload(_ requestedURl: String, _ method: HTTPMethod = .get, _ video: Data, _ params: Params, isJsonEncoded: Bool, name: String, fileName: String, mimeType: String, isAuthReq: Bool = false, completion: @escaping CompletionNetworkAny) {
        
        if !isConnectedToNetwork() {
            print("no internet")
            completion((false, JSON(), "No internet access, please connect to internet."))
            return
        }
        
        print("reqUrl: \(requestedURl)")
        AF.upload(multipartFormData: { multiPart in
            // video to add
            multiPart.append((video), withName: name, fileName: fileName, mimeType: mimeType)
                // import parameters
            for (key, value) in params {
                multiPart.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
            }
        }, to: requestedURl, method: method, headers: self.addAuthHeaders(isAuthReq).1)
            .uploadProgress(queue: .main, closure: { progress in
                    // handle notification
                let uploadProgress = ["progress": progress.fractionCompleted]
                NotificationCenter.default.post(name: .UploadingProgress, object: uploadProgress, userInfo: uploadProgress)
                print("progress...\(progress.fractionCompleted)")
            })
            .responseJSON { response  in
                    // make this a generic function
                self.manageResponse(response: response, completion: completion)
            }
    }
    func manageResponse (response: AFDataResponse<Any>, completion: @escaping CompletionNetworkAny) {
        switch response.result {
        case .failure(let error):
            // Failure completion block
            let errorMessage = error.localizedDescription
            print("Error Message: ", errorMessage)
            completion((false, JSON(), "Something went wrong, please try again.", StatusCodes.internalServerError))
            print(error)
        case .success(let value):
//            let responseCode = response.response?.statusCode
         
            // Success block
            let json = JSON(value)
            let responseCode = json["code"].stringValue
            // Handling status code from the server
            let enumSuccessCode = StatusCodes(rawValue: Int(responseCode) ?? 200)
            if enumSuccessCode == .success || enumSuccessCode == .created {
                completion((true, json, json["detail"].stringValue, enumSuccessCode))
            } else {
                completion((false, json, json["detail"].stringValue, enumSuccessCode))
            }
        }
    }
}

extension OperatingSystemVersion {
    func getFullVersion(separator: String = ".") -> String {
        return "\(majorVersion)\(separator)\(minorVersion)\(separator)\(patchVersion)"
    }
}
