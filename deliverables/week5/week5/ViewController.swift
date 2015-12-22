//
//  ViewController.swift
//  week5
//
//  Created by Eric Reid on 10/26/15.
//  Copyright © 2015 Spark Boulder. All rights reserved.
//

import UIKit


protocol EditItemDelegate{
    func doneEditing(originalItemName: String, originalCategory: String, chosenCategory: String, editedItemName : String, editedItemQuantity : Int, controller: EditItem)
} //include EditItemDelegate

protocol NewCategoryDelegate{
    func doneAddingCategory(newCategory : String, controller: NewCategory)
}

protocol NewItemDelegate {
    func doneAddingItem(nameOfItem : String?, quantityOfItem : Int?, itemCategory : String, controller : NewItem)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,NewCategoryDelegate, NewItemDelegate, EditItemDelegate {

    @IBAction func mailButtonPressed(sender: AnyObject) {
        let email = "foo@bar.com"
        let url = NSURL(string: "mailto:\(email)")
        UIApplication.sharedApplication().openURL(url!)
    }
    
    
    @IBAction func plusButton(sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add", message: "Would you like to: ", preferredStyle: .ActionSheet)
        let newCategoryButton = UIAlertAction(title: "Create New Category", style: .Default) { ACTION in
            self.performSegueWithIdentifier("newCategory", sender: nil)
            }
        let newListButton = UIAlertAction(title: "Create New List", style: .Default) { ACTION in
            self.shoppingList.items = [:]
            self.performSegueWithIdentifier("newCategory", sender: nil)
            self.tableView.reloadData()
            }
        let cancelButton = UIAlertAction(title: "Cancel", style: .Cancel){ ACTION in
            }
        alert.addAction(newCategoryButton)
        alert.addAction(newListButton)
        alert.addAction(cancelButton)
        
        presentViewController(alert, animated: true, completion: nil)
        }
   

    

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
        tableView.reloadData()
        controller.navigationController!.popViewControllerAnimated(true)
    }
    
    func doneAddingItem(nameOfItem: String?, quantityOfItem: Int?, itemCategory: String, controller: NewItem) {
        let itemCategory = shoppingList.sortedCategories()[Int(itemCategory)!]
        if let quantityOfItem = quantityOfItem {
            if let nameOfItem = nameOfItem {
                shoppingList.addItem(ListItem(name: nameOfItem, quantity: quantityOfItem), category: itemCategory)
            }
        }
        tableView.reloadData()
        controller.navigationController!.popViewControllerAnimated(true)
    }
    
    func doneEditing(originalItemName: String, originalCategory: String, chosenCategory: String, editedItemName: String, editedItemQuantity: Int, controller: EditItem) {
        var itemToEdit = shoppingList.itemsMatching(originalItemName)[0]
        
        var index = 0
        for listItem in shoppingList.items[originalCategory]! {
            if listItem.name == originalItemName {
                shoppingList.items[originalCategory]?.removeAtIndex(index)
            }
            index += 1
        }
        
        itemToEdit.name = editedItemName
        itemToEdit.quantity = editedItemQuantity
        
        let newCategory = shoppingList.sortedCategories()[Int(chosenCategory)!]
        
        shoppingList.items[newCategory]!.append(itemToEdit)
        
        tableView.reloadData()
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
            destination.itemQuantityLabelText = items![indexPath.row].quantity
            destination.itemCategoryLabelText = category
            destination.categories = shoppingList.sortedCategories()
            destination.delegate = self
        }
       /* if let addItemButton = sender as? UIBarButtonItem, let destination = segue.destinationViewController as? NewItem {
            destination.categories = shoppingList.sortedCategories()
        }*/
        if segue.identifier == "newCategory" {
            let destination = segue.destinationViewController as? NewCategory
            destination!.delegate = self
        }
        if segue.identifier == "newItem" {
            let destination = segue.destinationViewController as? NewItem
            destination!.categories = shoppingList.sortedCategories()
            destination!.delegate = self
        }

}
}
// Get the new view controller using segue.destinationViewController.
// Pass the selected object to the new view controller.

