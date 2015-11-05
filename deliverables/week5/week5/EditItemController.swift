//
//  EditItemController.swift
//  week5
//
//  Created by Krizia Conrad on 11/4/15.
//  Copyright © 2015 Spark Boulder. All rights reserved.
//

import UIKit

class EditItemController: UIViewController {
    
    var categoryToEdit: String?
    
    var nameToEdit: String?
    
    var quantityToEdit: String?
    
    @IBOutlet weak var editCategory: UITextField!
    
    @IBOutlet weak var editName: UITextField!
    
    @IBOutlet weak var editQuantity: UITextField!
    
    @IBAction func editSubmit(sender: UIButton) {
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationVC = segue.destinationViewController as! ViewController
        destinationVC.editedCategory = editCategory.text!
        
        destinationVC.editedQuantity = editQuantity.text!
        
        destinationVC.editedName = editName.text!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        editCategory.text = categoryToEdit
        editName.text = nameToEdit
        editQuantity.text = quantityToEdit

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
