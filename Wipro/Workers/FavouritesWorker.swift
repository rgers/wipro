//
//  FavouritesWorker.swift
//  Wipro
//
//  Created by Radosław Gers on 27/08/2020.
//  Copyright © 2020 Radosław Gers. All rights reserved.
//

import Foundation
class FavouritesWorker {
    // CoreData could be used
    // Caching as well
    
    let key = "favs"
    
    let defaults = UserDefaults.standard
    
    init() {
        let favs = defaults.array(forKey: key)
        if favs == nil {
            defaults.setValue([Int](), forKey: key)
        }
    }
    
    func checkIfFav(id: Int) -> Bool {
        guard let favs = defaults.array(forKey: key) as? [Int] else { return false }
        return favs.contains(id)
    }
    
    func getCount() -> Int {
        guard let favs = defaults.array(forKey: key) as? [Int] else { return 0 }
        return favs.count
    }
    
    func addFav(id: Int) {
        guard var favs = defaults.array(forKey: key) as? [Int] else { return }
        if !favs.contains(id) {
            favs.append(id)
            defaults.setValue(favs, forKey: key)
        }
    }
    
    func removeFav(id: Int) {
        guard var favs = defaults.array(forKey: key) as? [Int] else { return }
        if let index = favs.firstIndex(of: id) {
            favs.remove(at: index)
            defaults.setValue(favs, forKey: key)
        }
    }
    
    func toggleFav(id: Int) -> Bool {
        guard var favs = defaults.array(forKey: key) as? [Int] else { return false }
        if let index = favs.firstIndex(of: id) {
            favs.remove(at: index)
            defaults.setValue(favs, forKey: key)
            return false
        } else {
            favs.append(id)
            defaults.setValue(favs, forKey: key)
            return true
        }
    }
}
