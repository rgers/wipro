//
//  ApiResource.swift
//  Wipro
//
//  Created by Radosław Gers on 26/08/2020.
//  Copyright © 2020 Radosław Gers. All rights reserved.
//

import Foundation
protocol ApiResource {
    associatedtype ModelType: Decodable
    var methodPath: String { get }
}
