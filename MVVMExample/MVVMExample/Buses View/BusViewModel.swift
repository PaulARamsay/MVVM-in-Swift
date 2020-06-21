//
//  BusViewModel.swift
//  MVVMExample
//
//  Created by Paul Ramsay on 21/06/2020.
//  Copyright © 2020 Paul Ramsay. All rights reserved.
//

import Foundation

enum BusViewModelSuccess {
    case reloadTableView
}

enum BusViewModelFailure {
    case downloadError(_ message: String)
    case codableError(_ message: String)
}

class BusViewModel {
    
    private let url = URL(string: "https://tfe-opendata.com/api/v1/services")
    var busServicesList = [BusService]()
    var updateUI: ((BusViewModelSuccess) -> ())? {
        didSet {
            self.fetchData()
        }
    }
    var failure: ((BusViewModelFailure) -> ())? {
        didSet {
            self.fetchData()
        }
    }
    
    private func fetchData() {
        guard let url = url else {
            return
        }
        
        let session = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                if let error = error {
                    self.failure?(.downloadError("Error: Could not fetch data - \(error)"))
                    return
                }
                return
            }

            do {
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                let busServices = try jsonDecoder.decode(BusServiceModel.self, from: data)
                self.busServicesList = busServices.services
                self.updateUI?(.reloadTableView)
            } catch let error {
                self.failure?(.codableError("Error: Could not decode model - \(error)"))
            }
        }
        session.resume()
    }
}
