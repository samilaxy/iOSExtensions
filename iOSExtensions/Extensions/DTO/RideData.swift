//
//  RideData.swift
//  AegisRiderCommunityApp
//
//  Created by devadmin on 20/02/2022.
//

import Foundation

struct RideData : Codable {
	let total_hours : Double?
	let day_notation : String?
    let month_notation : String?
    let week_of_month : String?
    let year : String?

	enum CodingKeys: String, CodingKey {

		case total_hours = "total_hours"
        case year = "year"
        case month_notation = "month_notation"
        case week_of_month = "week_of_month"
		case day_notation = "day_notation"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
        total_hours = try values.decodeIfPresent(Double?.self, forKey: .total_hours) ?? 0
		day_notation = try values.decodeIfPresent(String?.self, forKey: .day_notation) ?? ""
        month_notation = try values.decodeIfPresent(String?.self, forKey: .month_notation) ?? ""
        week_of_month = try values.decodeIfPresent(String?.self, forKey: .week_of_month) ?? ""
        year = try values.decodeIfPresent(String?.self, forKey: .year) ?? ""
	}

    init() {
        total_hours = Utilities.Constants.doubleValue
        day_notation = Utilities.Constants.blankStringValue
        month_notation = Utilities.Constants.blankStringValue
        week_of_month = Utilities.Constants.blankStringValue
        year = Utilities.Constants.blankStringValue
    }
}
