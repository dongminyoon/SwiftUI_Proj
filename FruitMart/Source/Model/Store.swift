//
//  Store.swift
//  FruitMart
//
//  Created by Dongmin on 2023/08/06.
//  Copyright © 2023 Giftbot. All rights reserved.
//

import Foundation

final class Store: ObservableObject {
        
    init(fileName: String = "ProductData.json") {
        self.products = (try? Bundle.main.decodeJSON(atFileName: fileName)) ?? []
    }
    
    func toggleFavorite(of product: Product) {
        guard let index = self.products.firstIndex(where: { $0.id == product.id }) else { return }
        guard let product = self.products[safe: index] else { return }
        
        let toggledFavorite = product.isFavorite == false
        self.products[index] = product.updatedFavorite(toggledFavorite)
    }
            
    @Published private(set) var products = [Product]()
    
}

extension Array {
    
    subscript(safe index: Int) -> Element? {
        guard self.indices ~= index else { return nil }
        return self[index]
    }
    
}
