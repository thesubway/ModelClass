//
//  File.swift
//  ModelClass
//
//  Created by Dan Hoang on 7/28/14.
//  Copyright (c) 2014 Dan Hoang. All rights reserved.
//

import Foundation

class Question {
    var isAnswered = false
    //var answers = [Answer]()
    var body: String!
    var link: String!
    var questionID: Int!
    var owner: User!
    var title: String!
    /*init(questionBody: String!, questionID: Int!, asker: User) {
        self.body = questionBody
        self.questionID = questionID
        self.owner = asker
    } */
    
    init(json: NSDictionary) {
        // read json in as NSData
        /*let jsonData = NSData(contentsOfFile: NSBundle.mainBundle().pathForResource("SampleQuestion", ofType: "json"))
        var parsedJSON = NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary */
        self.isAnswered = json["is_answered"] as Bool
        self.body = json["body"] as? String //in case there is none
        self.link = json["link"] as? String
        self.questionID = json["question_id"] as? Int
        self.owner = User(json: json["owner"] as NSDictionary)
        self.title = json["title"] as? String
        println(self.body)
    }
    
}

class Answer {
    var body: String!
    var upVoteCount: Int!
    var downVoteCount: Int!
    var questionID: Int!
    var owner: User!
    var isAccepted: Bool!
    /*init(answerBody: String!, questionID: Int!, answerer: User) {
        self.body = answerBody
        self.questionID = questionID
        self.owner = answerer
    } */
    init(json: NSDictionary) {
        self.body = json["body"] as? String
        self.upVoteCount = json["up_vote_count"] as? Int
        self.downVoteCount = json["down_vote_count"] as? Int
        self.questionID = json["question_id"] as? Int
        self.owner = User(json: json["owner"] as NSDictionary)
        self.isAccepted = json["is_accepted"] as? Bool
    }
}

class User {
    var answerCount: Int!
    var questionCount: Int!
    var accountID: Int!
    var aboutMe: String!
    var link: String!
    var username: String!
    var profilePic: String!
    init(json : NSDictionary) {
        self.answerCount = json["answer_count"] as? Int
        self.questionCount = json["question_count"] as? Int
        self.accountID = json["account_id"] as? Int
        self.aboutMe = json["about_me"] as? String
        self.link = json["link"] as? String
        self.username = json["display_name"] as? String
        self.profilePic = json["profile_image"] as? String
    }
}


