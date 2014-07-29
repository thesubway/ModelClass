//
//  ModelClassTests.swift
//  ModelClassTests
//
//  Created by Dan Hoang on 7/28/14.
//  Copyright (c) 2014 Dan Hoang. All rights reserved.
//

import UIKit
import XCTest

class ModelClassTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    func testUserInit() {
        let jsonData3 = NSData(contentsOfFile: NSBundle.mainBundle().pathForResource("SampleUser", ofType: "json"))
        var parsedJSON3 = NSJSONSerialization.JSONObjectWithData(jsonData3, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
        var user = User(json: parsedJSON3)
        XCTAssertNotNil(user, "user can not be created")
    }
    func testUserProperties() {
        let jsonData3 = NSData(contentsOfFile: NSBundle.mainBundle().pathForResource("SampleUser", ofType: "json"))
        var parsedJSON3 = NSJSONSerialization.JSONObjectWithData(jsonData3, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
        var user = User(json: parsedJSON3)
        var userProps = [user.aboutMe,user.link,user.profilePic,user.username,user.accountID,user.answerCount,user.questionCount]
        for eachProp in userProps {
            println("1")
            XCTAssertNotNil(eachProp, "user can not be created")
        }
    }
    func testQuestionInit() {
        //var question = Question(questionBody: "How do I write in swift?", questionID:0, asker:user)
        let jsonData = NSData(contentsOfFile: NSBundle.mainBundle().pathForResource("SampleQuestion", ofType: "json"))
        var parsedJSON = NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
        var question = Question(json: parsedJSON)
        XCTAssertNotNil(question, "person can not be created")
    }
    func testQuestionProperties() {
        //ensure all the properties are working
        let jsonData = NSData(contentsOfFile: NSBundle.mainBundle().pathForResource("SampleQuestion", ofType: "json"))
        var parsedJSON = NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
        var question = Question(json: parsedJSON)
        var questionProps = [question.body,question.link,question.isAnswered,question.owner,question.questionID]
        for eachProp in questionProps {
            XCTAssertNotNil(eachProp, "property can not be created")
        }
    }
    func testAnswerInit() {
        let jsonData2 = NSData(contentsOfFile: NSBundle.mainBundle().pathForResource("SampleAnswer", ofType: "json"))
        var parsedJSON2 = NSJSONSerialization.JSONObjectWithData(jsonData2, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
        var answer = Answer(json: parsedJSON2)
    }
    func testAnswerProperties() {
        let jsonData2 = NSData(contentsOfFile: NSBundle.mainBundle().pathForResource("SampleAnswer", ofType: "json"))
        var parsedJSON2 = NSJSONSerialization.JSONObjectWithData(jsonData2, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
        let answer = Answer(json: parsedJSON2)
        var answerProps = [answer.body,answer.downVoteCount,answer.isAccepted,answer.owner,answer.questionID,answer.upVoteCount]
        for eachProp in answerProps {
            XCTAssertNotNil(eachProp, "property can not be created")
        }
    }
    
}
