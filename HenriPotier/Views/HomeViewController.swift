//
//  HomeViewController.swift
//  HenriPotier
//
//  Created by Nicolas Fonsat on 11/02/2020.
//  Copyright © 2020 BlackStyle. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var henryPotierWS: HenryPotierWebService {
        return HenryPotierWebService.shared
    }
    
    private var books: [BookModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.henryPotierWS.fetchBooks { books in
            self.books = books
        }
    }

}
