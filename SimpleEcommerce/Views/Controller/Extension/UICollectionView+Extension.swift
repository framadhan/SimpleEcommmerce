//
//  UICollectionView+Extension.swift
//  SimpleEcommerce
//
//  Created by Febbry Ramadhan on 14/08/20.
//  Copyright © 2020 Febbry Ramadhan. All rights reserved.
//

import UIKit

extension UICollectionView {
    func register(cellType: String) {
        register(UINib(nibName: cellType, bundle: nil), forCellWithReuseIdentifier: cellType)
    }
}

