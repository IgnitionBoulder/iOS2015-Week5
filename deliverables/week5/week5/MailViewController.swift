//
//  MailViewController.swift
//  week5
//
//  Created by JING ZHANG on 11/2/15.
//  Copyright © 2015 Spark Boulder. All rights reserved.
//

import UIKit
import MessageUI

class MailViewController: UIViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var body: UITextView!
    
    @IBOutlet weak var subject: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func sendEmail(sender: UIButton) {
        
        var SubjectText = "Shopping List"
        SubjectText += subject.text!
        var MessageBody = body
        
        var toRecipients = ["jing.zhang.nrel@gmail.com"]
        
        var mc: MFMailComposeViewController = MFMailComposeViewController()
        
        mc.mailComposeDelegate = self
        mc.setSubject(SubjectText)
        mc.setMessageBody(MessageBody.text, isHTML: false)
        mc.setToRecipients(toRecipients)
        
        self.presentViewController(mc, animated: true, completion: nil)
        }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        switch result.value {
            case MFMailComposeResultCancelled.value:
            NSLog("Mail Cancelled")
        case MFMailComposeResultSaved.value:
            NSLog("Mail Saved")
        case MFMailComposeResultSent.value:
            NSLog("Mail Sent")
        case MFMailComposeResultFailed.value:
            NSLog("Mail Sent Failure:%@", [error.localizedDescription])
        default:
            break
            
        }
        self.dimissViewControllerAnimated(true, completion: nil)
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
