//
//  ProductCell.swift
//  SimpleEcommerce
//
//  Created by Febbry Ramadhan on 14/08/20.
//  Copyright © 2020 Febbry Ramadhan. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {
    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var productLoveImg: UIImageView!
    @IBOutlet weak var productName: UILabel!
    
    func setupCell(_ c: ProductPromo){
        productName.text = c.title
        productLoveImg.image = UIImage(named: c.loved == 0 ? "icon-heart" : "icon-heart-fill")
        
        if let imageString = c.imageUrl, let imgUrl = URL(string: imageString) {
            productImg.af.setImage(withURL: imgUrl)
        }
    }

}
