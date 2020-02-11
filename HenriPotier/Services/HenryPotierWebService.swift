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
    
}
