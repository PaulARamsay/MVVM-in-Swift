//
//  BusServicesViewController.swift
//  MVVMExample
//
//  Created by Paul Ramsay on 21/06/2020.
//  Copyright © 2020 Paul Ramsay. All rights reserved.
//

import UIKit

class BusServicesViewController: UIViewController {

    @IBOutlet weak var serviceTableView: UITableView!
    
    let viewModel: BusViewModel
    
    init(viewModel: BusViewModel = BusViewModel()) {
        /// Our view model, isn't initialised with properties so we can just create one in our initialiser.
        /// however if we wanted to pass in the endpoint to our view model, we could.
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.handleUpdate()
        self.handleFailure()
        self.serviceTableView.register(UINib(nibName: "ServiceTableViewCell", bundle: nil),
                                       forCellReuseIdentifier: "ServiceTableViewCell")
        self.title = "Bus Services"
        self.navigationController?.navigationBar.prefersLargeTitles = true 
    }
    
    private func handleUpdate() {
        /// Here we can handle updating the UI. For this example we just reload the table view.
        /// If we chose to implement a stackview, we could easily create each view with a model passed from the view model.
        /// Additionally if we fancied each of these views having a view model, we could initialise them here and pass them to the view.
        self.viewModel.updateUI = { [weak self] updateType in
            switch updateType {
            case .reloadTableView:
                DispatchQueue.main.async {
                    self?.serviceTableView.reloadData()
                }
            /// Additional cases could consist of deleting rows, adding rows.
                /// Whatever UI updates you would like to make for the view controller
            }
        }
    }
    
    private func handleFailure() {
        self.viewModel.failure = { failureType in
            switch failureType {
            case .downloadError(let errorMessage):
                /// Here we can choose how to handle the update. We could pop the view controller, or display an alert.
                /// It's up to you for how you handle the implementation
                print(errorMessage)
            case .codableError(let errorMessage):
                /// Here we can choose how to handle the update. We could pop the view controller, or display an alert.
                /// It's up to you for how you handle the implementation
                print(errorMessage)
            }
        }
    }
}

extension BusServicesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.busServicesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /// It's not recommended to force unwrap, but for this example, we'll do it anyway. It it doesn't dequeue the cell, the whole example's broken anyway :)
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ServiceTableViewCell.self),
                                                 for: indexPath) as! ServiceTableViewCell
        cell.service = self.viewModel.busServicesList[indexPath.row]
        return cell
    }
}
