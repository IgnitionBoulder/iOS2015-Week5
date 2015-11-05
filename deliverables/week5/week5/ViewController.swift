//
//  ViewController.swift
//  week5
//
//  Created by Eric Reid on 10/26/15.
//  Copyright © 2015 Spark Boulder. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var shoppingList = ShoppingList()
    
    var category: String?
    
    var itemName: String?
    
    var quantity: String?
    
    var editedCategory: String?
    
    var editedName: String?
    
    var editedQuantity: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shoppingList.addItem(ListItem(name: "milk", quantity: 2), category: "Grocery")
        shoppingList.addItem(ListItem(name: "bread", quantity: 3), category: "Grocery")
        shoppingList.addItem(ListItem(name: "broom", quantity: 1), category: "Household")
        if (category != nil) {
            shoppingList.addCategory(category!)
        }
        if (itemName != nil && quantity != nil) {
            shoppingList.addItem(ListItem(name: itemName!, quantity: Int(quantity!)!), category: "asdf")
        }
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationVC = segue.destinationViewController as! EditItemController
//        destinationVC.nameToEdit = sender.
//        destinationVC.quantity = quantityField.text!
//        stopping point here
    }
    
}