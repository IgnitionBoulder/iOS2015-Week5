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

    override func viewDidLoad() {
        super.viewDidLoad()
        shoppingList.addItem(ListItem(name: "milk", quantity: 2), category: "Grocery")
        shoppingList.addItem(ListItem(name: "bread", quantity: 3), category: "Grocery")
        shoppingList.addItem(ListItem(name: "broom", quantity: 1), category: "Household")
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