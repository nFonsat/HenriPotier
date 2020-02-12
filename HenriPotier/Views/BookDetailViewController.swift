//
//  BookDetailViewController.swift
//  HenriPotier
//
//  Created by Nicolas Fonsat on 13/02/2020.
//  Copyright © 2020 BlackStyle. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    @IBOutlet var bookTitleLabel: UILabel!
    
    @IBOutlet var bookIsbnLabel: UILabel!
    
    @IBOutlet var bookImageView: UIImageView!
    
    @IBOutlet var bookSynopsisTextView: UITextView!
    
    @IBOutlet var basketButton: UIButton!
    
    var book: BookModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.bookTitleLabel.text = self.book.title
        self.bookIsbnLabel.text = self.book.isbn
        self.bookImageView.load(urlString: self.book.cover)
        
        let sinopsis = self.book.synopsis.joined(separator: "\n")
        self.bookSynopsisTextView.text = sinopsis
        
        self.basketButton.layer.cornerRadius = self.basketButton.frame.height * 0.5

        // Do any additional setup after loading the view.
    }

}
