//
//  NewCategoryViewController.swift
//  week5
//
//  Created by Eric Reid on 11/5/15.
//  Copyright © 2015 Spark Boulder. All rights reserved.
//

import UIKit

class NewCategoryViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    var shoppingList: ShoppingList!

    @IBAction func save() {
        if let categoryName = textField.text where !categoryName.isEmpty {
            shoppingList.addCategory(categoryName)
        }

        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func cancel() {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
