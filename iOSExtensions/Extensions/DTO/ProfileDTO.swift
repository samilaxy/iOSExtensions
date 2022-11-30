//
//  ProfileDTO.swift
//  AegisRider-iOS
//
//  Created by Maxwell Ehiawey on 02/02/2022.
//
import Foundation
struct ProfileImageData: Codable {
    let imageUrl: String
    enum CodingKeys: String, CodingKey {
        case imageUrl = "image_url"
    }
}
struct ProfileImage: Codable {
    let detail: String
    let status: String
    let data: ProfileImageData
    enum CodingKeys: String, CodingKey {
        case detail = "detail"
        case status = "status"
        case data = "data"
    }
}
struct CoverImageData: Codable {
    let imageUrl: String
    enum CodingKeys: String, CodingKey {
        case imageUrl = "image_url"
    }
}
struct CoverImage: Codable {
    let detail: String
    let status: String
    let data: CoverImageData
    enum CodingKeys: String, CodingKey {
        case detail = "detail"
        case status = "status"
        case data = "data"
    }
}

    // MARK: - GeneralProfile
    /// DTO for Profile, containes all profile data and info of the user
    struct NewGeneralProfile: Codable {
    let status : String?
    let detail : String?
    var data: NewUser?
        
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case detail = "detail"
        case data = "data"
    }
    
    init() {
        status = Utilities.Constants.blankStringValue
        detail = Utilities.Constants.blankStringValue
        data = nil
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        detail = try values.decodeIfPresent(String.self, forKey: .detail)
        data = try values.decodeIfPresent(NewUser.self, forKey: .data)
    }
}
   
// MARK: - User
struct NewUser: Codable {
    let userKey : String?
    var fullName: String?
    var profileImage: String?
    var coverPhoto: String?
    let phone: String?
    let mobile: String?
    let postalCode: String?
    let city: String?
    let otherEmail: String?
    let twitter: String?
    let whatsapp: String?
    let address: String?
    let dob: String?
    let weight: String?
    let height: String?
    let bike: String?
    let instagram: String?
    let country: String?
    let heightUnit: String?
    let weightUnit: String?
    let facebook: String?
    var phoneCountry: String?
    var mobileCountry: String?
    var whatsappCountry: String?
    
    // MARK: - Coding keys
    enum CodingKeys: String, CodingKey {
        case userKey = "user_key"
        case user = "user"
        case fullName = "full_name"
        case profileImage = "profile_image"
        case coverPhoto = "cover_photo"
        case phone = "phone"
        case mobile = "mobile"
        case postalCode = "postal_code"
        case city = "city"
        case otherEmail = "other_email"
        case twitter = "twitter"
        case whatsapp = "whatsapp"
        case address = "address"
        case dob = "dob"
        case weight = "weight"
        case height = "height"
        case bike = "bike"
        case instagram = "instagram"
        case country = "country"
        case heightUnit = "height_unit"
        case weightUnit = "weight_unit"
        case facebook = "facebook"
        case phoneCountry = "phone_country"
        case mobileCountry = "mobile_country"
        case whatsappCountry = "whatsapp_country"
    }
    
    // MARK: - Initialser
    init() {
        userKey = Utilities.Constants.blankStringValue
        fullName = Utilities.Constants.blankStringValue
        profileImage = Utilities.Constants.blankStringValue
        coverPhoto = Utilities.Constants.blankStringValue
        phone = Utilities.Constants.blankStringValue
        mobile = Utilities.Constants.blankStringValue
        postalCode = Utilities.Constants.blankStringValue
        city = Utilities.Constants.blankStringValue
        otherEmail = Utilities.Constants.blankStringValue
        twitter = Utilities.Constants.blankStringValue
        whatsapp = Utilities.Constants.blankStringValue
        address = Utilities.Constants.blankStringValue
        dob = Utilities.Constants.blankStringValue
        weight = Utilities.Constants.blankStringValue
        height = Utilities.Constants.blankStringValue
        bike = Utilities.Constants.blankStringValue
        instagram = Utilities.Constants.blankStringValue
        country = Utilities.Constants.blankStringValue
        heightUnit = Utilities.Constants.blankStringValue
        weightUnit = Utilities.Constants.blankStringValue
        facebook = Utilities.Constants.blankStringValue
        
        phoneCountry = Utilities.Constants.blankStringValue
        mobileCountry = Utilities.Constants.blankStringValue
        whatsappCountry = Utilities.Constants.blankStringValue
    }
    
    // MARK: - Decoding
    /// Creates a new instance by decoding from the given decoder.
    /// - Parameter decoder: the decoder to read data from.
    /// - Throws: This initializer throws an error if reading from the decoder fails, or if the data read is corrupted or otherwise invalid.
    init(from decoder: Decoder) throws {
        
        //  Returns the data stored in this decoder as represented in a container keyed by the given key type.
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        /// Decodes a value of the given type for the given key, if present.
        /// - throws: `DecodingError.typeMismatch` if the encountered encoded value  is not convertible to the requested type.
        userKey = try values.decodeIfPresent(String.self, forKey: .userKey)
        fullName = try values.decodeIfPresent(String.self, forKey: .fullName)
        profileImage = try values.decodeIfPresent(String.self, forKey: .profileImage)
        coverPhoto = try values.decodeIfPresent(String.self, forKey: .coverPhoto)
        phone = try values.decodeIfPresent(String.self, forKey: .phone)
        mobile = try values.decodeIfPresent(String.self, forKey: .mobile)
        postalCode = try values.decodeIfPresent(String.self, forKey: .postalCode)
        city = try values.decodeIfPresent(String.self, forKey: .city)
        otherEmail = try values.decodeIfPresent(String.self, forKey: .otherEmail)
        twitter = try values.decodeIfPresent(String.self, forKey: .twitter)
        whatsapp = try values.decodeIfPresent(String.self, forKey: .whatsapp)
        address = try values.decodeIfPresent(String.self, forKey: .address)
        dob = try values.decodeIfPresent(String.self, forKey: .dob)
        weight = try values.decodeIfPresent(String.self, forKey: .weight)
        height = try values.decodeIfPresent(String.self, forKey: .height)
        bike = try values.decodeIfPresent(String.self, forKey: .bike)
        instagram = try values.decodeIfPresent(String.self, forKey: .instagram)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        heightUnit = try values.decodeIfPresent(String.self, forKey: .heightUnit)
        weightUnit = try values.decodeIfPresent(String.self, forKey: .weightUnit)
        facebook = try values.decodeIfPresent(String.self, forKey: .facebook)
        
        phoneCountry = try values.decodeIfPresent(String.self, forKey: .phoneCountry)
        mobileCountry = try values.decodeIfPresent(String.self, forKey: .mobileCountry)
        whatsappCountry = try values.decodeIfPresent(String.self, forKey: .whatsappCountry)
    }
    
    // Encode data
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(userKey, forKey: .userKey)
        try container.encode(fullName, forKey: .fullName)
        try container.encode(profileImage, forKey: .profileImage)
        try container.encode(coverPhoto, forKey: .coverPhoto)
        try container.encode(phone, forKey: .phone)
        try container.encode(mobile, forKey: .mobile)
        try container.encode(postalCode, forKey: .postalCode)
        try container.encode(city, forKey: .city)
        try container.encode(otherEmail, forKey: .otherEmail)
        try container.encode(twitter, forKey: .twitter)
        try container.encode(whatsapp, forKey: .whatsapp)
        try container.encode(address, forKey: .address)
        try container.encode(dob, forKey: .dob)
        try container.encode(weight, forKey: .weight)
        try container.encode(height, forKey: .height)
        try container.encode(bike, forKey: .bike)
        try container.encode(instagram, forKey: .instagram)
        try container.encode(country, forKey: .country)
        try container.encode(heightUnit, forKey: .heightUnit)
        try container.encode(weightUnit, forKey: .weightUnit)
        try container.encode(facebook, forKey: .facebook)
        
        try container.encode(phoneCountry, forKey: .phoneCountry)
        try container.encode(mobileCountry, forKey: .mobileCountry)
        try container.encode(whatsappCountry, forKey: .whatsappCountry)
    }
}
