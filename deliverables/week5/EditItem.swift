//
//  EditItem.swift
//  week5
//
//  Created by Aliisa Roe on 11/1/15.
//  Copyright © 2015 Spark Boulder. All rights reserved.
//

import UIKit


class EditItem: UIViewController, UIPickerViewDelegate {
    
    var delegate : EditItemDelegate? = nil
    
    
    var itemNameLabelText : String!
    var itemQuantityLabelText : String!
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemNameLabel.text = itemNameLabelText
        itemQuantityLabel.text = itemQuantityLabelText
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
        //editedItem = ListItem(name: itemNameTextField.text!,quantity: Int(itemQuantityTextField.text!)!)
        if let newName = editedItemName {
            if let newQuantity = editedItemQuantity {
                delegate!.doneEditing(chosenCategory, editedItemName: newName, editedItemQuantity: newQuantity, controller: self)
            }
        }
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    /*
    // MARK: - Navigation//

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
