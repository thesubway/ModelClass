//
//  NetworkController.swift
//  ModelClass
//
//  Created by Dan Hoang on 7/29/14.
//  Copyright (c) 2014 Dan Hoang. All rights reserved.
//

import Foundation

class NetworkController {
    
    var configuration = NSURLSessionConfiguration.ephemeralSessionConfiguration()
    //added:
    //this is always going to be the domain:
    let apiDomain = "http://api.stackexchange.com/2.2"
    //generally, we don't always have to pick stack overflow. just in this case.
    let searchEndpoint = "/search?order=desc&sort=activity"
    let tagEndpoint = "/tags?order=desc&sort=popular"
    var siteParameter = "&site=stackoverflow"
    var questions = [Question]()
    var answers = [Answer]()
    var tags = [Tag]()
    
    func parseSuccessfulResponse(responseData : NSData) -> [Question]{
        if let responseDict = NSJSONSerialization.JSONObjectWithData(responseData, options: nil, error: nil) as? NSDictionary {
            
            if let items = responseDict["items"] as? NSArray {
                for item in items {
                    if let itemDict = item as? NSDictionary {
                        let question = Question(json: itemDict)
                        questions += question
                    }
                }
            }
        }
        return questions
    }
    func parseSuccessfulResponseTags(responseData : NSData) -> [Tag]{
        if let responseDict = NSJSONSerialization.JSONObjectWithData(responseData, options: nil, error: nil) as? NSDictionary {
            
            if let items = responseDict["items"] as? NSArray {
                for item in items {
                    if let itemDict = item as? NSDictionary {
                        let tag = Tag(json: itemDict)
                        tags += tag
                    }
                }
            }
        }
        return tags
    }
    func fetchTagsTerm(callback: (tags: [Tag]?,
        errorDescription: String?) -> Void) {
        var url = NSURL(string: apiDomain + tagEndpoint + "&site=stackoverflow")
        println(url)
        let urlSession = NSURLSession(configuration: configuration)
        let urlString = url
        let request = NSMutableURLRequest(URL: urlString)
        request.HTTPMethod = "GET"
            let repoDataTask = urlSession.dataTaskWithRequest(request, completionHandler:{ (data : NSData!, response : NSURLResponse!, error : NSError!) -> Void in
                //at this point we are inside our completion handler:
                if error {
                    println("error")
                    
                    //and do something with it.
                }
                else {
                    //see what the repsonse was:
                    if let httpResponse = response as? NSHTTPURLResponse {
                        //this just lets me know if what went wrong.
                        switch httpResponse.statusCode {
                        case 200:
                            println("everything is awesome")
                            //since this one works, I can go to the data:
                            //i will then work with the variable, "data".
                            print("data is: \n")
                            //json tutorials with xcode.
                            var JSON = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as? NSDictionary
                            //println(JSON["quota_max"])
                            var tags = self.parseSuccessfulResponseTags(data)
                            callback(tags: self.tags, errorDescription: nil)
                            
                        case 404:
                            println("not found")
                        default:
                            println("error \(httpResponse.statusCode)")
                        }
                    }
                    
                }
                
                })
            repoDataTask.resume()
    }
    
    func fetchQuestionsForSearchTerm(userString: String, callback: (questions: [Question]?, errorDescription: String?) -> Void) {
        //apiDomain is the
        var url = NSURL(string: apiDomain + searchEndpoint + "&tagged=\(userString)"+"&site=stackoverflow")
        //
        let urlSession = NSURLSession(configuration: configuration)
        let urlString = url //NSURL(string: "http://api.stackexchange.com/2.2/search?order=desc&sort=activity&tagged=\(userString)&site=stackoverflow")
        let request = NSMutableURLRequest(URL: urlString)
        request.HTTPMethod = "GET" //post, delete. "get" is default
        //the repoDataTask is the task to be done. The completion handler is fired after task complete.
        let repoDataTask = urlSession.dataTaskWithRequest(request, completionHandler:{ (data : NSData!, response : NSURLResponse!, error : NSError!) -> Void in
            //at this point we are inside our completion handler:
            if error {
                println("error")
                
                //and do something with it.
            }
            else {
                //see what the repsonse was:
                if let httpResponse = response as? NSHTTPURLResponse {
                    //this just lets me know if what went wrong.
                    switch httpResponse.statusCode {
                    case 200:
                        println("everything is awesome")
                        //since this one works, I can go to the data:
                        //i will then work with the variable, "data".
                        print("data is: \n")
                        //json tutorials with xcode.
                        var JSON = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as? NSDictionary
                        //println(JSON)
                        //println(JSON["quota_max"])
                        var questions = self.parseSuccessfulResponse(data)
                        callback(questions: self.questions, errorDescription: nil)
                        
                    case 404:
                        println("not found")
                    default:
                        println("error \(httpResponse.statusCode)")
                    }
                }
              
            }
            
            })
        repoDataTask.resume()
    }
    func fetchQuestionsFromSampleData(callback : (questions : [Question]?, errorDescription : String?) -> Void) {
        let sampleData = NSData(contentsOfFile: NSBundle.mainBundle().pathForResource("SampleResponse", ofType: "json"))
        var questions = self.parseSuccessfulResponse(sampleData)
        callback(questions: questions, errorDescription: nil)
    }
}