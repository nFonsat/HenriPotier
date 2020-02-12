//
//  BookModel.swift
//  HenriPotier
//
//  Created by Nicolas Fonsat on 11/02/2020.
//  Copyright © 2020 BlackStyle. All rights reserved.
//

import Foundation

struct BookModel: Codable {
    
    public var isbn: String
    
    public var title: String
    
    public var price: Int
    
    public var cover: String
    
    public var synopsis: [String]
    
}
