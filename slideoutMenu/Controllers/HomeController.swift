//
//  HomeController.swift
//  slideoutMenu
//
//  Created by Brian Fajardo on 2020-06-24.
//  Copyright © 2020 Brian Fajardo. All rights reserved.
//

import UIKit

class HomeController: UITableViewController {
    
    let menuController = MenuController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationItems()
        tableView.backgroundColor = UIColor.red
    }
    
    @objc func handleOpen() {
        let mainWindow = UIApplication.shared.keyWindow

        menuController.view.frame = CGRect(x: 0, y: 0, width: 300, height: self.view.frame.height)
        
        mainWindow?.addSubview(menuController.view)
        
        addChild(menuController)
    }
    
    @objc func handleHide() {
        menuController.view.removeFromSuperview()
        menuController.removeFromParent()
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
        
        cell.textLabel?.text = "Menu row: \(indexPath.row)"
        
        return cell
    }
}

