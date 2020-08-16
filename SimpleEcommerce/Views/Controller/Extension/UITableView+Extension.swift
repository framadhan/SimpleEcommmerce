//
//  UITableView+Extension.swift
//  SimpleEcommerce
//
//  Created by Febbry Ramadhan on 14/08/20.
//  Copyright © 2020 Febbry Ramadhan. All rights reserved.
//

import UIKit

extension UITableView {
    func register(cellType: String) {
        register(UINib(nibName: cellType, bundle: nil), forCellReuseIdentifier: cellType)
    }
}
