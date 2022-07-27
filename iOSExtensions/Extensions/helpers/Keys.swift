//
//  Keys.swift
//  AegisRider-iOS
//
//  Created by Abdul Suraj on 14/12/2021.
//

import Foundation

// MARK: - RESPONSE KEYS
struct ResponseKeys {
    static let DETAIL = "detail"
    static let MESSAGE = "message"
    static let ACCESS_TOKEN = "access"
    static let REFRESH_TOKEN = "refresh"
    static let USER_KEY = "user_key"
    static let ACCOUNT_ACTIVATED = "account_activated"
    static let IS_ACTIVE = "is_active"
}

// MARK: - API KEYS
struct ApiKeys {
    static let EMAIL = "email"
    static let PASSWORD = "password"
    static let OLDPASSWORD = "old_password"
    static let NEWPASSWORD = "new_password"
    static let CONFIRMPASSWORD = "confirm_password"
    static let RESETCODE = "reset_code"
    static let USERKEY = "user_key"
    static let APPLEID = "apple_id"
    static let LASTNAME = "last_name"
    static let FIRSTNAME = "first_name"
    static let googleAuthToken = "token"
        // Profile keys
    static let FULLNAME = "full_name"
    static let DOB = "dob"
    static let WEIGHT = "weight"
    static let WEIGHTUNIT = "weight_unit"
    static let HEIGHT = "height"
    static let HEIGHTUNIT = "height_unit"
    static let ADDRESS = "address"
    static let PHONE = "phone"
    static let MOBILE = "mobile"
    static let OTHEREMAIL = "other_email"
    static let COUNTRY = "country"
    static let CITY = "city"
    static let BIKE = "bike"
    static let POSTALCODE = "postal_code"
    static let FACEBOOK = "facebook"
    static let INSTAGRAM = "instagram"
    static let TWITTER = "twitter"
    static let WHATSAPP = "whatsapp"
    
    static let phoneCountry = "phone_country"
    static let mobileCountry = "mobile_country"
    static let whatsappCountry = "whatsapp_country"
    
    //Rides Keys
    static let ISFAVOURITE = "is_favourite"
    static let RIDENAME = "ride_title"
    static let TIMESTAMP = "timestamp"
    // Devices Keys
    static let DEVICEID = "device_id"
    static let DEVICESTATUS = "device_status"
    static let DEVICENAME = "device_name"
    // start ride
    static let ISMOBILE = "is_mobile"
    static let RIDETITLE = "ride_title"
    static let STARTLAT = "start_lat"
    static let STARTLON = "start_lon"
    static let ENDLAT = "end_lat"
    static let ENDLON = "end_lon"
    static let WAYPOINT1LAT = "waypoint1_lat"
    static let WAYPOINT1LON = "waypoint1_lon"
    static let WAYPOINT2LAT = "waypoint2_lat"
    static let WAYPOINT2LON = "waypoint2_lon"
    static let WAYPOINT3LAT = "waypoint3_lat"
    static let WAYPOINT3LON = "waypoint3_lon"
    //Get all user rides
    static let FACTOR = "factor"
    static let ORDER = "order"
    static let PAGE = "page"
    //video upload
    static let NUMBEROFVIDEOS = "number_of_videos"
    static let VIDEOTITLE = "video_title"
    static let VIDEOPATH = "video_path"
    static let VIDEOID =   "video_id"
}
