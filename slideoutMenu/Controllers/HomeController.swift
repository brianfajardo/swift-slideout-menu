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

        // Setup initial position of menu off-screen
        menuController.view.frame = CGRect(x: -menuWidth, y: 0, width: menuWidth, height: self.view.frame.height)
        
        mainWindow?.addSubview(menuController.view)
        
        // Animate menu from the left into users' view
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.menuController.view.transform = CGAffineTransform(translationX: self.menuWidth, y: 0)
        })
        
        addChild(menuController)
    }
    
    @objc func handleHide() {
        // Animate menu to the left to hide from users' view
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.menuController.view.transform = .identity
        })
        
//        menuController.view.removeFromSuperview()
//        menuController.removeFromParent()
    }
    
    fileprivate let menuWidth: CGFloat = 300
    
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

