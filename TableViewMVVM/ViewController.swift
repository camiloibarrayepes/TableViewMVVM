//
//  ViewController.swift
//  TableViewMVVM
//
//  Created by camilo andres ibarra yepes on 30/10/19.
//  Copyright © 2019 camilo andres ibarra yepes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var itemTableView: UITableView!
    var viewModel: ViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ViewModel(viewDelegate: self)
        let nib = UINib(nibName: "ItemTableViewCell", bundle: nil)
        itemTableView.register(nib, forCellReuseIdentifier: "itemCell")
        itemTableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    @IBAction func itemAddAction(_ sender: Any) {
        viewModel?.onItemAddClick(newItem: itemTextField.text!)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (viewModel?.items.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell") as? ItemTableViewCell
        cell?.setupDataFromModel(model: (viewModel?.items[indexPath.row])!)
        return cell!
    }
}

extension ViewController: ReloadTableViewDelegate {
    func reloadTableView(index: Int) {
        //Add reload logic
        itemTextField.text = ""
        itemTableView.beginUpdates()
        itemTableView.insertRows(at: [IndexPath(row:index-1, section: 0)], with: .automatic)
        itemTableView.endUpdates()
    }
}

