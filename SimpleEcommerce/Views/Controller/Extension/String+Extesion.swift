//
//  String+Extesion.swift
//  SimpleEcommerce
//
//  Created by Febbry Ramadhan on 15/08/20.
//  Copyright © 2020 Febbry Ramadhan. All rights reserved.
//

import Foundation

extension StringProtocol {
    func isContains(_ element: Character) -> Bool {
        String(element).contains(self)
    }
}
