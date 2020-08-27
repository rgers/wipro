//
//  CityResource.swift
//  Wipro
//
//  Created by Radosław Gers on 26/08/2020.
//  Copyright © 2020 Radosław Gers. All rights reserved.
//

import Foundation
struct CityResource: GeoDbApiResource {
    typealias ModelType = City
    let methodPath = "/cities"
    var offset = 0
}
