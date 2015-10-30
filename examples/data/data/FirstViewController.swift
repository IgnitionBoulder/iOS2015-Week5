//
//  FirstViewController.swift
//  data
//
//  Created by Eric Reid on 10/29/15.
//  Copyright © 2015 Spark Boulder. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "showImage:", name: "imageLoaded", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "backgrounding", name:
            UIApplicationDidEnterBackgroundNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func backgrounding() {
        print("Going into background")
    }

    func showImage(notification: NSNotification) {
        if let image = notification.userInfo?["image"] as? UIImage {
            imageView.image = image
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let second = segue.destinationViewController as? SecondViewController {
            
        }
    }

}
