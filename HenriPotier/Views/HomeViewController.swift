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
        self.bookTableView.register(UITableViewCell.self, forCellReuseIdentifier: "BookCellIdentifier")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.bookTableView.dequeueReusableCell(
            withIdentifier: "BookCellIdentifier", for: indexPath)
        
        let book: BookModel = self.books[indexPath.row]
        cell.textLabel?.text = book.title
        
        return cell
    }
    
    
}
