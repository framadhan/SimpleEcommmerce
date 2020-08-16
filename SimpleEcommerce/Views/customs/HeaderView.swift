//
//  HeaderView.swift
//  SimpleEcommerce
//
//  Created by Febbry Ramadhan on 15/08/20.
//  Copyright © 2020 Febbry Ramadhan. All rights reserved.
//

import UIKit

@IBDesignable class HeaderView: UIView {
    @IBOutlet weak var field: UITextField!
    @IBOutlet weak var backButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func setupUI(){
        let view = loadViewFromNib()
        view?.frame = bounds
        
        view?.autoresizingMask = [.flexibleWidth,
                                  .flexibleHeight]
        
        addSubview(view!)
    }
    
}
