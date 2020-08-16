//
//  CacheDefault.swift
//  SimpleEcommerce
//
//  Created by Febbry Ramadhan on 15/08/20.
//  Copyright © 2020 Febbry Ramadhan. All rights reserved.
//

import UIKit

class CacheDefault: NSObject {
    
    static func saveOrder(product: ProductPromo) {
        var products = loadOrder()
        products.append(product)
        let encoderData = try? JSONEncoder().encode(products)
        
        UserDefaults.standard.set(encoderData, forKey: "order_history")
        UserDefaults.standard.synchronize()
    }
    
    static func loadOrder() -> [ProductPromo] {
        if let data = UserDefaults.standard.object(forKey: "order_history") {
            let obj = try? JSONDecoder().decode([ProductPromo].self, from: data as! Data)
            return obj ?? [ProductPromo]()
        }
        return [ProductPromo]()
    }
    

}


