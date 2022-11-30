//
//  TypeAliases.swift
//  AegisRider-iOS
//
//  Created by Abdul Suraj on 14/12/2021.
//

import Foundation
import SwiftyJSON
// MARK: - TypeAlias for data type
typealias Params = [String: Any]
typealias Images = UIImage
typealias DataParm = [String: AnyObject]

// MARK: - Completion Block
typealias ImageNetwork = (_ success: Bool, _ url: URL?) -> Void
typealias AlamofireCompletion = () -> Void
typealias CompletionNetwork = (_ success: Bool, _ result: JSON, _ message: String) -> Void
typealias CompletionAnimation = (_ success: Bool) -> Void
typealias AlertCompletion = () -> Void

// MARK: - Completion for Repositories
//typealias UserCompletion = (_ success: Bool, _ message: String, _ user: User?) -> Void
typealias GenericModelCompletion<Model> = (_ success: Bool, _ message: String, _ model: Model?) -> Void

// MARK: - Generic success completion
typealias GenericNetworkCompletion = (_ success: Bool, _ message: String) -> Void

// MARK: - Completion for login ViewModel
typealias LoginCompletion = (_ success: Bool, _ message: String) -> Void

// MARK: - Completion to return any
typealias CompletionNetworkAny = (_ result: Any) -> Void


