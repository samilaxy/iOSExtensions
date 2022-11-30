//
//  RideStats.swift
//  AegisRiderCommunityApp
//
//  Created by devadmin on 20/02/2022.
//

import Foundation

struct RideStats : Codable {
    let status : String?
    let detail : String?
    let data : RideStatsData?


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
        data = try values.decodeIfPresent(RideStatsData.self, forKey: .data)
    }
}

struct RideStatsData : Codable {
    
    let summary : StatsSummary?
    let rides : [RideData]?

    enum CodingKeys: String, CodingKey {
        case summary = "summary"
        case rides = "rides"
    }
    
    init() {
        summary = StatsSummary()
        rides = []
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        summary = try values.decodeIfPresent(StatsSummary.self, forKey: .summary)
        rides = try values.decodeIfPresent([RideData].self, forKey: .rides)
    }
}

