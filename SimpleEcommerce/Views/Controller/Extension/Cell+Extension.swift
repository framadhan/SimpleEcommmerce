//
//  Cell+Extension.swift
//  SimpleEcommerce
//
//  Created by Febbry Ramadhan on 14/08/20.
//  Copyright © 2020 Febbry Ramadhan. All rights reserved.
//

import UIKit

extension UITableViewCell {
    static func name() -> String {
        return String(describing: self)
    }
}


extension UICollectionViewCell {
    static func name() -> String {
        return String(describing: self)
    }
}
