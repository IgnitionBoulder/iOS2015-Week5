//
//  selectItem.swift
//  week5
//
//  Created by Alex on 10/31/15.
//  Copyright © 2015 Spark Boulder. All rights reserved.
//

import UIKit

class selectItem: UIViewController, UINavigationControllerDelegate {

    @IBOutlet var itemLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemLabel.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addItem(sender: AnyObject) {
        
        /* I have to tell this function:
            What to Add
            Where to find that
            Where to store it
            Who will store it
        */
        
    
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
