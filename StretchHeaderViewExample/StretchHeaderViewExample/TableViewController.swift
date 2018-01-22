//
//  TableViewController.swift
//  StretchHeaderViewExample
//
//  Created by Persio Guimaraes Vieira on 22/01/18.
//  Copyright © 2018 Persio Guimaraes Vieira. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    @IBOutlet private weak var headerView: StretchHeaderView!
    
    private let dataSource = ["Pérsio", "Samuel", "Renato", "Guilherme"]

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }
    
    deinit {
        headerView.stopStretching()
    }
}
