//
//  MenuBaseController.swift
//  ModelClass
//
//  Created by Dan Hoang on 7/31/14.
//  Copyright (c) 2014 Dan Hoang. All rights reserved.
//

import UIKit

class MenuBaseController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    var views = ["questionView","tagView"]
    
    @IBOutlet var tableViewRoot: UITableView!
    override func viewDidLoad() {
        tableViewRoot.delegate = self
        tableViewRoot.dataSource = self
        super.viewDidLoad()
        println("IN THE MENU")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    /*
    let detailViewControl = self.storyboard.instantiateViewControllerWithIdentifier("detailViewControl") as DetailViewController
    if self.navigationController {
    self.navigationController.pushViewController(detailViewControl, animated: true)
    }
    */
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        println("menu table reloads")
        self.tableViewRoot?.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 0
    }

    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        
        print("views.count is: ")
        println(views.count)
        return views.count
    }

    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        print("cell text is: ")
        let cell = tableViewRoot.dequeueReusableCellWithIdentifier("rootCell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel.text = views[indexPath.row]
        println(cell.textLabel.text)
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

    

}
