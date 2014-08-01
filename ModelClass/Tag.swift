//
//  Tag.swift
//  ModelClass
//
//  Created by Dan Hoang on 7/31/14.
//  Copyright (c) 2014 Dan Hoang. All rights reserved.
//

import Foundation
class Tag {
    var name: String!
    init(json: NSDictionary) {
        //lone property should be text
        self.name = json["name"] as? String
    }
}