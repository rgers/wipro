//
//  GeoDbWrapper.swift
//  Wipro
//
//  Created by Radosław Gers on 26/08/2020.
//  Copyright © 2020 Radosław Gers. All rights reserved.
//

import Foundation
struct GeoDbWrapper<T: Decodable>: Decodable {
    let data: [T]
    let metadata: GeoDbMetadata
}

struct GeoDbMetadata: Decodable {
    let totalCount: Int
}
