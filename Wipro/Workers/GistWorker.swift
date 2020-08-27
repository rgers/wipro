//
//  GistWorker.swift
//  Wipro
//
//  Created by Radosław Gers on 27/08/2020.
//  Copyright © 2020 Radosław Gers. All rights reserved.
//
import Foundation
class GistWorker: RestWorker {
    var apiRequests = [Int: Any?]()
    
    func getCities(withCompletion completion: @escaping ([GistCity]) -> Void) {
        let apiRequest = GistApiRequest(resource: GistCityResource())
        apiRequests[ObjectIdentifier(apiRequest).hashValue] = apiRequest
        apiRequest.load { (cities: [GistCity]?) in
            self.apiRequests.removeValue(forKey: ObjectIdentifier(apiRequest).hashValue)
            guard let cities = cities else { return }
            completion(cities)
        }
    }
    
    func getCitiesRanks(withCompletion completion: @escaping ([GistCityRank]) -> Void) {
        let apiRequest = GistApiRequest(resource: GistCityRankResource())
        apiRequests[ObjectIdentifier(apiRequest).hashValue] = apiRequest
        apiRequest.load { (cities: [GistCityRank]?) in
            self.apiRequests.removeValue(forKey: ObjectIdentifier(apiRequest).hashValue)
            guard let cities = cities else { return }
            completion(cities)
        }
    }
    
    func getCitiesVisited(withCompletion completion: @escaping ([GistCityVisited]) -> Void) {
        let apiRequest = GistApiRequest(resource: GistCityVisitedResource())
        apiRequests[ObjectIdentifier(apiRequest).hashValue] = apiRequest
        apiRequest.load { (cities: [GistCityVisited]?) in
            self.apiRequests.removeValue(forKey: ObjectIdentifier(apiRequest).hashValue)
            guard let cities = cities else { return }
            completion(cities)
        }
    }
    
    
}
