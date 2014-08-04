//
//  ViewController.swift
//  ModelClass
//
//  Created by Dan Hoang on 7/28/14.
//  Copyright (c) 2014 Dan Hoang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
                            
    @IBOutlet var webView: UIWebView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    var questions : [Question]?
    var tags: [Tag]?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        webView.hidden = true
        self.tableView.dataSource = self
        //self.tableView.delegate = self
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
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        println("selected cell")
        if let qCell = tableView.cellForRowAtIndexPath(indexPath) as? QuestionCell {
            println(qCell.linkURL)
            //UIApplication.sharedApplication().openURL(NSURL(string: "www.google.com"))
            webView.hidden = false
            var convURL = NSURLRequest(URL: NSURL(string: qCell.linkURL))
            self.webView.loadRequest(convURL)
//            let rVC = self.storyboard.instantiateViewControllerWithIdentifier("rootView") as rootViewController
//            let webVC = self.storyboard.instantiateViewControllerWithIdentifier("webViewController") as rootViewController
//            rVC.showDetailViewController(webVC,sender: self)
        }
        
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        if self.questions {
            return self.questions!.count }
        println("uh-oh. it's returning 0")
        return 0
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("QuestionCell", forIndexPath: indexPath) as QuestionCell
        //let question = self.questions![indexPath.row] as Question
        let question = self.questions![indexPath.row] as Question
        cell.textView.scrollEnabled = false
        cell.textView.hidden = true
        cell.textLabel.text = question.title
        cell.linkURL = question.link
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

