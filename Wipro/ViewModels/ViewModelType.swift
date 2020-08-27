//
//  ViewModelType.swift
//  Wipro
//
//  Created by Radosław Gers on 26/08/2020.
//  Copyright © 2020 Radosław Gers. All rights reserved.
//

protocol ViewModel {
    mutating func loadData()
    var delegate: ViewModelDelegate? { get set }
}
