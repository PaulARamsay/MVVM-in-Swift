//
//  ServiceTableViewCell.swift
//  MVVMExample
//
//  Created by Paul Ramsay on 21/06/2020.
//  Copyright © 2020 Paul Ramsay. All rights reserved.
//

import UIKit

class ServiceTableViewCell: UITableViewCell {

    @IBOutlet weak var serviceNumberTextLabel: UILabel!
    @IBOutlet weak var serviceDescriptionTextLabel: UILabel!
    
    var service: BusService? {
        didSet {
            setupBusService(service)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.serviceNumberTextLabel.layer.cornerRadius = self.serviceNumberTextLabel.frame.height / 2
        self.serviceNumberTextLabel.layer.borderColor = UIColor.red.cgColor
        self.serviceNumberTextLabel.layer.borderWidth = 3
    }
    
    private func setupBusService(_ service: BusService?) {
        guard let service = service else {
            return
        }
        
        self.serviceNumberTextLabel.text = service.name
        self.serviceDescriptionTextLabel.text = service.description
    }
}
