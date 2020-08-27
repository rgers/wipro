//
//  GistCityVisits.swift
//  Wipro
//
//  Created by Radosław Gers on 27/08/2020.
//  Copyright © 2020 Radosław Gers. All rights reserved.
//

import Foundation
public struct GistCityVisited: Codable {
    let id: Int
    let peopleVisited: [String]
}
