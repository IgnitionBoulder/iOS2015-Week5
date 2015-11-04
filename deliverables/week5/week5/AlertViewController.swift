//
//  AlertViewController.swift
//  week5
//
//  Created by Alex on 11/3/15.
//  Copyright © 2015 Spark Boulder. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func alertview() {
      
            let alert = UIAlertController(title: "Alert View", message: "Create a new category", preferredStyle:.Alert)
    
            let cancel = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        
            alert.addAction(cancel)
        
        
            let ok = UIAlertAction(title: "OK", style: .Default) {(action: UIAlertAction) -> Void in
                    print("OK")
            }
        
            alert.addAction(ok)
        
            self.presentViewController(alert, animated: true, completion: nil)
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
