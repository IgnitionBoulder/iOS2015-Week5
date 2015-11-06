//
//  ViewController.swift
//  week5
//
//  Created by Eric Reid on 10/26/15.
//  Copyright © 2015 Spark Boulder. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, MFMailComposeViewControllerDelegate  {

    var shoppingList = ShoppingList()

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        shoppingList.addItem(ListItem(name: "milk", quantity: 2), category: "Grocery")
        shoppingList.addItem(ListItem(name: "bread", quantity: 3), category: "Grocery")
        shoppingList.addItem(ListItem(name: "broom", quantity: 1), category: "Household")
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return shoppingList.sortedCategories().count
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let category = shoppingList.sortedCategories()[section]
        let items = shoppingList.items[category]!
        return items.count
    }

    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return shoppingList.sortedCategories()[section]
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)

        let category = shoppingList.sortedCategories()[indexPath.section]
        let items = shoppingList.items[category]!
        let item = items[indexPath.row]

        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "Quantity: \(item.quantity)"
        
        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let controller = segue.destinationViewController as? ItemDetailViewController {
            controller.shoppingList = self.shoppingList
        }
    }

    // MARK: - Actions

    @IBAction func add(sender: AnyObject) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)

        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            // ...
        }
        alertController.addAction(cancelAction)

        let addCategoryAction = UIAlertAction(title: "Add Category", style: .Default) { (action) in
            if let controller = self.storyboard?.instantiateViewControllerWithIdentifier("newCategory") as? NewCategoryViewController {
                controller.shoppingList = self.shoppingList
                self.presentViewController(controller, animated: true, completion: nil)
            }
        }
        alertController.addAction(addCategoryAction)

        let addItemAction = UIAlertAction(title: "Add Item", style: .Default) { (action) in
            self.performSegueWithIdentifier("showItem", sender: self)
        }
        alertController.addAction(addItemAction)
        
        self.presentViewController(alertController, animated: true) {

        }
    }

    @IBAction func mail(sender: AnyObject) {
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.presentViewController(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }

    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self

        mailComposerVC.setSubject("Shopping List")
        mailComposerVC.setMessageBody(shoppingList.description, isHTML: false)

        return mailComposerVC
    }

    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
    }

    // MARK: MFMailComposeViewControllerDelegate Method
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
}