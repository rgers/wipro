//
//  LoremPicsumApiRequest.swift
//  Wipro
//
//  Created by Radosław Gers on 26/08/2020.
//  Copyright © 2020 Radosław Gers. All rights reserved.
//
import Foundation
class LoremPicsumApiRequest<Resource: LoremPicsumApiResource>: ApiRequest<Resource> {
    
}

extension LoremPicsumApiRequest: NetworkRequest {
    func load(withCompletion completion: @escaping (Resource.ModelType?) -> Void) {
        load(resource.url, withCompletion: completion)
    }
    
    func decode(_ data: Data) -> Resource.ModelType? {
        var returnData: Resource.ModelType?
        returnData = try? Resource.ModelType.self.init(imgData: data)
        
        return returnData
    }
}
