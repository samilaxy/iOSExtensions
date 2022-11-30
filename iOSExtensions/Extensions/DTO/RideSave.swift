//
//  RideSave.swift
//  AegisRiderCommunityApp
//
//  Created by devadmin on 26/02/2022.
//

import Foundation

// MARK: - RideSave
/// DTO for RideSave, containes all ride save data
struct RideSave: Codable {

    var timestamp: String?
    var csvFileURl: URL?
    var startLocation = RideSaveLocation()
    var endLocation = RideSaveLocation()
    var wayPoin1Location = RideSaveLocation()
    var wayPoint2Location = RideSaveLocation()
    var wayPoint3Location = RideSaveLocation()
    
    // MARK: - Coding keys
    enum CodingKeys: String, CodingKey {
        case timestamp = "timestamp"
        case csvFileURl = "csvFileURl"
        case startLocation = "startLocation"
        case endLocation = "endLocation"
        case wayPoin1Location = "wayPoin1Location"
        case wayPoint2Location = "wayPoint2Location"
        case wayPoint3Location = "wayPoint3Location"
    }
    
    // MARK: - Initialser
    init() {
        timestamp = Utilities.Constants.blankStringValue
        csvFileURl = URL(string: Utilities.Constants.blankStringValue)
        startLocation = RideSaveLocation()
        endLocation = RideSaveLocation()
        wayPoin1Location = RideSaveLocation()
        wayPoint2Location = RideSaveLocation()
        wayPoint3Location = RideSaveLocation()
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
        timestamp = try values.decodeIfPresent(String.self, forKey: .timestamp)
        csvFileURl = try values.decodeIfPresent(URL.self, forKey: .csvFileURl)
        startLocation = try values.decodeIfPresent(RideSaveLocation.self, forKey: .startLocation) ?? RideSaveLocation()
        endLocation = try values.decodeIfPresent(RideSaveLocation.self, forKey: .endLocation) ?? RideSaveLocation()
        wayPoin1Location = try values.decodeIfPresent(RideSaveLocation.self, forKey: .wayPoin1Location) ?? RideSaveLocation()
        wayPoint2Location = try values.decodeIfPresent(RideSaveLocation.self, forKey: .wayPoint2Location) ?? RideSaveLocation()
        wayPoint3Location = try values.decodeIfPresent(RideSaveLocation.self, forKey: .wayPoint3Location) ?? RideSaveLocation()
    }
    
    // Encode data
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(timestamp, forKey: .timestamp)
        try container.encode(csvFileURl, forKey: .csvFileURl)
        try container.encode(startLocation, forKey: .startLocation)
        try container.encode(endLocation, forKey: .endLocation)
        try container.encode(wayPoin1Location, forKey: .wayPoin1Location)
        try container.encode(wayPoint2Location, forKey: .wayPoint2Location)
        try container.encode(wayPoint3Location, forKey: .wayPoint3Location)
    }
}

// MARK: - Location
/// DTO for RideSave, containes all ride save data
struct RideSaveLocation: Codable {

    var latitude: String?
    var longitude: String?
    var title: String?
    
    // MARK: - Coding keys
    enum CodingKeys: String, CodingKey {
        case latitude = "latitude"
        case longitude = "longitude"
        case title = "title"
    }
    
    // MARK: - Initialser
    init() {
        latitude = Utilities.Constants.blankStringValue
        longitude = Utilities.Constants.blankStringValue
        title = Utilities.Constants.blankStringValue
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
        latitude = try values.decodeIfPresent(String.self, forKey: .latitude)
        longitude = try values.decodeIfPresent(String.self, forKey: .longitude)
        title = try values.decodeIfPresent(String.self, forKey: .title)
    }
    
    // Encode data
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(longitude, forKey: .longitude)
        try container.encode(title, forKey: .title)
    }
}
