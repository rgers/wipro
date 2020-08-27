//
//  GistApiResource.swift
//  Wipro
//
//  Created by Radosław Gers on 27/08/2020.
//  Copyright © 2020 Radosław Gers. All rights reserved.
//

import Foundation
protocol GistApiResource: ApiResource {

}
extension GistApiResource {
    var url: URL {
        var components = URLComponents(string: "https://gist.githubusercontent.com")!
        components.path = methodPath
        return components.url!
    }
}
