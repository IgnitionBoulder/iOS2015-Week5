//
//  SecondViewController.swift
//  data
//
//  Created by Eric Reid on 10/29/15.
//  Copyright © 2015 Spark Boulder. All rights reserved.
//

import UIKit

protocol Monkey {
    func imageLoaded(image: UIImage)
}

class SecondViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var delegate: protocol<Monkey>?

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
            if let delegate = delegate {
                delegate.imageLoaded(image)
            }
        }

        dismissViewControllerAnimated(true, completion: nil)
        navigationController?.popViewControllerAnimated(false)
    }
}
