//
//  NewCategory.swift
//  week5
//
//  Created by Aliisa Roe on 11/1/15.
//  Copyright © 2015 Spark Boulder. All rights reserved.
//

import UIKit


class NewCategory: UIViewController, UITextFieldDelegate{
    
    
    var newCategory: String?
    var delegate : NewCategoryDelegate? = nil
    
    @IBOutlet weak var newCategoryTextField: UITextField!

    @IBAction func addCategory(sender: AnyObject) {
        if let newCategory = newCategoryTextField.text {
            delegate!.doneAddingCategory(newCategory, controller: self)
        }
    }
    @IBOutlet weak var addCategoryButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if addCategoryButton === sender {
            newCategory = newCategoryTextField.text ?? "" //this is nifty, but i don't totally understand it
        }
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
