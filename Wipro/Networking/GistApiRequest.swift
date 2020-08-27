//
//  GistApiRequest.swift
//  Wipro
//
//  Created by Radosław Gers on 27/08/2020.
//  Copyright © 2020 Radosław Gers. All rights reserved.
//

import Foundation
class GistApiRequest<Resource: GistApiResource>: ApiRequest<Resource> {
    
}

extension GistApiRequest: NetworkRequest {
    func load(withCompletion completion: @escaping ([Resource.ModelType]?) -> Void) {
        load(resource.url, withCompletion: completion)
    }
    
    func decode(_ data: Data) -> [Resource.ModelType]? {
        var responseData: CityWrapper<Resource.ModelType>?
        do {
            responseData = try JSONDecoder().decode(CityWrapper<Resource.ModelType>.self, from: data)
        } catch {
            print(error)  // Simple error handling due to limited time when writing this demo app
        }
        return responseData?.cities
    }
}
