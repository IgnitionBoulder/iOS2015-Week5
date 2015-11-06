//
//  ItemDetailViewController.swift
//  week5
//
//  Created by Eric Reid on 11/5/15.
//  Copyright © 2015 Spark Boulder. All rights reserved.
//

import UIKit

class ItemDetailViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var itemNameField: UITextField!
    @IBOutlet weak var quantityField: UITextField!

    var shoppingList: ShoppingList!

    @IBAction func save(sender: AnyObject) {
        if let name = itemNameField.text, let quantity = quantityField.text {
            if let quantityInt = Int(quantity) {
                let item = ListItem(name: name, quantity: quantityInt)
                let selectedRow = pickerView.selectedRowInComponent(0)
                let category = shoppingList.sortedCategories()[selectedRow]
                shoppingList.addItem(item, category: category)
            }

        }

        dismissViewControllerAnimated(true, completion: nil)
    }


    @IBAction func cancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    // MARK: - UIPickerView

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return shoppingList.sortedCategories().count
    }

    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return shoppingList.sortedCategories()[row]
    }
}
