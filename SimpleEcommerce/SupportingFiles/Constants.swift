//
//  Constants.swift
//  SimpleEcommerce
//
//  Created by Febbry Ramadhan on 13/08/20.
//  Copyright © 2020 Febbry Ramadhan. All rights reserved.
//

import UIKit


struct Constants {
    static let ROOT_URL = "https://private-4639ce-ecommerce56.apiary-mock.com"
    enum API:String {
        case home = "home"
    }
    
    static func Api(_ api: API) -> String{
        api.rawValue
    }
    
//    let storyboard = UIStoryboard(name: "Main", bundle: nil)
//    let vc = storyboard.instantiateViewController(withIdentifier: "tabbar")
    
    static let VcName =  {
        enum Main: String{
            case tabbar = "tabbar"
        }
    }
    
    static func get(){
        
    }
}
