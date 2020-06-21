//
//  ViewController.swift
//  MVVMExample
//
//  Created by Paul Ramsay on 21/06/2020.
//  Copyright © 2020 Paul Ramsay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func CTAClicked(_ sender: Any) {
        let viewController = BusServicesViewController(viewModel: BusViewModel())
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

