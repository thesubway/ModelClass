//
//  TagTests.swift
//  ModelClass
//
//  Created by Dan Hoang on 7/31/14.
//  Copyright (c) 2014 Dan Hoang. All rights reserved.
//

import UIKit
import XCTest

class TagTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    func testTagInit() {
        let jsonData = NSData(contentsOfFile: NSBundle.mainBundle().pathForResource("SampleTag", ofType: "json"))
        var parsedJSON = NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
        var tag = Tag(json: parsedJSON)
        XCTAssertNotNil(tag, "tag can not be created")
    }
    func testTagName() {
        let jsonData = NSData(contentsOfFile: NSBundle.mainBundle().pathForResource("SampleTag", ofType: "json"))
        var parsedJSON = NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
        var tag = Tag(json: parsedJSON)
        var testName = tag.name
        XCTAssertNotNil(testName, "name can not be created")
    }

}
