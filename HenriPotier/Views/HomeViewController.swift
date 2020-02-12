//
//  HomeViewController.swift
//  HenriPotier
//
//  Created by Nicolas Fonsat on 11/02/2020.
//  Copyright © 2020 BlackStyle. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet var bookTableView: UITableView!
    
    private var henryPotierWS: HenryPotierWebService {
        return HenryPotierWebService.shared
    }
    
    private var books: [BookModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Henri Potier"
        self.initTableView()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.henryPotierWS.fetchBooks { books in
            self.books = books
            self.bookTableView.reloadData()
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
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
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let book: BookModel = self.books[indexPath.row]
        let bookDetailView: BookDetailViewController = BookDetailViewController()
        bookDetailView.book = book
        self.navigationController?.pushViewController(bookDetailView, animated: true)
        
    }
    
    
}
