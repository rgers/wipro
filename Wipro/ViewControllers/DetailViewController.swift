//
//  DetailViewController.swift
//  Wipro
//
//  Created by Radosław Gers on 27/08/2020.
//  Copyright © 2020 Radosław Gers. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    private let restWorker: RestWorker
    private let stack: UIStackView = UIStackView()
    private let cityItem: City
    private var visited: [String]?
    private let cityImage: UIImageView = UIImageView()
    private let cityLabel: UILabel = UILabel()
    private let peopleVisited: UILabel = UILabel()
    private let averageRating: UILabel = UILabel()
    private let favButton: UIButton = UIButton(type: .roundedRect)
    
    private let favsWorker = FavouritesWorker()
    
    init(restWorker: RestWorker, cityItem: City) {
        self.restWorker = restWorker
        self.cityItem = cityItem
        super.init(nibName: nil, bundle: nil)
    }
       
    required init?(coder: NSCoder) {
            fatalError("Not supported.")
    }
       
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
    }
    
    @objc
    func favPressed() {
        cityItem.favourite = favsWorker.toggleFav(id: cityItem.id)
        setFavButtonTitle()
    }
    
    @objc
    func visitedPressed() {
        guard let visited = visited else { return }
        let modalViewController = VisitedViewController(visited: visited)
        modalViewController.modalPresentationStyle = .popover
        present(modalViewController, animated: true, completion: nil)
    }
    
    func setFavButtonTitle() {
        let buttonTitle = cityItem.favourite ? "Make not favourite" : "Make favourite" // Localizable strings should be used
        favButton.setTitle(buttonTitle, for: .normal)
    }
    
    func setup() {
        view.backgroundColor = .white
        stack.axis = .vertical
        cityImage.contentMode = .scaleAspectFit
        cityImage.image = cityItem.image
        cityLabel.text = cityItem.name
        peopleVisited.numberOfLines = 2
        peopleVisited.text = "Loading..."
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.visitedPressed))
        peopleVisited.isUserInteractionEnabled = true
        peopleVisited.addGestureRecognizer(tap)
        averageRating.text = "Loading..."
        favButton.backgroundColor = .gray
        favButton.addTarget(self, action: #selector(self.favPressed), for: .touchUpInside)
        
        [cityImage, cityLabel, peopleVisited, averageRating, favButton].forEach(stack.addArrangedSubview)
        view.addCustomSubview(stack)
        NSLayoutConstraint.activate([
            cityImage.heightAnchor.constraint(equalToConstant: 300),
            favButton.heightAnchor.constraint(equalToConstant: 200),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stack.topAnchor.constraint(equalTo: view.topAnchor),
            stack.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        restWorker.getCitiesRanks { (ranks: [GistCityRank]) in
            for rank in ranks {
                if rank.id == self.cityItem.id {
                    self.averageRating.text = String.init(format: "Average rating: %.2f", rank.rank)
                    break;
                }
            }
        }
        restWorker.getCitiesVisited { (visited: [GistCityVisited]) in
            for city in visited {
                if city.id == self.cityItem.id {
                    self.visited = city.peopleVisited
                    self.peopleVisited.text = String(format: "Number of people visited: %d (Tap to see names, pull down to close)", city.peopleVisited.count) // Localizable strings should be used
                    break;
                }
            }
        }
        setFavButtonTitle()
    }
}
