//
//  Location.swift
//  Map
//
//  Created by ihpt on 27/11/2024.
//

import Foundation
import MapKit

struct Location: Identifiable {
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    var id: String {
        name + cityName
    }
}
