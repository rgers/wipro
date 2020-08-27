//
//  LoremPicsumImage.swift
//  Wipro
//
//  Created by Radosław Gers on 26/08/2020.
//  Copyright © 2020 Radosław Gers. All rights reserved.
//

import Foundation
import UIKit

enum LoremPicsumImageError: Error {
    case decodingError
}

struct LoremPicsumImage {
    let image: UIImage
}

extension LoremPicsumImage: ImgDecodable {    
    init(imgData: Data) throws {
        guard let image = UIImage(data: imgData) else {
            throw LoremPicsumImageError.decodingError
        }
        self.image = image
    }
}

extension LoremPicsumImage: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let data = try container.decode(Data.self)
        guard let image = UIImage(data: data) else {
            throw LoremPicsumImageError.decodingError
        }
        self.image = image
    }
}
