//
//  StatsSummary.swift
//  AegisRiderCommunityApp
//
//  Created by devadmin on 20/02/2022.
//

import Foundation

struct StatsSummary: Codable {
    
	let total_ride_duration : String?
	let total_distance : Double?
	let max_speed : Double?

	enum CodingKeys: String, CodingKey {

		case total_ride_duration = "total_ride_duration"
		case total_distance = "total_distance"
		case max_speed = "max_speed"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		total_ride_duration = try values.decodeIfPresent(String.self, forKey: .total_ride_duration)
		total_distance = try values.decodeIfPresent(Double.self, forKey: .total_distance)
		max_speed = try values.decodeIfPresent(Double.self, forKey: .max_speed)
	}
    
    init()  {
        total_ride_duration = Utilities.Constants.blankStringValue
        total_distance = Utilities.Constants.doubleValue
        max_speed = Utilities.Constants.doubleValue
    }
}
