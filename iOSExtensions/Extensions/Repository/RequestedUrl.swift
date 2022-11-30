    //
    //  RequestedUrl.swift
    //  AegisRider-iOS
    //
    //  Created by Abdul Suraj on 14/12/2021.
    //

import Foundation

    /// API Url types
enum UrlType: String {
    case auth = "auth/"
    case statistics = "statistics/"
    case accounts = "accounts/"
    case media = "media-service/"
    //case HERE = "users?"
    case azureService = "azure-service/"
    case none
}

    /// This class is used to set url endpoints
class EndPoints {
        // MARK: - Public variables
    var requestedURL: String?
        // MARK: - Required init
    required init(with URI: String, CODE: String = "", _ type: UrlType) {
        let configurators = AppConfiguration()
        switch type {
            case .statistics, .accounts, .auth:
                requestedURL = configurators.apiBaseURL + type.rawValue + URI
            case .media:
                requestedURL = configurators.apiBaseURL + type.rawValue + URI + CODE
            //case .HERE:
               // requestedURL = configurators.HEREAPIURL + type.rawValue + URI
            case .azureService:
                requestedURL = configurators.apiBaseURL + type.rawValue + URI + CODE
            case .none:
                requestedURL = configurators.apiBaseURL + URI
        }
    }
}
