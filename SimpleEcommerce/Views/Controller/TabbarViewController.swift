//
//  TabbarViewController.swift
//  SimpleEcommerce
//
//  Created by Febbry Ramadhan on 13/08/20.
//  Copyright © 2020 Febbry Ramadhan. All rights reserved.
//

import UIKit

class TabbarViewController: UITabBarController {
    override func viewDidLoad(){
        super.viewDidLoad()
        
        let baseVC = BaseController()
        let vcHome = baseVC.getVC(sbName: "Main", vcName: "home")
        let vcProfile = baseVC.getVC(sbName: "Main", vcName: "profile")
        let vcFeed = UIViewController()
        vcFeed.title = "Feed"
        let vcCart = UIViewController()
        vcCart.title = "Cart"
        let controllers = [vcHome, vcFeed, vcCart, vcProfile]
        self.viewControllers = controllers.map {
            let nav = UINavigationController(rootViewController: $0)
            nav.navigationBar.backgroundColor = .white
            return nav
            
        }
    }
}
