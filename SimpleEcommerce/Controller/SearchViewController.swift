//
//  SearchViewController.swift
//  SimpleEcommerce
//
//  Created by Febbry Ramadhan on 15/08/20.
//  Copyright © 2020 Febbry Ramadhan. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var table: UITableView!
    var products = [ProductPromo]()
    var results = [ProductPromo]()
    let headerView = HeaderView()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let screen = UIScreen.main.bounds
        headerView.frame = CGRect.init(x: 0, y: 0, width: screen.width, height: 60)
        let leftButton = UIBarButtonItem(customView: headerView)
        navigationItem.leftBarButtonItem = leftButton
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        results = products
    }
    
    func setupUI(){
        table.delegate = self
        table.dataSource = self
        table.tableFooterView = UIView()
        table.register(cellType: ProductItemCell.name())
        table.rowHeight = 75
        headerView.field.addTarget(self, action: #selector(textChanged(_:)), for: .editingChanged)
        headerView.backButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
    }
    
// MARK: actions
    @objc func backAction(){
        navigationController?.popViewController(animated: true)
    }
    
    @objc func textChanged(_ textField: UITextField){
        if let text = textField.text?.lowercased(), text != "" {
            results = products.filter({$0.title.lowercased().contains(text)})
        }else{
            results = products
        }
        
        table.reloadData()
    }
        
}


extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let product = results[indexPath.row]
        let vc = BaseController().getVC(sbName: "Main", vcName: "ProductDetail") as! ProductDetailViewController
        vc.product = product
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = products[indexPath.row]
        let cell = table.dequeueReusableCell(withIdentifier: ProductItemCell.name(), for: indexPath) as! ProductItemCell
        cell.setupCell(product)
        
        return cell
    }
    
    
}
