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
        setupMenuController()
        
        tableView.backgroundColor = UIColor.red
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        view.addGestureRecognizer(panGesture)
    }
    
    @objc func handleOpen() {
        performAnimations(withTransformTo: CGAffineTransform(translationX: self.menuWidth, y: 0))
    }
    
    @objc func handleHide() {
        performAnimations(withTransformTo: .identity)
    }
    
    @objc func handlePan(gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .changed:
            let translation = gesture.translation(in: view)
            var x = translation.x
            
            // Clamping x value to keep menuController and navigationController views in bounds
            x = min(menuWidth, x)
            x = max(0, x)
            
            let transformation = CGAffineTransform(translationX: x, y: 0)
            
            menuController.view.transform = transformation
            navigationController?.view.transform = transformation
        case .ended:
            handleOpen()
        default:
            return
        }
    }
    
    // MARK:- Fileprivate
    
    fileprivate let menuWidth: CGFloat = 300
    
    fileprivate func performAnimations(withTransformTo transformation: CGAffineTransform) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.menuController.view.transform = transformation
            self.navigationController?.view.transform = transformation
        })
    }
    
    fileprivate func setupNavigationItems() {
        navigationItem.title = "Home"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(handleOpen))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Hide", style: .plain, target: self, action: #selector(handleHide))
    }
    
    fileprivate func setupMenuController() {
        let mainWindow = UIApplication.shared.keyWindow
        
        // Setup initial position of menu off-screen
        menuController.view.frame = CGRect(x: -menuWidth, y: 0, width: menuWidth, height: self.view.frame.height)
        
        mainWindow?.addSubview(menuController.view)
        
        addChild(menuController)
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

