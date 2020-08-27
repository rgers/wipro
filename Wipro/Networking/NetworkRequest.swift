//
//  NetworkRequest.swift
//  Wipro
//
//  Created by Radosław Gers on 26/08/2020.
//  Copyright © 2020 Radosław Gers. All rights reserved.
//

import Foundation
protocol NetworkRequest: AnyObject {
    associatedtype ModelType
    func decode(_ data: Data) -> ModelType?
    func load(withCompletion completion: @escaping (ModelType?) -> Void)
}

extension NetworkRequest {
    func load(_ url: URL, withCompletion completion: @escaping (ModelType?) -> Void) {
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: .main)
        let task = session.dataTask(with: url, completionHandler: { [weak self] (data: Data?, response: URLResponse?, error: Error?) -> Void in
            guard let data = data else {
                completion(nil)
                return
            }
            let decoded = self?.decode(data)
            completion(decoded)
            
        })
        task.resume()
    }
}
