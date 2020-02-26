//
//  BookCartService.swift
//  HenriPotier
//
//  Created by Nicolas Fonsat on 24/02/2020.
//  Copyright © 2020 BlackStyle. All rights reserved.
//

import UIKit

class BookCartService: NSObject {
    
    public static let shared: BookCartService = BookCartService()
    
    private(set) var books: [BookModel] = []
    
    private var webService: HenryPotierWebService {
        return HenryPotierWebService.shared
    }
    
    public var offers: OfferModel?
    
    public var totalPrice: Int {
        return self.books.reduce(0) { (res, book) -> Int in return book.price + res }
    }
    
    public var bestOffer: OfferDataModel? {
        let value = self.offers?.offers.min(by: { (o1, o2) -> Bool in
            return self.totalPrice - o1.value < self.totalPrice - o2.value
        })
        
        return value
    }
    
    public var bestPrice: Int {
        guard let offer = self.bestOffer else {
            return self.totalPrice
        }
        
        return self.totalPrice - offer.value
    }
    
    private override init() {}
    
    public func containsBook(_ book: BookModel) -> Bool {
        return self.books.contains(where: { (bookToFind) -> Bool in
            return bookToFind.isbn == book.isbn
        })
    }
    
    public func addBookItem(_ book: BookModel) {
        if !self.containsBook(book) {
            self.books.append(book)
             self.reloadBookPrice()
        }
    }
    
    public func removeBookItem(_ book: BookModel) {
        
        guard let index = self.books.firstIndex(where: { (bookToFind) -> Bool in
        return bookToFind.isbn == book.isbn }) else {
            return
        }
        
        if index >= 0 {
            self.books.remove(at: index)
            self.reloadBookPrice()
        }
    }
    
    public func reloadBookPrice() {
        self.webService.getOffersForBooks(self.books) { (model) in
            self.offers = model
            print(self.bestPrice)
        }
    }

}
