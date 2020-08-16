//
//  ViewController.swift
//  SimpleEcommerce
//
//  Created by Febbry Ramadhan on 13/08/20.
//  Copyright © 2020 Febbry Ramadhan. All rights reserved.
//

import UIKit

class ViewController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func redirectToHome(){
        let vc = getVC(sbName: "Main", vcName: "tabbar")
        guard let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first else { return }
        window.rootViewController = vc
    }


}

