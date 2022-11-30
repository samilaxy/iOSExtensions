//
//  EndPointType.swift
//  AegisRider-iOS
//
//  Created by Abdul Suraj on 14/12/2021.
//

import Foundation
import Alamofire

protocol EndPointType {
    var url: String? { get }
    var httpMethod: HTTPMethod { get }
    var isAuthRequired: Bool { get }
    var isJSONEncoded: Bool { get }
}
