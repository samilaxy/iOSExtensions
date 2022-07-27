//
//  AllRidesDTO.swift
//  AegisRiderCommunityApp
//
//  Created by Maxwell Ehiawey on 11/02/2022.
//

import Foundation

// MARK: - General rides Object
struct AllRidesDTO: Codable {
    var status: String?
    var detail: String?
    var currentPage: Int?
    var total: Int?
    var totalPages: Int?
    var data: [Result]?
    
    // MARK: - init
    init() {
        status = Utilities.Constants.blankStringValue
        detail = Utilities.Constants.blankStringValue
        currentPage = Utilities.Constants.intValue
        total = Utilities.Constants.intValue
        totalPages = Utilities.Constants.intValue
        data = []
    }
    
    // MARK: - Class init
    init(_ allRides: AllRidesDTO) {
        self.status = allRides.status
        self.detail = allRides.detail
        self.currentPage = allRides.currentPage
        self.currentPage = allRides.currentPage
        self.total = allRides.total
        self.totalPages = allRides.totalPages
        self.data = allRides.data
    }
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case detail = "detail"
        case currentPage = "current_page"
        case total = "total"
        case totalPages = "total_pages"
        case data = "data"
    }
    
    // MARK: Encode data
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(status, forKey: .status)
        try container.encode(detail, forKey: .detail)
        try container.encode(currentPage, forKey: .currentPage)
        try container.encode(total, forKey: .total)
        try container.encode(totalPages, forKey: .totalPages)
        try container.encode(data, forKey: .data)
    }
    
    /// Creates a new instance by decoding from the given decoder.
    /// - Parameter decoder: the decoder to read data from.
    /// - Throws: This initializer throws an error if reading from the decoder fails, or if the data read is corrupted or otherwise invalid.
    init(from decoder: Decoder) throws {
        //  Returns the data stored in this decoder as represented in a container keyed by the given key type.
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        /// Decodes a value of the given type for the given key, if present.
        /// - throws: `DecodingError.typeMismatch` if the encountered encoded value  is not convertible to the requested type.
        self.status = try values.decodeIfPresent(String.self, forKey: .status)
        self.detail = try values.decodeIfPresent(String.self, forKey: .detail)
        self.currentPage = try values.decodeIfPresent(Int.self, forKey: .currentPage)
        self.total = try values.decodeIfPresent(Int.self, forKey: .total)
        self.totalPages = try values.decodeIfPresent(Int.self, forKey: .totalPages)
        self.data = try values.decodeIfPresent([Result].self, forKey: .data) 
    }
}
// MARK: - SubObject
struct SubObject: Codable {
    
    var results: [Result]?
    // var routes: [Routes]?
    
    // MARK: - init
    init() {
        // routes = []
        results = []
    }
    
    // MARK: - Class init
    init(_ subObject: SubObject) {
        self.results = subObject.results
        // self.routes = subObject.routes
    }
    enum CodingKeys: String, CodingKey {
        case results = "results"
        // case routes = "routes"
    }
    
    // MARK: Encode data
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(results, forKey: .results)
        // try container.encode(routes, forKey: .routes)
    }
    
    /// Creates a new instance by decoding from the given decoder.
    /// - Parameter decoder: the decoder to read data from.
    /// - Throws: This initializer throws an error if reading from the decoder fails, or if the data read is corrupted or otherwise invalid.
    init(from decoder: Decoder) throws {
        //  Returns the data stored in this decoder as represented in a container keyed by the given key type.
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        /// Decodes a value of the given type for the given key, if present.
        /// - throws: `DecodingError.typeMismatch` if the encountered encoded value  is not convertible to the requested type.
        self.results = try values.decodeIfPresent([Result].self, forKey: .results)
        // self.routes = try values.decodeIfPresent([Routes].self, forKey: .routes)
    }
    
}

// MARK: - Result
struct Result: Codable {
    
      let timestamp: Double?
      let rideDuration: Double? //
      let totalDistance: Double? //
      let averageSpeed: Double? //
      let maxSpeed: Double? //
      let summarizedVideo: String?
      var rideTitle: String?
      var isFavourite: Bool?
      var lightRideSnapshot: String?
      var darkRideSnapshot: String?
      var videoThumbnail: String?
    
    // MARK: - Class init
    
    init() {
        timestamp = Utilities.Constants.doubleValue
        rideDuration = Utilities.Constants.doubleValue
        totalDistance = Utilities.Constants.doubleValue
        averageSpeed = Utilities.Constants.doubleValue
        maxSpeed = Utilities.Constants.doubleValue
        summarizedVideo = Utilities.Constants.blankStringValue
        rideTitle = Utilities.Constants.blankStringValue
        isFavourite = Utilities.Constants.boolValue
        lightRideSnapshot = Utilities.Constants.blankStringValue
        darkRideSnapshot = Utilities.Constants.blankStringValue
        videoThumbnail = Utilities.Constants.blankStringValue
    }
    
    // MARK: - Class init
    init(_ result: Result) {
        self.timestamp =  result.timestamp
        self.rideDuration = result.rideDuration
        self.totalDistance = result.totalDistance
        self.averageSpeed = result.averageSpeed
        self.maxSpeed = result.maxSpeed
        self.summarizedVideo = result.summarizedVideo
        self.rideTitle = result.rideTitle
        self.isFavourite = result.isFavourite
        self.lightRideSnapshot = result.lightRideSnapshot
        self.darkRideSnapshot = result.darkRideSnapshot
        self.videoThumbnail = result.videoThumbnail
    }
    
    enum CodingKeys: String, CodingKey {
        case timestamp = "timestamp"
        case rideDuration = "ride_duration"
        case totalDistance = "total_distance"
        case averageSpeed = "average_speed"
        case maxSpeed = "max_speed"
        case summarizedVideo = "summarized_video"
        case rideTitle = "ride_title"
        case isFavourite = "is_favourite"
        case lightRideSnapshot = "light_ride_snapshot"
        case darkRideSnapshot = "dark_ride_snapshot"
        case videoThumbnail = "video_thumbnail"
    }
    
    // MARK: Encode data
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(timestamp, forKey: .timestamp)
        try container.encode(rideDuration, forKey: .rideDuration)
        try container.encode(totalDistance, forKey: .totalDistance)
        try container.encode(averageSpeed, forKey: .averageSpeed)
        try container.encode(maxSpeed, forKey: .maxSpeed)
        try container.encode(summarizedVideo , forKey: .summarizedVideo)
        try container.encode(rideTitle , forKey: .rideTitle)
        try container.encode(isFavourite , forKey: .isFavourite)
        try container.encode(lightRideSnapshot , forKey: .lightRideSnapshot)
        try container.encode(darkRideSnapshot , forKey: .darkRideSnapshot)
        try container.encode(videoThumbnail , forKey: .videoThumbnail)
    }
    
    /// Creates a new instance by decoding from the given decoder.
    /// - Parameter decoder: the decoder to read data from.
    /// - Throws: This initializer throws an error if reading from the decoder fails, or if the data read is corrupted or otherwise invalid.
    init(from decoder: Decoder) throws {
        //  Returns the data stored in this decoder as represented in a container keyed by the given key type.
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        /// Decodes a value of the given type for the given key, if present.
        /// - throws: `DecodingError.typeMismatch` if the encountered encoded value  is not convertible to the requested type.
        self.timestamp =  try values.decodeIfPresent(Double.self, forKey: .timestamp)
        self.rideDuration = try values.decodeIfPresent(Double.self, forKey: .rideDuration)
        self.totalDistance = try values.decodeIfPresent(Double.self, forKey: .totalDistance)
        self.averageSpeed = try values.decodeIfPresent(Double.self, forKey: .averageSpeed)
        self.maxSpeed = try values.decodeIfPresent(Double.self, forKey: .maxSpeed)
        self.summarizedVideo = try values.decodeIfPresent(String.self, forKey: .summarizedVideo)
        self.rideTitle = try values.decodeIfPresent(String.self, forKey: .rideTitle)
        self.isFavourite = try values.decodeIfPresent(Bool.self, forKey: .isFavourite)
        self.lightRideSnapshot = try values.decodeIfPresent(String.self, forKey: .lightRideSnapshot)
        self.darkRideSnapshot = try values.decodeIfPresent(String.self, forKey: .darkRideSnapshot)
        self.videoThumbnail = try values.decodeIfPresent(String.self, forKey: .videoThumbnail)
    }
    
}

// MARK: - Route
struct Routes: Codable {
    
    let id: Int?
    let rideID: Int?
    let graphData: RouteGraphData?
    let routePoints: RoutePoints?
    
    // MARK: - Class init
    init() {
        id = Utilities.Constants.intValue
        rideID = Utilities.Constants.intValue
        graphData = RouteGraphData()
        routePoints = RoutePoints()
    }
    
    // MARK: - Class init
    init(_ route: Routes) {
        self.id = route.id
        self.rideID = route.rideID
        self.graphData = route.graphData
        self.routePoints =  route.routePoints
    }
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case rideID = "ride_id"
        case graphData = "graph_data"
        case routePoints = "route_points"
    }
    
    // MARK: Encode data
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(rideID, forKey: .rideID)
        try container.encode(graphData, forKey: .graphData)
        try container.encode(routePoints, forKey: .routePoints)
    }
    
    /// Creates a new instance by decoding from the given decoder.
    /// - Parameter decoder: the decoder to read data from.
    /// - Throws: This initializer throws an error if reading from the decoder fails, or if the data read is corrupted or otherwise invalid.
    init(from decoder: Decoder) throws {
        //  Returns the data stored in this decoder as represented in a container keyed by the given key type.
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        /// Decodes a value of the given type for the given key, if present.
        /// - throws: `DecodingError.typeMismatch` if the encountered encoded value  is not convertible to the requested type.
        self.id = try values.decodeIfPresent(Int.self, forKey: .id)
        self.rideID = try values.decodeIfPresent(Int.self, forKey: .rideID)
        self.graphData = try values.decodeIfPresent(RouteGraphData.self, forKey: .graphData)
        self.routePoints =  try values.decodeIfPresent(RoutePoints.self, forKey: .routePoints)
    }
}

// MARK: - RouteGraphData
struct RouteGraphData: Codable {
    let graphData: GraphDataGraphData?
    
    // MARK: - Class init
    init() {
        graphData = GraphDataGraphData()
    }
    
    // MARK: - Class init
    init(_ graphData: RouteGraphData) {
        self.graphData = graphData.graphData
    }
    
    enum CodingKeys: String, CodingKey {
        case graphData = "graph_data"
    }
    
    // MARK: Encode data
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(graphData, forKey: .graphData)
        
    }
    
    /// Creates a new instance by decoding from the given decoder.
    /// - Parameter decoder: the decoder to read data from.
    /// - Throws: This initializer throws an error if reading from the decoder fails, or if the data read is corrupted or otherwise invalid.
    init(from decoder: Decoder) throws {
        //  Returns the data stored in this decoder as represented in a container keyed by the given key type.
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        /// Decodes a value of the given type for the given key, if present.
        /// - throws: `DecodingError.typeMismatch` if the encountered encoded value  is not convertible to the requested type.
        self.graphData = try values.decodeIfPresent(GraphDataGraphData.self, forKey: .graphData)
    }
}

// MARK: - GraphDataGraphData
struct GraphDataGraphData: Codable {
    let distanceRoll: String?
    let distanceSpeed: [String: Any]?
    
    init() {
        distanceRoll = Utilities.Constants.blankStringValue
        distanceSpeed = [:]
    }
    
    // MARK: - Class init
    init(_ graphData: GraphDataGraphData) {
        self.distanceRoll = graphData.distanceRoll
        self.distanceSpeed = graphData.distanceSpeed
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
        self.distanceSpeed = try values.decodeIfPresent([String: Any].self, forKey: .distanceSpeed)
    }
}


// MARK: - RoutePoints
struct RoutePoints: Codable {
    let routePoints: [RoutePoint]?
    
    // MARK: - Class init
    init() {
        routePoints = []
    }
    
    // MARK: - Class init
    init(_ routePoints: RoutePoints) {
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
    
    /// Creates a new instance by decoding from the given decoder.
    /// - Parameter decoder: the decoder to read data from.
    /// - Throws: This initializer throws an error if reading from the decoder fails, or if the data read is corrupted or otherwise invalid.
    init(from decoder: Decoder) throws {
        //  Returns the data stored in this decoder as represented in a container keyed by the given key type.
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        /// Decodes a value of the given type for the given key, if present.
        /// - throws: `DecodingError.typeMismatch` if the encountered encoded value  is not convertible to the requested type.
        self.routePoints = try values.decodeIfPresent([RoutePoint].self, forKey: .routePoints)
    }
}
// MARK: - RoutePoint
struct RoutePoint: Codable {
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
    
    /// Creates a new instance by decoding from the given decoder.
    /// - Parameter decoder: the decoder to read data from.
    /// - Throws: This initializer throws an error if reading from the decoder fails, or if the data read is corrupted or otherwise invalid.
    init(from decoder: Decoder) throws {
        //  Returns the data stored in this decoder as represented in a container keyed by the given key type.
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        /// Decodes a value of the given type for the given key, if present.
        /// - throws: `DecodingError.typeMismatch` if the encountered encoded value  is not convertible to the requested type.
        self.lat = try values.decodeIfPresent(Double.self, forKey: .lat)
        self.lng = try values.decodeIfPresent(Double.self, forKey: .lng)
    }
}
