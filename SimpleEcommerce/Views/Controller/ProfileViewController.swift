//
//  ProfileViewController.swift
//  SimpleEcommerce
//
//  Created by Febbry Ramadhan on 15/08/20.
//  Copyright © 2020 Febbry Ramadhan. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var table: UITableView!
    var products = [ProductPromo]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let screen = UIScreen.main.bounds
        let label = UILabel()
        label.frame = CGRect.init(x: 15, y: 0, width: screen.width, height: 60)
        label.text = "Purchase History"
        let leftButton = UIBarButtonItem(customView: label)
        navigationItem.leftBarButtonItem = leftButton
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        products = CacheDefault.loadOrder()
        table.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI(){
        table.delegate = self
        table.dataSource = self
        table.tableFooterView = UIView()
        table.register(cellType: ProductItemCell.name())
        table.rowHeight = 75
    }
        
}


extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let product = products[indexPath.row]
        let vc = BaseController().getVC(sbName: "Main", vcName: "ProductDetail") as! ProductDetailViewController
        vc.product = product
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = products[indexPath.row]
        let cell = table.dequeueReusableCell(withIdentifier: ProductItemCell.name(), for: indexPath) as! ProductItemCell
        cell.setupCell(product)
        
        return cell
    }
    
    
}
