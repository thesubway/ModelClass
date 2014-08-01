//
//  rootViewController.swift
//  ModelClass
//
//  Created by Dan Hoang on 7/31/14.
//  Copyright (c) 2014 Dan Hoang. All rights reserved.
//

import UIKit

class rootViewController: UITableViewController {
    var detailVC = [AnyObject]()
    var selections = ["questionView","tagView"]
    //var menuBaseController = MenuBaseController()
    override func viewDidLoad() {
        super.viewDidLoad()
        let questionVC = self.storyboard.instantiateViewControllerWithIdentifier("questionView") as ViewController
        let tagsVC = self.storyboard.instantiateViewControllerWithIdentifier("tagView") as TagViewController
        
        detailVC.append(questionVC)
        detailVC.append(tagsVC)
        
        NSUserDefaults.standardUserDefaults().synchronize()
        if let isNew = NSUserDefaults.standardUserDefaults().valueForKey("newUser") as? Bool {
            println("You've been here before")
        } else {
            println("Welcome!")
            NSUserDefaults.standardUserDefaults().setBool(false, forKey: "newUser")
            NSUserDefaults.standardUserDefaults().synchronize()
            println("Wrote to NSUserDefaults")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    //always make sure this is at least 1.
    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        println(indexPath.row)
        //self.splitViewController.showViewController(detailVC[indexPath.row] as UIViewController, sender: self)
        self.showDetailViewController(detailVC[indexPath.row] as UIViewController, sender: self)
    }

    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return selections.count
    }

    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("rootCell", forIndexPath: indexPath) as UITableViewCell
        println("i got here.")
        // Configure the cell...
        cell.textLabel.text = selections[indexPath.row]
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
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
    override func tableView(tableView: UITableView!, moveRowAtIndexPath fromIndexPath: NSIndexPath!, toIndexPath: NSIndexPath!) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView!, canMoveRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
