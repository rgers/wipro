//
//  Contracts.swift
//  Wipro
//
//  Created by Radosław Gers on 26/08/2020.
//  Copyright © 2020 Radosław Gers. All rights reserved.
//

import UIKit

public protocol RestWorker {
    func getCities(withCompletion completion: @escaping ([GistCity]) -> Void)
    func getCitiesRanks(withCompletion completion: @escaping ([GistCityRank]) -> Void)
    func getCitiesVisited(withCompletion completion: @escaping ([GistCityVisited]) -> Void)
}

public protocol ImageWorker {
    func getImage(withCompletion completion: @escaping (UIImage) -> Void)
}
