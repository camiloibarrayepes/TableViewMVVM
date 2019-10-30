//
//  Model.swift
//  TableViewMVVM
//
//  Created by camilo andres ibarra yepes on 30/10/19.
//  Copyright © 2019 camilo andres ibarra yepes. All rights reserved.
//

import Foundation

class Model {
    var itemIndex: String?
    var itemName: String?
    
    init(itemIndex: String, itemName: String) {
        self.itemIndex = itemIndex
        self.itemName = itemName
    }
    
    init(dictionary: NSDictionary) {
        self.itemIndex = dictionary["itemIndex"] as? String
        self.itemName = dictionary["itemName"] as? String
    }
    
    public class func modelFromDictionaryArray(array: NSArray) -> [Model] {
        var items = [Model]()
        for data in array {
            items.append(Model(dictionary: data as! NSDictionary ))
        }
        return items
    }
}
