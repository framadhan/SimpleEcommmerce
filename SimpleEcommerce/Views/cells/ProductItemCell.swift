//
//  ProductItemCell.swift
//  SimpleEcommerce
//
//  Created by Febbry Ramadhan on 15/08/20.
//  Copyright © 2020 Febbry Ramadhan. All rights reserved.
//

import UIKit

class ProductItemCell: UITableViewCell {
    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var productName: UILabel!
    
    func setupCell(_ c: ProductPromo){
        let attributedString = NSMutableAttributedString()
        attributedString.append(NSAttributedString(string: String(format: "%@\n", c.title), attributes: [
            NSAttributedString.Key.font : UIFont(name: "HelveticaNeue-Medium", size: 15)!,
            NSAttributedString.Key.foregroundColor : UIColor.darkGray,
        ]))
        
        attributedString.append(NSAttributedString(string: c.price, attributes: [
            NSAttributedString.Key.font : UIFont(name: "HelveticaNeue", size: 12)!,
            NSAttributedString.Key.foregroundColor : UIColor.darkGray,
        ]))
        
        productName.attributedText = attributedString
        productName.numberOfLines = 3
        
        if let imageString = c.imageUrl, let imgUrl = URL(string: imageString) {
            productImg.af.setImage(withURL: imgUrl)
        }
    }

}
