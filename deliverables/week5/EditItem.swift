//
//  EditItem.swift
//  week5
//
//  Created by Aliisa Roe on 11/1/15.
//  Copyright © 2015 Spark Boulder. All rights reserved.
//

import UIKit


class EditItem: UIViewController, UIPickerViewDelegate, UITextFieldDelegate {
    
    var delegate : EditItemDelegate? = nil
    
    
    var itemNameLabelText : String!
    var itemQuantityLabelText : Int!
    var itemCategoryLabelText : String!
    var categories : [String]!
    var chosenCategory: String!
    var editedItemName : String!
    var editedItemQuantity : Int!


    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemQuantityLabel: UILabel!
    @IBOutlet weak var itemCategoryLabel: UILabel!
    @IBOutlet weak var itemNameTextField: UITextField!
    @IBOutlet weak var itemQuantityTextField: UITextField!
    @IBOutlet weak var categoryPicker: UIPickerView!


    @IBAction func editName(sender: AnyObject) {
        categoryPicker.resignFirstResponder()
        itemNameTextField.hidden = false
    }
    @IBAction func editQuantity(sender: AnyObject) {
        itemQuantityTextField.hidden = false
    }
    @IBAction func editCategory(sender: AnyObject) {
        categoryPicker.hidden = false
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        itemNameTextField.resignFirstResponder()
        itemQuantityTextField.resignFirstResponder()
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemNameLabel.text = itemNameLabelText
        itemQuantityLabel.text = "Quantity is \(itemQuantityLabelText)"
        itemCategoryLabel.text = itemCategoryLabelText

        // Do any additional setup after loading the view.
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return categories.count
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func done(sender: AnyObject) {
        chosenCategory = categoryPicker.selectedRowInComponent(0).description
        if var newName = itemNameTextField.text {
            if itemNameTextField.text == "" {
                newName = itemNameLabelText
            }
            
            var bestQuantity : Int?
            if var newQuantity = itemQuantityTextField.text {
                if itemQuantityTextField.text != "" {
                    bestQuantity = Int(newQuantity)
                } else if itemQuantityTextField.text! == "" {
                    bestQuantity = itemQuantityLabelText
                }
                if bestQuantity == nil {
                    itemQuantityLabel.text = "Please enter a valid quantity "
                    itemQuantityTextField.hidden = true
                } else {
                delegate!.doneEditing(itemNameLabelText, originalCategory: itemCategoryLabelText, chosenCategory: chosenCategory, editedItemName: newName,editedItemQuantity: bestQuantity!, controller: self)
                     self.navigationController?.popViewControllerAnimated(true)
                }
            }
        }
    }

}



    /*
    // MARK: - Navigation//

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


