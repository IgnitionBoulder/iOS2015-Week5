//
//  ItemViewController.swift
//  week5
//
//  Created by JING ZHANG on 11/2/15.
//  Copyright © 2015 Spark Boulder. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController, UITextFieldDelegate  {

    @IBOutlet weak var ItemNameLabel: UILabel!
    @IBOutlet weak var ItemQuantityLabel: UILabel!
    @IBOutlet weak var ItemCategoryLabel: UILabel!
    
    @IBOutlet weak var ItemTextField: UITextField!
    @IBOutlet weak var ItemQuanityTextField: UITextField!
    @IBOutlet weak var ItemCategoryTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        ItemTextField.delegate = self
        ItemQuanityTextField.delegate = self
        ItemCategoryTextField.delegate = self
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        ItemNameLabel.text = textField.text
    }
    

    @IBAction func createNewItem(sender: UIButton) {
        
        ItemNameLabel.text = "Default Text"
        
    }
    @IBAction func editQuantity(sender: UIButton) {
        
    }
    
    @IBAction func selectCategory(sender: UIButton) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
