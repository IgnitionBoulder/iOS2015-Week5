//
//  TableViewCell.swift
//  navigation
//
//  Created by Eric Reid on 10/27/15.
//  Copyright © 2015 Spark Boulder. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func stepperChanged(sender: AnyObject) {
        if let stepper = sender as? UIStepper {
            let value = stepper.value
            numberLabel.text = "\(value)"
        }
    }
}
