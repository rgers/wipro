//
//  ViewController.swift
//  Wipro
//
//  Created by Radosław Gers on 26/08/2020.
//  Copyright © 2020 Radosław Gers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let citiesTable = UITableView()
    private let restWorker: RestWorker
    private let imageWorker: ImageWorker
    private let favsWorker: FavouritesWorker
    private var cities: [City] = [City]()
    private var citiesRequest: AnyObject?
    private var favouritesFilter = true
    
    init(restWorker: RestWorker, imageWorker: ImageWorker, favsWorker: FavouritesWorker) {
        self.restWorker = restWorker
        self.imageWorker = imageWorker
        self.favsWorker = favsWorker
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
    
    override func viewWillAppear(_ animated: Bool) {
        self.citiesTable.reloadData()
    }
    
    //MARK: Setup
    
    func setup() {
        citiesTable.dataSource = self
        citiesTable.delegate = self
        citiesTable.rowHeight = 95
        citiesTable.register(CityCell.self, forCellReuseIdentifier: "City")
        view.addCustomSubview(citiesTable)
        NSLayoutConstraint.activate([
            citiesTable.topAnchor.constraint(equalTo: view.topAnchor),
            citiesTable.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            citiesTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            citiesTable.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        loadMore()
    }
    
    func loadMore() {
        restWorker.getCities { (cities: [GistCity]) in
            for gistCity in cities {
                let city = City(imageWorker: self.imageWorker, id: gistCity.id, name: gistCity.name)
                city.favourite = self.favsWorker.checkIfFav(id: city.id)
                self.cities.append(city)
            }
            self.citiesTable.reloadData()
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let cell = cell as? CityCell {
            cell.viewModel = nil
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let city = cities[indexPath.row]
        navigationController?.pushViewController(DetailViewController(restWorker: restWorker, cityItem: city), animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "City", for: indexPath) as? CityCell else { return UITableViewCell() }
        let city = cities[indexPath.row]
        cell.viewModel = city
        return cell
    }
}

