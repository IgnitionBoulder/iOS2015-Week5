//
//  ItemViewController.swift
//  navigation
//
//  Created by Eric Reid on 10/27/15.
//  Copyright © 2015 Spark Boulder. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {

    @IBOutlet weak var label: UILabel!

    @IBAction func blah(sender: AnyObject) {
    }
    var labelText: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = labelText
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
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
