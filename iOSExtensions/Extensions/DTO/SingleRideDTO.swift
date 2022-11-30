//
//  SingleRideDTO.swift
//  AegisRiderCommunityApp
//
//  Created by Maxwell Ehiawey on 24/02/2022.
//

import Foundation


// MARK: - SingleRideDTO Object
struct SingleRideDTO: Codable {
    var status: String?
    let detail: String?
    var data: SingleRideDataDTO?

    // MARK: - init
    init() {
        status = ""
        detail = ""
        data = nil

    }
    // MARK: - Class init
    init(_ singleRideDTO: SingleRideDTO) {
        self.status = singleRideDTO.status
        self.detail = singleRideDTO.detail
        self.data = singleRideDTO.data
    }
    // MARK: Enum
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case detail = "detail"
        case data = "data"
    }

    // MARK: Encode data
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(status, forKey: .status)
        try container.encode(detail, forKey: .detail)
        try container.encode(data, forKey: .data)
    }
    
    init(from decoder: Decoder) throws {
        //  Returns the data stored in this decoder as represented in a container keyed by the given key type.
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.status = try values.decodeIfPresent(String.self, forKey: .status)
        self.detail = try values.decodeIfPresent(String.self, forKey: .detail)
        self.data = try values.decodeIfPresent(SingleRideDataDTO.self, forKey: .data)
    }
}

// MARK: - Ride_locations Object
struct RideLocations: Codable {
   
    var start: String?
    var end: String?
    var waypoint1: String?
    var waypoint2: String?
    var waypoint3: String?
    
    
    // MARK: - init
    init() {
        start = ""
        end = ""
        waypoint1 = ""
        waypoint2 = ""
        waypoint3 = ""
    }
    
    // MARK: - Class init
    init(_ singleRideDTO: RideLocations) {
        self.start = singleRideDTO.start
        self.end = singleRideDTO.end
        self.waypoint1 = singleRideDTO.waypoint1
        self.waypoint2 = singleRideDTO.waypoint2
        self.waypoint3 = singleRideDTO.waypoint3
    }
    
    // MARK: Enum
    enum CodingKeys: String, CodingKey {
        case start = "start"
        case end = "end"
        case waypoint1 = "waypoint1"
        case waypoint2 = "waypoint2"
        case waypoint3 = "waypoint3"
    }
    
    // MARK: Encode data
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(start, forKey: .start)
        try container.encode(end, forKey: .end)
        try container.encode(waypoint1, forKey: .waypoint1)
        try container.encode(waypoint2, forKey: .waypoint2)
        try container.encode(waypoint3, forKey: .waypoint3)
    }
    init(from decoder: Decoder) throws {
        //  Returns the data stored in this decoder as represented in a container keyed by the given key type.
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.start = try values.decodeIfPresent(String.self, forKey: .start)
        self.end = try values.decodeIfPresent(String.self, forKey: .end)
        self.waypoint1 = try values.decodeIfPresent(String.self, forKey: .waypoint1)
        self.waypoint2 = try values.decodeIfPresent(String.self, forKey: .waypoint2)
        self.waypoint3 = try values.decodeIfPresent(String.self, forKey: .waypoint3)
    }
}


struct LocalLocations {
    var title: String
    var value: String
}

// MARK: - SingleRideDataDTO Object
struct SingleRideDataDTO: Codable {
   
    var ride: Result?
    let rideData: [PolyLine]?
    var videoLinks: [VideosObject]?
    let rideLocations: RideLocations?
    var locations: [LocalLocations] = []
    
    // MARK: - init
    init() {
        ride = Result()
        rideData = []
        videoLinks = []
        rideLocations = RideLocations()
    }
    
    // MARK: - Class init
    init(_ singleRideDTO: SingleRideDataDTO) {
        self.ride = singleRideDTO.ride
        self.rideData = singleRideDTO.rideData
        self.videoLinks = singleRideDTO.videoLinks
        self.rideLocations = singleRideDTO.rideLocations
    }
    
    // MARK: Enum
    enum CodingKeys: String, CodingKey {
        case ride = "ride"
        case rideData = "polyline"
        case videoLinks = "video_links"
        case rideLocations = "ride_locations"
    }
    
    // MARK: Encode data
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(ride, forKey: .ride)
        try container.encode(rideData, forKey: .rideData)
        try container.encode(videoLinks, forKey: .videoLinks)
        try container.encode(rideLocations, forKey: .rideLocations)
    }
    init(from decoder: Decoder) throws {
        //  Returns the data stored in this decoder as represented in a container keyed by the given key type.
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.ride = try values.decodeIfPresent(Result.self, forKey: .ride)
        self.rideData = try values.decodeIfPresent([PolyLine].self, forKey: .rideData)
        self.videoLinks = try values.decodeIfPresent([VideosObject].self, forKey: .videoLinks)
        self.rideLocations = try values.decodeIfPresent(RideLocations.self, forKey: .rideLocations)
    }
}

// MARK: - RideDatum
struct RideDatum: Codable {
    
    let polyLine: PolyLine?
    
    // MARK: - Class init
    init() {
       polyLine = PolyLine()
    }
    // MARK: - Class init
    init(_ rideDatum: RideDatum) {
        self.polyLine =  rideDatum.polyLine
    }
    // MARK: - Enum
    enum CodingKeys: String, CodingKey {
        case polyLine = "polyline"
    }
    // MARK: Encode data
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(polyLine, forKey: .polyLine)
    }
    init(from decoder: Decoder) throws {
        //  Returns the data stored in this decoder as represented in a container keyed by the given key type.
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.polyLine =  try values.decodeIfPresent(PolyLine.self, forKey: .polyLine)
    }
}
// MARK: - PolYLine


//Polyline1 to be changed to PolyLine
struct PolyLine1: Codable {
    var status: String?
    let detail: String?
    var data: [PolyLineData]?

    // MARK: - init
    init() {
        status = ""
        detail = ""
        data = nil

    }
    // MARK: - Class init
    init(_ polyLine: PolyLine1) {
        self.status = polyLine.status
        self.detail = polyLine.detail
        self.data = polyLine.data
    }
    // MARK: Enum
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case detail = "detail"
        case data = "data"
    }

    // MARK: Encode data
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(status, forKey: .status)
        try container.encode(detail, forKey: .detail)
        try container.encode(data, forKey: .data)
    }
    init(from decoder: Decoder) throws {
        //  Returns the data stored in this decoder as represented in a container keyed by the given key type.
        let values = try decoder.container(keyedBy: CodingKeys.self)

        self.status = try values.decodeIfPresent(String.self, forKey: .status)
        self.detail = try values.decodeIfPresent(String.self, forKey: .detail)
        self.data = try values.decodeIfPresent([PolyLineData].self, forKey: .data)
    }
}
//this to be deleted
struct PolyLine: Codable {
    
    var lat: Double?
    var lng: Double?

    // MARK: - init
    init() {
        lat = Utilities.Constants.doubleValue
        lng = Utilities.Constants.doubleValue

    }
    // MARK: - Class init
    init(_ polyLineData: PolyLineData) {
        self.lat = polyLineData.lat
        self.lng = polyLineData.lng
    }
    // MARK: Enum
    enum CodingKeys: String, CodingKey {
        case lat = "lat"
        case lng = "lng"
    }

    // MARK: Encode data
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(lat, forKey: .lat)
        try container.encode(lng, forKey: .lng)
    }
    init(from decoder: Decoder) throws {
        //  Returns the data stored in this decoder as represented in a container keyed by the given key type.
        let values = try decoder.container(keyedBy: CodingKeys.self)

        self.lat = try values.decodeIfPresent(Double.self, forKey: .lat)
        self.lng = try values.decodeIfPresent(Double.self, forKey: .lng)
        
    }
}

struct RidePoints: Codable {
    
    var lat: String?
    var lng: String?

    // MARK: - init
    init() {
        lat = Utilities.Constants.blankStringValue
        lng = Utilities.Constants.blankStringValue

    }
    // MARK: - Class init
    init(_ pointData: RidePoints) {
        self.lat = pointData.lat
        self.lng = pointData.lng
    }
    // MARK: Enum
    enum CodingKeys: String, CodingKey {
        case lat = "lat"
        case lng = "lng"
    }

    // MARK: Encode data
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(lat, forKey: .lat)
        try container.encode(lng, forKey: .lng)
    }
    init(from decoder: Decoder) throws {
        //  Returns the data stored in this decoder as represented in a container keyed by the given key type.
        let values = try decoder.container(keyedBy: CodingKeys.self)

        self.lat = try values.decodeIfPresent(String.self, forKey: .lat)
        self.lng = try values.decodeIfPresent(String.self, forKey: .lng)
        
    }
}

struct PolyLineData: Codable {
    
    var lat: Double?
    var lng: Double?

    // MARK: - init
    init() {
        lat = Utilities.Constants.doubleValue
        lng = Utilities.Constants.doubleValue

    }
    // MARK: - Class init
    init(_ polyLineData: PolyLineData) {
        self.lat = polyLineData.lat
        self.lng = polyLineData.lng
    }
    // MARK: Enum
    enum CodingKeys: String, CodingKey {
        case lat = "lat"
        case lng = "lng"
    }

    // MARK: Encode data
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(lat, forKey: .lat)
        try container.encode(lng, forKey: .lng)
    }
    init(from decoder: Decoder) throws {
        //  Returns the data stored in this decoder as represented in a container keyed by the given key type.
        let values = try decoder.container(keyedBy: CodingKeys.self)

        self.lat = try values.decodeIfPresent(Double.self, forKey: .lat)
        self.lng = try values.decodeIfPresent(Double.self, forKey: .lng)
        
    }
}

// MARK: - RideDatumGraphData
struct RideDatumGraphData: Codable {
    let graphData: SingleGraphData?
    
    // MARK: - Class init
    init() {
        graphData = SingleGraphData()
    }
    // MARK: - Class init
    init(_ graphData: RideDatumGraphData) {
        self.graphData = graphData.graphData
    }
    // MARK: enum
    enum CodingKeys: String, CodingKey {
        case graphData = "graph_data"
    }
    // MARK: Encode data
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(graphData, forKey: .graphData)
        
    }
    init(from decoder: Decoder) throws {
        //  Returns the data stored in this decoder as represented in a container keyed by the given key type.
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.graphData = try values.decodeIfPresent(SingleGraphData.self, forKey: .graphData)
    }
}
// MARK: - SingleGraphData
struct SingleGraphData: Codable {
    
    let distanceRoll: String?
    let distanceSpeed: [String: Double]?
    
    // MARK: - Class init
    init() {
        distanceRoll = Utilities.Constants.blankStringValue
        distanceSpeed = [:]
    }
    enum CodingKeys: String, CodingKey {
        case distanceRoll = "distance_roll"
        case distanceSpeed = "distance_speed"
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(distanceRoll, forKey: .distanceRoll)
        // try container.encode(distanceSpeed, forKey: .distanceSpeed)
    }
    
    /// Creates a new instance by decoding from the given decoder.
    /// - Parameter decoder: the decoder to read data from.
    /// - Throws: This initializer throws an error if reading from the decoder fails, or if the data read is corrupted or otherwise invalid.
    init(from decoder: Decoder) throws {
        //  Returns the data stored in this decoder as represented in a container keyed by the given key type.
        let values = try decoder.container(keyedBy: CodingKeys.self)
        /// Decodes a value of the given type for the given key, if present.
        /// - throws: `DecodingError.typeMismatch` if the encountered encoded value  is not convertible to the requested type.
        self.distanceRoll = try values.decodeIfPresent(String.self, forKey: .distanceRoll)
        self.distanceSpeed = try values.decodeIfPresent([String: Double].self, forKey: .distanceSpeed)
    }
}
// MARK: - SingleRoutePoints
struct SingleRoutePoints: Codable {
    
    let routePoints: [SingleRoutePoint]?
    
    // MARK: - Class init
    init() {
        routePoints = []
    }
    // MARK: - Class init
    init(_ routePoints: SingleRoutePoints) {
        self.routePoints = routePoints.routePoints
    }
    enum CodingKeys: String, CodingKey {
        case routePoints = "route_points"
    }
    // MARK: Encode data
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(routePoints, forKey: .routePoints)
    }
    init(from decoder: Decoder) throws {
        //  Returns the data stored in this decoder as represented in a container keyed by the given key type.
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        /// Decodes a value of the given type for the given key, if present.
        /// - throws: `DecodingError.typeMismatch` if the encountered encoded value  is not convertible to the requested type.
        self.routePoints = try values.decodeIfPresent([SingleRoutePoint].self, forKey: .routePoints)
    }
}
// MARK: - RoutePoint
struct SingleRoutePoint: Codable {
    let lat: Double?
    let lng: Double?
    // MARK: - Class init
    init() {
        lat = Utilities.Constants.doubleValue
        lng = Utilities.Constants.doubleValue
    }
    // MARK: - Class init
    init(_ routePoint: RoutePoint) {
        self.lat = routePoint.lat
        self.lng = routePoint.lng
    }
    // MARK: - enum
    enum CodingKeys: String, CodingKey {
        case lat = "lat"
        case lng = "lng"
    }
    // MARK: Encode data
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(lat, forKey: .lat)
        try container.encode(lng, forKey: .lng)
    }
    init(from decoder: Decoder) throws {
        //  Returns the data stored in this decoder as represented in a container keyed by the given key type.
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.lat = try values.decodeIfPresent(Double.self, forKey: .lat)
        self.lng = try values.decodeIfPresent(Double.self, forKey: .lng)
    }
}
// MARK: - RidePoint
struct RidePoint: Codable {
    
    let positionType: String?
    let latitude: String?
    let longitude: String?
    let locationName: String?
    
    // MARK: - Class init
    init() {
        positionType = Utilities.Constants.blankStringValue
        latitude = Utilities.Constants.blankStringValue
        longitude = Utilities.Constants.blankStringValue
        locationName = Utilities.Constants.blankStringValue
    }
    // MARK: - Class init
    init(_ ridePoint: RidePoint) {
        self.positionType = ridePoint.positionType
        self.latitude =  ridePoint.latitude
        self.longitude =  ridePoint.longitude
        self.locationName = ridePoint.locationName
    }
    // MARK: - Enum
    enum CodingKeys: String, CodingKey {
        case positionType = "position_type"
        case latitude = "latitude"
        case longitude = "longitude"
        case locationName = "location_name"
    }
    // MARK: Encode data
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(positionType, forKey: .positionType)
        try container.encode(latitude, forKey: .latitude)
        try container.encode(longitude, forKey: .longitude)
        try container.encode(locationName, forKey: .locationName)
    }
    
    init(from decoder: Decoder) throws {
        //  Returns the data stored in this decoder as represented in a container keyed by the given key type.
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.positionType = try values.decodeIfPresent(String.self, forKey: .positionType)
        self.latitude = try values.decodeIfPresent(String.self, forKey: .latitude)
        self.longitude =  try values.decodeIfPresent(String.self, forKey: .longitude)
        self.locationName =  try values.decodeIfPresent(String.self, forKey: .locationName)
    }
}

struct VideosObject: Codable {
    var videoTitle: String?
    var videoPath: String?
    var id: Int?
        // MARK: - Enum
    enum CodingKeys: String, CodingKey {
        case videoTitle = "video_title"
        case videoPath = "video_path"
        case id = "id"
    }
    init() {
        videoTitle = ""
        videoPath = ""
        id = 0
    }
    init(videoObj: VideosObject) {
        self.videoTitle = videoObj.videoTitle
        self.videoPath = videoObj.videoPath
        self.id = videoObj.id
    }
        // MARK: Encode data
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(videoTitle, forKey: .videoTitle)
        try container.encode(videoPath, forKey: .videoPath)
        try container.encode(id, forKey: .id)
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.videoTitle = try values.decodeIfPresent(String.self, forKey: .videoTitle)
        self.videoPath = try values.decodeIfPresent(String.self, forKey: .videoPath)
        self.id = try values.decodeIfPresent(Int.self, forKey: .id)
    }
}
// MARK: - Videos
struct Videos: Codable {
    
    var videoLinks: VideosObject?
    
    // MARK: - Class init
    init() {
        videoLinks = VideosObject()
    }
    
    // MARK: - Class init
    init(_ videos: Videos) {
        self.videoLinks = videos.videoLinks
    }
    enum CodingKeys: String, CodingKey {
        case videoLinks = "video_links"
    }
    // MARK: Encode data
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(videoLinks, forKey: .videoLinks)
    }
    init(from decoder: Decoder) throws {
        //  Returns the data stored in this decoder as represented in a container keyed by the given key type.
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.videoLinks = try values.decodeIfPresent(VideosObject.self, forKey: .videoLinks)
    }
}
