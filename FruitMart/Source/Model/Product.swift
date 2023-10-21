//
//  Product.swift
//  FruitMart
//
//  Created by Dongmin on 2023/07/08.
//  Copyright © 2023 Giftbot. All rights reserved.
//

import Foundation

struct Product: Decodable, Identifiable {
    let id: UUID
    let name: String
    let imageName: String
    let price: Int
    let description: String
    let isFavorite: Bool
    
    enum CodingKeys: CodingKey {
        case name
        case imageName
        case price
        case description
        case isFavorite
    }
    
    init(from decoder: Decoder) throws {
        self.id = UUID()
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.imageName = try container.decode(String.self, forKey: .imageName)
        self.price = try container.decode(Int.self, forKey: .price)
        self.description = try container.decode(String.self, forKey: .description)
        self.isFavorite = try container.decode(Bool.self, forKey: .isFavorite)
    }
    
    init(
        id: UUID? = nil,
        name: String,
        imageName: String,
        price: Int,
        description: String,
        isFavorite: Bool
    ) {
        if let id = id {
            self.id = id
        } else {
            self.id = UUID()
        }
        self.name = name
        self.imageName = imageName
        self.price = price
        self.description = description
        self.isFavorite = isFavorite
    }
    
    func updatedFavorite(_ isFavorite: Bool) -> Product {
        return Product(
            id: self.id,
            name: self.name,
            imageName: self.imageName,
            price: self.price,
            description: self.description,
            isFavorite: isFavorite
        )
    }
    
}
