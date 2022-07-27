//
//  Utilities.swift
//  AegisRider-iOS
//
//  Created by Abdul Suraj on 14/12/2021.
//

import Foundation
import UIKit
struct Utilities {
        // MARK: - Default Key
    struct Defaults {
        static let userDate = "userDate"
        static let userData = "userData"
        static let appMode = "appMode"
        static let applegoogleeLogin = "applegoogleeLogin"
        static let appleLogin = "appleLogin"
        static let googleLogin = "googleLogin"
        static let accessToken = "accessToken"
        static let refreshToken = "refreshToken"
        static let isLoggedIn = "isLoggedIn"
        static let isProfileUpdated = "isProfileUpdated"
        static let userId = "userKey"
        static let userEmail = "Email"
        static let userPassword = "password"
        static let unverifiedUser = "unverified"
        static let fullName = "fullName"
        static let height = "height"
        static let heightUnit = "heightUnit"
        static let weight = "weight"
        static let weightUnit = "weightUnit"
        static let bike = "bike"
        static let phone = "phone"
        static let mobile = "mobile"
        static let otherEmail = "otherEmail"
        static let address = "address"
        static let postalCode = "postalCode"
        static let city = "city"
        static let country = "country"
        static let facebook = "facebook"
        static let instagram = "instagram"
        static let twitter = "twitter"
        static let whatsapp = "whatsapp"
        static let profileImage = "profileImage"
        static let coverImage = "coverImage"
        static let localProfilemage = "locaIProfilemage"
        static let connState = "isConnected"
    }
        // MARK: - Headers
    struct Headers {
        static let contentType = "Content-Type"
        static let FormUrlEncoded = "application/x-www-form-urlencoded"
        static let JsonEncoded = "application/json"
        static let auth = "Authorization"
        static let authData = "Bearer "
        static let deviceOS = "OS-version "
        static let deviceID = "Device-ID"
        static let platform = "platform"
    }
        // MARK: - Pixel points
    struct PixelPoints  {
        static let mainEntranceElement = 24
        static let mainEntranceForm = 20
        static let signInPageElementSpacing = 12
        static let btnHeight  = 50
        static let textFieldHeight  = 50
        static let profilTextFieldHeight  = 40
        static let mainEntranceDividerHeight  = 50
        static let passwordField = 30
        static let mainPageLogo = 210.37   //210.37
        static let artTextAndEmailTextfield = 47.17
        static let generalBodyPadding = 16
    }
        // MARK: - Font family
    struct FontFamily {
        static let light = "Poppins-Light"
        static let medium = "Poppins-Medium"
        static let dark = "Poppins-Black"
        static let extraLight = "Poppins-ExtraLight"
        static let regular = "Poppins-Regular"
        static let thin = "Poppins-Thin"
        static let bold = "Poppins-Bold"
        static let semiBold = "Poppins-SemiBold"
        static let karlaRegular = "Karla-Regular"
    }
        // MARK: - Font sizes
    struct FontSizes {
        static let title0 = 18
        static let title1 = 17
        static let title2 = 16
        static let title3 = 15
        static let textField = 16
        static let buttons = 18
        static let orWord = 17
        static let appleBtn = 17
        static let footNote = 12
        static let errorText = 12
        static let profileFieldLabel = 14
    }
        // MARK: - Character spacing
    struct CharcterSpacing {
        static let title1 = 0.85
        static let title2 = 0.8
        static let textField = 0.96
        static let buttons = 1.08
        static let orWord = 0.34
        static let navbar = 0.3
        static let appleBtn = 0.34
        static let footNote = 0
        static let errorText = 0
        static let editProfileFieldLabel = 0.84
        static let editProfileNav = -0.01
        static let editProfileSectionLabel = 0.45
        static let editProfileSectionTitle = 0.9
        static let username = 0.57
        static let stats = 0.51
        static let statshead = 0.27
        static let statsnum = -0.38
        static let statsunits = 0.33
    }
        // MARK: - Color codes
    struct ColorScheme {
        static let mainColor = "ColorGreenAdaptive"
        static let textColor = "TextColor"
        static let overlayColor = "OverlayColor"
        static let btnBGColor = "BtnBGColor"
        static let profileTextfielOutline = "ProfileTextfieldOutline"
        static let profileTextfielEmailOutline = "ProfileTextfieldEmailOutline"
        static let profilefieldNameColor = "ProfilefieldNameColor"
        static let profileDateBackground = "ProfileDateBackgroundColor"
        static let profileDateText = "ProfileDateText"
        static let homePageColor = "HomePageColor"
        static let homePageBGColor = "HomePageBGColor"
        static let circleBorderColor = "CircleBorderColor"
        static let circleBorderColor1 = "CircleBorderColor-1"
        static let favoriteColor = "FavoriteColor"
        static let colorListBackground = "ColorListBackground"
        static let dateBackground = "DateBackgroundColor"
    }
        // MARK: - response codes
    struct ResponseCode {
        static let success = 200
        static let created = 201
        static let userExistsButNotVerified = 320
        static let userDoesNotExist = 310
        static let userAlreadyExists = 311
        static let rideNotFound = 311
        static let invalidCSV = 313
        static let rideIsNotSupported = 314
        static let rideAlreadyExists = 315
        static let rideNoLongerExists = 316
        static let fileAlreadyExists = 317
        static let keyError = 318
        static let userAccountDeactivated = 309
        static let codeNotFound = 321
        static let deviceAlreadyExists = 322
        static let accountAlreadyExistWithAppleAuth = 326
        static let internalServerError = 500
        static let unauthorized = 401
    }
        // MARK: - Color
    struct Colors {
        static let AppColor = UIColor(named: "ColorGreenAdaptive")
        static let textColor = UIColor(named: "TextColor")
        static let linkColor = UIColor(named: "ColorOrange")
    }
        // MARK: - Constant Value
    struct Constants {
        static let blankStringValue = ""
        static let boolValue = false
        static let intValue = 0
        static let doubleValue = 0.0
    }
        // MARK: - Images
    struct Assets {
        static let appLogo = "AppLogo"
        static let placeholderimg = "placeholderimg"
            //        static let kscPayBtnbg = UIImage(named: "kscPayBtnbg")
    }
    
    struct NotificationCentre {
        static let locationChanged = "locationChanged"
    }
    
    struct JetsonValues {
        static let reset = "1"
        static let launchAr = "2"
        static let navigate = "3"
        static let one = "4"
        static let two = "5"
        static let three = "6"
        static let four = "7"
        static let five = "18"
        static let small = "19"
        static let medium = "20"
        static let large = "21"
        static let extraLarge = "22"
        static let hudDistanceDecrease = "8"
        static let hudDistanceIncrease = "9"
        static let hudScaleDecrease = "10"
        static let hudScaleIncrease = "11"
        static let hudHeightDecrease = "12"
        static let hudHeightIncrease = "13"
        static let hudPitchDecrease = "14"
        static let hudPitchIncrease = "15"
        static let eyePitchDecrease = "16"
        static let eyePitchIncrease = "17"
        static let disconnect = "999"
    }
    
}
