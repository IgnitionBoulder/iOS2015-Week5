//
//  ListItemController.swift
//  week5
//
//  Created by Krizia Conrad on 11/4/15.
//  Copyright © 2015 Spark Boulder. All rights reserved.
//

import UIKit

class ListItemController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var itemNameField: UITextField!
    
    
    @IBOutlet weak var quantityField: UITextField!


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitButton(sender: UIButton) {
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationVC = segue.destinationViewController as! ViewController
        destinationVC.itemName = itemNameField.text!
        
        destinationVC.quantity = quantityField.text!
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
