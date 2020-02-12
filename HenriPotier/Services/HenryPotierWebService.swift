//
//  HenryPotierWebService.swift
//  HenriPotier
//
//  Created by Nicolas Fonsat on 11/02/2020.
//  Copyright © 2020 BlackStyle. All rights reserved.
//

import Foundation
import Alamofire

class HenryPotierWebService: NSObject {
    
    public static let shared: HenryPotierWebService = HenryPotierWebService()
    
    private static let api: String = "http://henri-potier.xebia.fr/books"
    
    private override init() {}
    
    func fetchBooks(completion: @escaping ([BookModel]) -> Void) {
        Alamofire.request(HenryPotierWebService.api)
            .responseData { (resp) in
                
                guard let data = resp.data else { return }
                
                let decoder = JSONDecoder()
                
                do {
                    let models: [BookModel] = try decoder.decode([BookModel].self, from: data)
                    completion(models)
                } catch {
                    print("Response - Error : \(error.localizedDescription)")
                    completion([])
                }
        }
    }
    
    func getOffersForBooks(_ books: [BookModel], completion: @escaping (OfferModel?) -> Void) {
        guard books.count > 0 else {
            completion(nil)
            return
        }
                
        let query: String = books.map { $0.isbn }.joined(separator: ",")
        let url: String = "\(HenryPotierWebService.api)/\(query)/commercialOffers"
        Alamofire.request(url)
            .responseData { (resp) in
                
                guard let data = resp.data else { return }
                
                let decoder = JSONDecoder()
                
                do {
                    let model: OfferModel = try decoder.decode(OfferModel.self, from: data)
                    completion(model)
                } catch {
                    print("Response - Error : \(error.localizedDescription)")
                    completion(nil)
                }
        }
    }
    
}
