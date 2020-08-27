//
//  LoremPicsumImageWorker.swift
//  Wipro
//
//  Created by Radosław Gers on 26/08/2020.
//  Copyright © 2020 Radosław Gers. All rights reserved.
//

import UIKit
class LoremPicsumImageWorker: ImageWorker {
    
    let apiRequest = LoremPicsumApiRequest(resource: LoremPicsumResource())
    
    func getImage(withCompletion completion: @escaping (UIImage) -> Void) {
        apiRequest.load { (imgData: LoremPicsumImage?) in
            guard let imgData = imgData else { return }
            completion(imgData.image)
        }
    }
}
