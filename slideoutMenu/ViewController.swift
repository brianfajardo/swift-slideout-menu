//
//  ViewController.swift
//  slideoutMenu
//
//  Created by Brian Fajardo on 6/22/20.
//  Copyright © 2020 Brian Fajardo. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationItems()
        tableView.backgroundColor = UIColor.red
    }
    
    @objc func handleOpen() {
        print("opening menu")
        
        let viewController = MenuController()
        let mainWindow = UIApplication.shared.keyWindow

        viewController.view.frame = CGRect(x: 0, y: 0, width: 300, height: self.view.frame.height)
        
        mainWindow?.addSubview(viewController.view)
    }
    
    @objc func handleHide() {
        print("hiding menu")
    }
    
    fileprivate func setupNavigationItems() {
        navigationItem.title = "Home"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(handleOpen))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Hide", style: .plain, target: self, action: #selector(handleHide))
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cellId")
        
        cell.textLabel?.text = "Row \(indexPath.row)"
        
        return cell
    }
}

