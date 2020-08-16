//
//  ProductViewModel.swift
//  SimpleEcommerce
//
//  Created by Febbry Ramadhan on 13/08/20.
//  Copyright © 2020 Febbry Ramadhan. All rights reserved.
//

import UIKit
import SwiftyJSON

class ProductViewModel {
    var products = [ProductPromo]()
    var categories = [Category]()
    var error = ""
    
    // MARK: - Closure for Callback
    var progressClosure: (() -> ())?
    var finishedClosure: (() -> ())?
    var errorClosure: (() -> ())?

    
    func getCategoriesAndProducts() {
        self.progressClosure?()
        
        ApiHelper.getRequest(requestName: Constants.Api(.home), success:  { (result) in
            if let dataElement = result.arrayValue.first {
                let data = dataElement["data"]
                self.categories = data["category"].arrayValue.compactMap({ Category($0) })
                self.products = data["productPromo"].arrayValue.compactMap({ ProductPromo($0) })
            }
            self.finishedClosure?()            
        }) { (error)  in
            self.error = error
            self.errorClosure?()
        }
    }
}
