//
//  ApiRequest.swift
//  Wipro
//
//  Created by Radosław Gers on 26/08/2020.
//  Copyright © 2020 Radosław Gers. All rights reserved.
//

import Foundation
class ApiRequest<Resource: ApiResource> {
    let resource: Resource
    
    init(resource: Resource) {
        self.resource = resource
    }
}

