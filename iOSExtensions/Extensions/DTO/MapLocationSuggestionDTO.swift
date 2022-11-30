//
//  MapLocationSuggestionDTO.swift
//  AegisRiderCommunityApp
//
//  Created by Maxwell Ehiawey on 23/02/2022.
//

import Foundation
import MapKit

struct LocationSuggestionDTO : Identifiable {
    
    var id : Int
    var name : String
    var address : String
    var coordinate : CLLocationCoordinate2D
}
