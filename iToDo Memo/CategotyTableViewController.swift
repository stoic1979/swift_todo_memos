//
//  CategotyTableViewController.swift
//  iToDo Memo
//
//  Created by wb27 on 7/7/15.
//  Copyright (c) 2015 Weavebytes Infotech Pvt Ltd. All rights reserved.
//

import UIKit

class CategotyTableViewController: UITableViewController {


    
    
    var data = [SQLRow]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
       

    }
    
    
    override func viewWillAppear(animated: Bool) {
        let db = SQLiteDB.sharedInstance()
        data = db.query("SELECT * FROM category")
        
        for row in data {
            NSLog("Category: %@", row["title"]!.asString())
        }
        
        self.tableView.reloadData()

    }
    
    
     //Navigate from a view controller to other viewcontroller
    
    @IBAction func addClicked(id:UIBarButtonItem){
        
        var VC1 = self.storyboard!.instantiateViewControllerWithIdentifier("AddCategoryViewController") as! AddCategoryViewController
        
        self.navigationController!.pushViewController(VC1, animated: true)
        
            }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return data.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("categoryCell", forIndexPath: indexPath) as! UITableViewCell

        
        var row = data[indexPath.row]
        
        cell.textLabel?.text = row["title"]!.asString()
        
        // Configure the cell...

        return cell
    }
    

    //On Click Category Event
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
        
        var VC1 = self.storyboard!.instantiateViewControllerWithIdentifier("TodoTableViewController") as! TodoTableViewController
        
        self.navigationController!.pushViewController(VC1, animated: true)
        
//        let tappedItem = todoItems[indexPath.row] as TodoItem
//        tappedItem.completed = !tappedItem.completed

        
        
        // reload table
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.None)
        
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
