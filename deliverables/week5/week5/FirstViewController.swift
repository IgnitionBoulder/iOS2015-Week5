//
//  FirstViewController.swift
//  week5
//
//  Created by Adele Bible on 11/2/15.
//  Copyright © 2015 Spark Boulder. All rights reserved.
//

import UIKit

protocol Cat{
    func Categoryadded(category: Category)
}

class FirstViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var LoadCategory: UIButton!
    @IBOutlet weak var textfield: UITextField!
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
