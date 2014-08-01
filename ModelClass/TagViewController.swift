//
//  ViewController.swift
//  ModelClass
//
//  Created by Dan Hoang on 7/28/14.
//  Copyright (c) 2014 Dan Hoang. All rights reserved.
//

import UIKit

class TagViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    var questions : [Question]?
    var tags: [Tag]?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.dataSource = self
        //this causes error.
        self.searchBar.delegate = self
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 44
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //var netwkctrl = NetworkController()
        //netwkctrl.fetchQuestionsForSearch("swift")
        let networkController = NetworkController()
        
        /*networkController.fetchQuestionsForSearchTerm("java", callback:{(questions : [Question]?, errorDescription : String?) -> Void in
        if errorDescription {
        //alert the user of an error
        }
        else {
        //put it back on main thread
        NSOperationQueue.mainQueue().addOperationWithBlock() {
        self.questions = questions
        self.tableView.reloadData()
        }
        }
        }) */
        println("should call fetchTagsTerm")
        networkController.fetchTagsTerm({(tags : [Tag]?, errorDescription : String?) -> Void in
            if errorDescription {
                //alert the user of an error
                println("error")
            }
            else {
                println("it works")
                //put it back on main thread
                NSOperationQueue.mainQueue().addOperationWithBlock() {
                    self.tags = tags
                    self.tableView.reloadData()
                }
            }
            })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        println("LOW MEMORY HERE.")
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        if self.tags {
            return self.tags!.count }
        println("uh-oh. it's returning 0")
        return 0
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("tagCell", forIndexPath: indexPath) as TagCell
        //let question = self.questions![indexPath.row] as Question
        let tag = self.tags![indexPath.row] as Tag
        cell.textView.scrollEnabled = false
        //cell.textView.text = question.title
        cell.textView.text = tag.name
        return cell
    }
    func searchBar(searchBar: UISearchBar!, textDidChange searchText: String!) {
        let networkController = NetworkController()
        
        networkController.fetchQuestionsForSearchTerm(searchText, callback:{(questions : [Question]?, errorDescription : String?) -> Void in
            if errorDescription {
                //alert the user of an error
            }
            else {
                //put it back on main thread
                NSOperationQueue.mainQueue().addOperationWithBlock() {
                    self.questions = questions
                    self.tableView.reloadData()
                }
            }
            })
        
    }
}

