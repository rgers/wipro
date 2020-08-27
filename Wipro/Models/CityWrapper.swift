//
//  CityWrapper.swift
//  Wipro
//
//  Created by Radosław Gers on 27/08/2020.
//  Copyright © 2020 Radosław Gers. All rights reserved.
//

import Foundation
struct CityWrapper<T: Decodable>: Decodable {
    let cities: [T]
}
