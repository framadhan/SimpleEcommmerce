//
//  ProductDetailViewController.swift
//  SimpleEcommerce
//
//  Created by Febbry Ramadhan on 15/08/20.
//  Copyright © 2020 Febbry Ramadhan. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {
    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var productLove: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productDesc: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    
    var product = ProductPromo()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let backButton = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 40, height: 60))
        backButton.setImage(UIImage.init(systemName: "chevron.left"), for: .normal)
        backButton.contentEdgeInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 10)
        backButton.tintColor = .black
        backButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        
        let shareButton = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
        shareButton.setImage(UIImage(named: "icons-share"), for: .normal)
        shareButton.imageEdgeInsets = UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 15)
        shareButton.tintColor = .black
        shareButton.addTarget(self, action: #selector(didTapShare), for: .touchUpInside)
        
        let leftButton = UIBarButtonItem(customView: backButton)
        navigationItem.leftBarButtonItem = leftButton
        let rightButton = UIBarButtonItem(customView: shareButton)
        navigationItem.rightBarButtonItem = rightButton

        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI(){
        productName.text = product.title
        productDesc.text = product.descriptionField
        productPrice.text = product.price
        productLove.image = UIImage(named: product.loved == 0 ? "icon-heart" : "icon-heart-fill")
        
        if let imageString = product.imageUrl, let imgUrl = URL(string: imageString) {
            productImg.af.setImage(withURL: imgUrl)
        }
        buyButton.addTarget(self, action: #selector(diTapBuy), for: .touchUpInside)
    }
    
    // MARK: actions
    
    @objc func backAction(){
        navigationController?.popViewController(animated: true)
    }
    
    @objc func diTapBuy(){
        CacheDefault.saveOrder(product: product)
        self.tabBarController?.selectedIndex = 1
    }
    
    @objc func didTapShare(){
        var activityItems = [product.title, product.descriptionField ?? ""] as [Any]
        if productImg.image != nil {
            activityItems.append(productImg.image!)
        }
        
        let activityViewController = UIActivityViewController(activityItems: activityItems , applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
        
        // exclude some activity types from the list (optional)
        activityViewController.excludedActivityTypes = [
            UIActivity.ActivityType.postToWeibo,
            UIActivity.ActivityType.print,
            UIActivity.ActivityType.assignToContact,
            UIActivity.ActivityType.addToReadingList,
            UIActivity.ActivityType.postToFlickr,
            UIActivity.ActivityType.postToVimeo,
            UIActivity.ActivityType.postToTencentWeibo,
        ]
        
        // present the view controller
        self.present(activityViewController, animated: true, completion: nil)
    }
    
}
