//
//  HomeViewController.swift
//  SimpleEcommerce
//
//  Created by Febbry Ramadhan on 13/08/20.
//  Copyright © 2020 Febbry Ramadhan. All rights reserved.
//

import UIKit

class HomeViewController: BaseController {
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var collView: UICollectionView!
    @IBOutlet weak var wrapperView: UIView!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    var productViewModel = ProductViewModel()
    
    override func viewDidLoad() {
        setupUI()
        productViewModel.progressClosure = {
            self.view.isUserInteractionEnabled = false
            self.wrapperView.isHidden = true
            self.indicatorView.startAnimating()
        }
        
        productViewModel.finishedClosure = {
            self.indicatorView.stopAnimating()
            self.view.isUserInteractionEnabled = true
            self.wrapperView.isHidden = false
            self.reloadData()
        }
        
        productViewModel.errorClosure = {
            self.indicatorView.stopAnimating()
            self.view.isUserInteractionEnabled = true
            self.wrapperView.isHidden = false
            self.showAlert(title: "Error", message: self.productViewModel.error)
        }
        
        productViewModel.getCategoriesAndProducts()
    }
    
    func setupUI(){
        table.delegate = self
        table.dataSource = self
        table.tableFooterView = UIView()
        table.register(cellType: ProductCell.name())
        table.rowHeight = 300
        
        collView.delegate = self
        collView.dataSource = self
        collView.register(cellType: CategoryCell.name())
    }
    
    func reloadData(){
        table.reloadData()
        collView.reloadData()
    }
    
// MARK: actions
    
    @IBAction func didTapSearch(){
        
        let vc = getVC(sbName: "Main", vcName: "search") as! SearchViewController
        vc.products = productViewModel.products
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}


extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let product = productViewModel.products[indexPath.row]
        let vc = getVC(sbName: "Main", vcName: "ProductDetail") as! ProductDetailViewController
        vc.product = product
        navigationController?.pushViewController(vc, animated: true)
    }
}


extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productViewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = productViewModel.products[indexPath.row]
        let cell = table.dequeueReusableCell(withIdentifier: ProductCell.name(), for: indexPath) as! ProductCell
        cell.setupCell(product)
        return cell
    }
    
    
}


extension HomeViewController: UICollectionViewDelegate {
    
}


extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productViewModel.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let category = productViewModel.categories[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.name(), for: indexPath) as! CategoryCell
        cell.setupCell(category)
        return cell
    }
    
    
}


extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 90, height: 90)
    }
}
