//
//  CityListItem.swift
//  Wipro
//
//  Created by Radosław Gers on 26/08/2020.
//  Copyright © 2020 Radosław Gers. All rights reserved.
//

import Foundation
import UIKit

class City: ViewModel {
    var delegate: ViewModelDelegate?
    
    var id: Int
    var image: UIImage?
    var name: String
    var favourite: Bool = false
    
    private var imageWorker: ImageWorker? = nil
    
    func loadData() {
        self.imageWorker?.getImage { [weak self] (image: UIImage) in
            self?.image = image
            self?.delegate?.didLoadData()
        }
    }
    
    init(imageWorker: ImageWorker, id: Int, name: String) {
        self.imageWorker = imageWorker
        self.name = name
        self.id = id
    }
}
