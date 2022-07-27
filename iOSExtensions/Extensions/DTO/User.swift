    //
    //  LogInModel.swift
    //  AegisRideriOS
    //
    //  Created by Maxwell Ehiawey on 30/10/2021.
    //

import Foundation
import AuthenticationServices
struct LogInAuth: Codable {
    let status: String
    let detail: String
    let data: LogInData
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case detail = "detail"
        case data = "data"
    }
}
struct  LogInData: Codable {
    let refresh: String
    let access: String
    let user: LoginUser
    enum CodingKeys: String, CodingKey {
        case refresh = "refresh"
        case access = "access"
        case user = "user"
    }
}
    // MARK: - User
struct LoginUser: Codable {
    let email: String?
    let userKey: String?
    enum CodingKeys: String, CodingKey {
        case email = "email"
        case userKey = "user_key"
    }
}

//struct VerifiedResetCode: Codable {
//    let data: DataClass
//}
//    // MARK: - DataClass
//struct DataClass: Codable {
//    let userKey: String
//    let detail: String
//    enum CodingKeys: String, CodingKey {
//        case detail = "detail"
//        case userKey = "user_key"
//    }
//}

struct VerifiedResetCode: Codable {
    let status: String
    let detail: String
    let data: DataClass
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case detail = "detail"
        case data = "data"
    }
}
    // MARK: - DataClass
struct DataClass: Codable {
    let userKey: String
    enum CodingKeys: String, CodingKey {
        case userKey = "user_key"
    }
}


struct GeneralPairDTO: Codable {
    let status: String
    let detail: String
}
    // struct user that login with apple id
struct AppleUser: Codable {
    let userId: String
    let firstName: String
    let lastName: String
    let email: String
    
    init?(_ credentials: ASAuthorizationAppleIDCredential) {
        guard
            let firstName = credentials.fullName?.givenName,
            let lastName = credentials.fullName?.familyName,
            let email = credentials.email
        else { return nil }
        
        self.userId = credentials.user
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
    }
    
    init(_ id: String) {
        self.userId = id
        self.firstName = ""
        self.lastName = ""
        self.email = ""
    }
}

enum AuthProvider: String {
    case signInWithApple
}

    // MARK: - Message
//struct Message: Codable {
//    let tokenClass: String?
//    let tokenType: String?
//    let message: String?
//    
//    enum CodingKeys: String, CodingKey {
//        case tokenClass = "token_class"
//        case tokenType = "token_type"
//        case message = "message"
//    }
//}
