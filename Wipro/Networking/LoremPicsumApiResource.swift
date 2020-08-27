//
//  LoremPicsumApiResource.swift
//  Wipro
//
//  Created by Radosław Gers on 26/08/2020.
//  Copyright © 2020 Radosław Gers. All rights reserved.
//

import Foundation
protocol ImgDecodable {
    init(imgData: Data) throws
}
protocol LoremPicsumApiResource: ApiResource where ModelType: ImgDecodable {
    
}
extension LoremPicsumApiResource {
    var url: URL {
        var components = URLComponents(string: "https://picsum.photos")!
        components.path = methodPath
        return components.url!
    }
}
