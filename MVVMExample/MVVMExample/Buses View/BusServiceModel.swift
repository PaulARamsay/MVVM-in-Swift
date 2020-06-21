//
//  BusServiceModel.swift
//  MVVMExample
//
//  Created by Paul Ramsay on 21/06/2020.
//  Copyright © 2020 Paul Ramsay. All rights reserved.
//

import Foundation

struct BusServiceModel: Codable {
    let lastUpdated: Int
    let services: [BusService]
}

struct BusService: Codable {
    let name: String
    let description: String
    let serviceType: String
    let routes: [BusRoute]
}

struct BusRoute: Codable {
    let stopID: String?
    let latitude: Float?
    let longitude: Float?
}
