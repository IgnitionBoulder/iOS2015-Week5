//
//  CategoryViewController.swift
//  week5
//
//  Created by JING ZHANG on 11/1/15.
//  Copyright © 2015 Spark Boulder. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController,UITextFieldDelegate  {

    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var categoryTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        categoryTextField.delegate = self
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        categoryNameLabel.text = textField.text
    }
    
    @IBAction func createNewCategory(sender: UIButton) {
        
        categoryNameLabel.text = "Default Text"
        
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
