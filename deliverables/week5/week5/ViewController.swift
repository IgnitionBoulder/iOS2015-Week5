//
//  ViewController.swift
//  week5
//
//  Created by Eric Reid on 10/26/15.
//  Copyright © 2015 Spark Boulder. All rights reserved.
//

import UIKit


protocol EditItemDelegate{
    func doneEditing(chosenCategory: String, editedItemName : String, editedItemQuantity : Int, controller: EditItem)
} //include EditItemDelegate

protocol NewCategoryDelegate{
    func doneAddingCategory(newCategory : String, controller: NewCategory)
}

protocol NewItemDelegate {
    func doneAddingItem(nameOfItem : String, quantityOfItem : Int, itemCategory : String, controller : NewItem)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NewCategoryDelegate, NewItemDelegate, EditItemDelegate {
    

    @IBOutlet weak var tableView: UITableView!
    
    
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
    
    func doneAddingCategory(newCategory: String, controller: NewCategory) {
        shoppingList.addCategory(newCategory)
        controller.navigationController!.popViewControllerAnimated(true)
    }
    
    func doneAddingItem(nameOfItem: String, quantityOfItem: Int, itemCategory: String, controller: NewItem) {
        shoppingList.addItem(ListItem(name: nameOfItem, quantity: quantityOfItem), category: itemCategory)
        controller.navigationController!.popViewControllerAnimated(true)
    }
    
    func doneEditing(chosenCategory: String, editedItemName: String, editedItemQuantity: Int, controller: EditItem) {
        //need more code to add to shopping list, 
        controller.navigationController!.popViewControllerAnimated(true)
    }

// MARK: - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
       // var editItemScreen = segue.destinationViewController as? EditItem
        if let cell = sender as? UITableViewCell, let destination = segue.destinationViewController as? EditItem {
            let indexPath = tableView.indexPathForCell(cell)!
            let category = shoppingList.sortedCategories()[indexPath.section]
            let items = shoppingList.items[category]
            destination.itemNameLabelText = items![indexPath.row].name
            destination.itemQuantityLabelText = "Quantity is: \(items![indexPath.row].quantity)"
            destination.itemCategoryLabelText = category
            destination.categories = shoppingList.sortedCategories()
            destination.delegate = self
        }
       /* if let addItemButton = sender as? UIBarButtonItem, let destination = segue.destinationViewController as? NewItem {
            destination.categories = shoppingList.sortedCategories()
        }*/
        if segue.identifier == "newItem" {
            let destination = segue.destinationViewController as? NewItem
            destination!.categories = shoppingList.sortedCategories()
            destination!.delegate = self
        }

        if segue.identifier == "newCategory" {
            let destination = segue.destinationViewController as? NewCategory
            destination!.delegate = self
        }

        
        
        /*if let indexPath = () {
            editItemScreen.
        }*/
    


    }
// Get the new view controller using segue.destinationViewController.
// Pass the selected object to the new view controller.
    @IBAction func unwindToShoppingList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.sourceViewController as? NewCategory, newCategory = sourceViewController.newCategory {
            shoppingList.addCategory(newCategory)
            let newIndexPath = NSIndexPath(forRow: shoppingList.sortedCategories().count, inSection: 0 )

            //tableView.insertSections(shoppingList.sortedCategories(), withRowAnimation: .Bottom)
               // insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
        }
    }
 
}
