//
//  SecondViewController.swift
//  data
//
//  Created by Eric Reid on 10/29/15.
//  Copyright © 2015 Spark Boulder. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

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

    @IBAction func loadImage(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(.SavedPhotosAlbum) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .SavedPhotosAlbum;
            imagePicker.allowsEditing = false
            imagePicker.modalTransitionStyle = .PartialCurl

            presentViewController(imagePicker, animated: true, completion: nil)
        }
    }

    // MARK: - UIImagePickerControllerDelegate
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let image = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            NSNotificationCenter.defaultCenter().postNotificationName("imageLoaded", object: self, userInfo: ["image": image])
        }

        dismissViewControllerAnimated(false) { () -> Void in
            print("Hello")
        }
        navigationController?.popViewControllerAnimated(false)
    }
}
