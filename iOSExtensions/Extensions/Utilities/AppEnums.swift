//
//  AppEnums.swift
//  AegisRiderCommunityApp
//
//  Created by Abdul Suraj on 06/02/2022.
//
import Foundation

// MARK: - user Idiom
enum UIUserInterfaceIdiom: Int {
    case phone // iPhone and iPod touch style UI
    case pad // iPad style UI
}

// MARK: - Alert Action

enum AlertAction {
    case logout
    case configureFaceId
    case BiomatricLockedout
    case Error
    case none
}

enum Dropdown: String {
    case sort = "Select sort"
    case search = "Select Filter"
    case years = "Select Year"
}

enum OnboardingStep {
    case selectFavouritePlayer
    case selectJersyNumber
    case SelectNickName
}

enum SettingSwitchTag: Int {
    case spiel = 0
    case news = 1
    case aktuelle = 2
    case faceId = 3
}

enum SuccessType {
    case polylineUpdate
    case login
    case logout
    case code
    case filterStats
    case checklistCreate
    case reservationCount
    case workStatus
    case profileUpdate
    case changePassword
    case resetPassword
    case setPassword
    case confirm
    case accountAddedToKeychain
    case fetchAccountsSuccess
    case fetchAccountsFailure
    case none
    case resendCode
    case verifyCode
    case withEmail
    case withSocial
    case authSucess
    case authFailed
    case profile
    case allUserRides
    case editProfileSuccess
    case deleteRide
    case startRide
    case csvUploaded
    case csvSaved
    case rideDetail
    
    case favorite
    case updateFavorite
    case deleteVideo
    case updateRide
    case uploadVideo
}

enum FontFamily: String {
    case latoThin = "Lato-Thin"
    case latoBold = "Lato-Bold"
    case american = "American Captain"
    case latoRegular = "Lato-Regular"
}

enum ViewBorder: String {
    case left, right, top, bottom
}

enum APIversion: String {
    case v1 = "api/v1/"
}
