//
//  OfferModel.swift
//  HenriPotier
//
//  Created by Nicolas Fonsat on 12/02/2020.
//  Copyright © 2020 BlackStyle. All rights reserved.
//

import Foundation

struct OfferModel: Codable {
    
    public var offers: [OfferDataModel]
    
}

struct OfferDataModel: Codable {
    
    public var type: String
    
    public var value: Int
    
    public var sliceValue: Int?
    
}
