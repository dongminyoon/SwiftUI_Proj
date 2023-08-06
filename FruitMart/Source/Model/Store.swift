//
//  Store.swift
//  FruitMart
//
//  Created by Dongmin on 2023/08/06.
//  Copyright © 2023 Giftbot. All rights reserved.
//

import Foundation

final class Store {
        
    init(fileName: String = "ProductData.json") {
        self.products = (try? Bundle.main.decodeJSON(atFileName: fileName)) ?? []
    }
            
    private(set) var products = [Product]()
    
}
