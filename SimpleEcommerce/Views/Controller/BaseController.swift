//
//  BaseController.swift
//  SimpleEcommerce
//
//  Created by Febbry Ramadhan on 14/08/20.
//  Copyright © 2020 Febbry Ramadhan. All rights reserved.
//

import UIKit


class BaseController: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func back(){
        
    }
    
    func getVC(sbName: String, vcName: String) -> UIViewController{
        let storyboard = UIStoryboard(name: sbName, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: vcName)
        return vc
    }
    
}
