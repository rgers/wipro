//
//  WiproFavouritesWorkerTests.swift
//  WiproFavouritesWorkerTests
//
//  Created by Radosław Gers on 26/08/2020.
//  Copyright © 2020 Radosław Gers. All rights reserved.
//

import XCTest
@testable import Wipro

class WiproFavouritesWorkerTests: XCTestCase {
    
    var worker: FavouritesWorker?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        worker = FavouritesWorker()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testFavouritesWorkerAddFav() throws {
        worker?.addFav(id: 1)
        guard let result = worker?.checkIfFav(id: 1) else {
            XCTAssert(false)
            return
        }
        XCTAssert(result)
    }
    
    func testFavouritesWorkerRemoveFav() throws {
        worker?.addFav(id: 1)
        if worker?.checkIfFav(id: 1) == false {
            XCTAssert(false)
            return
        }
        worker?.removeFav(id: 1)
        if (worker?.checkIfFav(id: 1)) == true {
            XCTAssert(false)
            return
        }
        
        XCTAssert(true)
    }
    
    func testFavouritesWorkerToggleFav() throws {
        guard let initial = worker?.checkIfFav(id: 1) else {
            XCTAssert(false)
            return
        }
        let resultToggleOne = worker?.toggleFav(id: 1)
        if(worker?.checkIfFav(id: 1) == initial || resultToggleOne == initial) {
            XCTAssert(false)
            return
        }
        let resultToggleTwo = worker?.toggleFav(id: 1)
        if(worker?.checkIfFav(id: 1) != initial || resultToggleTwo != initial) {
            XCTAssert(false)
            return
        }
        if(resultToggleOne==resultToggleTwo) {
            XCTAssert(false)
            return
        }
        XCTAssert(true)
    }
}
