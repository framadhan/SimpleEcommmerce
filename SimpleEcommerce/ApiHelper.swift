//
//  ApiHelper.swift
//  SimpleEcommerce
//
//  Created by Febbry Ramadhan on 13/08/20.
//  Copyright © 2020 Febbry Ramadhan. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ApiHelper {
    static func getRequest(requestName: String, success: @escaping(JSON) -> Void, failed: @escaping (String)->Void) {
        
        let urlRequest = String(format: "%@/%@", Constants.ROOT_URL, requestName)
        
        AF.request(urlRequest, method: .get, encoding: JSONEncoding.default ).responseJSON(completionHandler: { response in
            switch response.result {
            case .failure(let error):
                failed(error.localizedDescription)
            case .success(let value):
                let json = JSON(value)
                success(json)
            }
        })
        
    }
    
}
