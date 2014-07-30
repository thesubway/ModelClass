//
//  ViewController.swift
//  ModelClass
//
//  Created by Dan Hoang on 7/28/14.
//  Copyright (c) 2014 Dan Hoang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
                            
    @IBOutlet var tableView: UITableView!
    var questions : [Question]?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 44
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //var netwkctrl = NetworkController()
        //netwkctrl.fetchQuestionsForSearch("swift")
        let networkController = NetworkController()
        
        networkController.fetchQuestionsForSearchTerm("java", callback:{(questions : [Question]?, errorDescription : String?) -> Void in
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        println("LOW MEMORY HERE.")
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        if self.questions {
            return self.questions!.count }
        return 0
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("QuestionCell", forIndexPath: indexPath) as QuestionCell
        let question = self.questions![indexPath.row] as Question
        cell.textView.scrollEnabled = false
        cell.textView.text = question.title
        return cell
    }


}

