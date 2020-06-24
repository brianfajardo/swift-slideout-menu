//
//  MenuController.swift
//  slideoutMenu
//
//  Created by Brian Fajardo on 2020-06-24.
//  Copyright © 2020 Brian Fajardo. All rights reserved.
//

import UIKit

class MenuController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = UIColor.blue
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cellId")
        
        cell.textLabel?.text = "Home row: \(indexPath.row)"
        
        return cell
    }
}
