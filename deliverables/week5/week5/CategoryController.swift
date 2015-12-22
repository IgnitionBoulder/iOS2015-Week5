//
//  CategoryController.swift
//  week5
//
//  Created by Krizia Conrad on 11/3/15.
//  Copyright © 2015 Spark Boulder. All rights reserved.
//

import UIKit

class CategoryController: UIViewController {
    

    @IBOutlet weak var categoryFormItem: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addCategory(sender: UIButton) {
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationVC = segue.destinationViewController as! ViewController
        destinationVC.category = categoryFormItem.text!
    }

}