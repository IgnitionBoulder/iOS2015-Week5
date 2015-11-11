//
//  ViewController.swift
//  week5
//
//  Created by Eric Reid on 10/26/15.
//  Copyright © 2015 Spark Boulder. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var shoppingList = ShoppingList()

    override func viewDidLoad() {
        super.viewDidLoad()
        shoppingList.addItem(ListItem(name: "milk", quantity: 2), category: "Grocery")
        shoppingList.addItem(ListItem(name: "bread", quantity: 3), category: "Grocery")
        shoppingList.addItem(ListItem(name: "broom", quantity: 1), category: "Household")
}

    @IBAction func editList(sender: AnyObject) {
        let alertController: UIAlertController = UIAlertController(title: "Edit List", message: "What would you like to edit?", preferredStyle: .Alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
        }
        alertController.addAction(cancelAction)
        
        let itemAction = UIAlertAction(title: "Edit Items", style: .Default) { (action) in
            self.performSegueWithIdentifier("toEdit", sender: self)
        }
        alertController.addAction(itemAction)
        
        let categoryAction = UIAlertAction(title: "Add a Category", style: .Default) { (action) in
            self.performSegueWithIdentifier("toCategory", sender: self)
        }
        alertController.addAction(categoryAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }

    func userAddedCategory(name: NSString) {
        shoppingList.addCategory(name as String)
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
    

}