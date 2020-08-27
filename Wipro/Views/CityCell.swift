//
//  CityCell.swift
//  Wipro
//
//  Created by Radosław Gers on 26/08/2020.
//  Copyright © 2020 Radosław Gers. All rights reserved.
//

import Foundation
import UIKit

class CityCell : UITableViewCell {
    
    var viewModel: City? {
        didSet {
            guard let viewModel = viewModel else {
                cityImage.image = nil
                return
            }
            cityNameLabel.text = viewModel.name
            viewModel.delegate = self
            viewModel.loadData()
            if(viewModel.favourite) {
                favLabel.isHidden = false
            } else {
                favLabel.isHidden = true
            }
        }
    }
    
    private let cityImage: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    private let cityNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        return lbl
    }()
    private let favLabel: UILabel = {
        let lbl = UILabel()
        lbl.backgroundColor = .red
        lbl.text = "FAV"
        lbl.isHidden = false
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addCustomSubview(cityImage)
        addCustomSubview(cityNameLabel)
        addCustomSubview(favLabel)
        
        NSLayoutConstraint.activate([
            cityImage.topAnchor.constraint(equalTo: topAnchor),
            cityImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            cityImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            cityImage.widthAnchor.constraint(equalToConstant: 120),
            cityNameLabel.leadingAnchor.constraint(equalTo: cityImage.trailingAnchor),
            cityNameLabel.trailingAnchor.constraint(equalTo: favLabel.leadingAnchor),
            cityNameLabel.topAnchor.constraint(equalTo: topAnchor),
            cityNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            favLabel.widthAnchor.constraint(equalToConstant: 40),
            favLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            favLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
}

extension CityCell: ViewModelDelegate {
    func didLoadData() {
        self.cityImage.image = viewModel?.image
    }
}
