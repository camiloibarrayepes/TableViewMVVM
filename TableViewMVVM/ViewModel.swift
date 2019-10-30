//
//  ViewModel.swift
//  TableViewMVVM
//
//  Created by camilo andres ibarra yepes on 30/10/19.
//  Copyright © 2019 camilo andres ibarra yepes. All rights reserved.
//

import Foundation

protocol ReloadTableViewDelegate {
    func reloadTableView(index: Int)
}

protocol ViewModelDelegate {
    func onItemAddClick(newItem: String)
}

class ViewModel {
    var items = [Model]()
    
    var itemJSON = [ ["itemIndex": "1", "itemName": "Washing Car"],
                 ["itemIndex": "2", "itemName": "Washing Moto"],
                 ["itemIndex": "3", "itemName": "Washing BIKE"]]
    
    var reloadDelegate: ReloadTableViewDelegate?
    
    init(viewDelegate: ReloadTableViewDelegate) {
        reloadDelegate = viewDelegate
        self.items = Model.modelFromDictionaryArray(array: (itemJSON as? NSArray)!)
        print("items count", items.count)
    }
}

extension ViewModel: ViewModelDelegate {
    func onItemAddClick(newItem: String) {
        print("New Item", newItem)
        let itemCount = "\(items.count + 1)"
        items.append(Model(dictionary: ["itemIndex": itemCount, "itemName": newItem]))
        print("item count", items.count)
        reloadDelegate?.reloadTableView(index: items.count)
        
    }
}
