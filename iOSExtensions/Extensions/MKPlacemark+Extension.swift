//
//  MKPlacemark+Extension.swift
//  AegisRiderCommunityApp
//
//  Created by devadmin on 25/02/2022.
//

import Foundation
import MapKit
import Contacts

extension MKPlacemark {
    var formattedAddress: String? {
        guard let postalAddress = postalAddress else { return nil }
        return CNPostalAddressFormatter.string(from: postalAddress, style: .mailingAddress).replacingOccurrences(of: "\n", with: " ")
    }
}
