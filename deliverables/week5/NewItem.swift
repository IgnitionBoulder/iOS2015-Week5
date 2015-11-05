//
//  NewItem.swift
//  week5
//
//  Created by Aliisa Roe on 11/1/15.
//  Copyright © 2015 Spark Boulder. All rights reserved.
//

import UIKit

class NewItem: UIViewController, UIPickerViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var itemNameTextField: UITextField!
    @IBOutlet weak var itemQuantityTextField: UITextField!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var delegate : NewItemDelegate? = nil
    
    var categories : [String]!
    
    @IBOutlet weak var categoryPickerView: UIPickerView!
    
    @IBAction func finishAddingItem(sender: AnyObject) {
        if itemNameTextField.text == "" {
            nameLabel.text = "Please add a name"
        } else {
            if itemQuantityTextField.text == ""   {
                quantityLabel.text = "Please add a quantity"
            } else {
                if let nameOfItem = itemNameTextField.text {
                        if let quantityOfItem = itemQuantityTextField.text {
                            let itemCategory = categoryPickerView.selectedRowInComponent(0).description
                            delegate!.doneAddingItem(nameOfItem, quantityOfItem: Int(quantityOfItem), itemCategory: itemCategory, controller: self)
                    }
                }
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return categories[row]
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */ //

}
