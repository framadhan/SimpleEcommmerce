//
//  CategoryCell.swift
//  SimpleEcommerce
//
//  Created by Febbry Ramadhan on 14/08/20.
//  Copyright © 2020 Febbry Ramadhan. All rights reserved.
//

import UIKit
import AlamofireImage

class CategoryCell: UICollectionViewCell {
    @IBOutlet weak var categoryImg: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    
    func setupCell(_ c: Category){
        categoryName.text = c.name
        if let imageString = c.imageUrl, let imgUrl = URL(string: imageString) {
            categoryImg.af.setImage(withURL: imgUrl)
        }
    }
    
}
