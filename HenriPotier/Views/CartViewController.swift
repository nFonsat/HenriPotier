//
//  CartViewController.swift
//  HenriPotier
//
//  Created by Nicolas Fonsat on 26/02/2020.
//  Copyright © 2020 BlackStyle. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {
    
    @IBOutlet var bookTableView: UITableView!
    
    @IBOutlet var oldPriceLabel: UILabel!
    
    @IBOutlet var newPriceLabel: UILabel!
    
    private var cartService: BookCartService {
        return BookCartService.shared
    }
    
    private var books: [BookModel] {
        return self.cartService.books
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Cart"
        self.initTableView()
        
        self.oldPriceLabel.text = "Prix total: \(self.cartService.totalPrice)€"
        self.newPriceLabel.text = "Prix réduit: \(self.cartService.bestPrice)€"
        
        // Do any additional setup after loading the view.
    }

}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    
    func initTableView() {
        self.bookTableView.dataSource = self
        self.bookTableView.delegate = self
        let cellNib = UINib(nibName: "BookTableViewCell", bundle: nil)
        self.bookTableView.register(cellNib, forCellReuseIdentifier: "BookCellIdentifier")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = self.bookTableView.dequeueReusableCell(withIdentifier: "BookCellIdentifier") as? BookTableViewCell
        
        if cell == nil {
            cell = BookTableViewCell()
        }
        
        let book: BookModel = self.books[indexPath.row]
        cell!.book = book
        cell!.accessoryType = .none
        cell!.isUserInteractionEnabled = false
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
