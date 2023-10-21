//
//  FavoriteButton.swift
//  FruitMart
//
//  Created by Dongmin on 2023/10/21.
//  Copyright © 2023 Giftbot. All rights reserved.
//

import SwiftUI

struct FavoriteButton: View {
    
    init(product: Product) {
        self.product = product
    }
    
    var body: some View {
        Image(systemName: self.product.isFavorite ? "heart.fill" : "heart")
            .imageScale(.large)
            .foregroundColor(.peach)
            .frame(width: 32, height: 32)
            .onTapGesture { self.store.toggleFavorite(of: self.product) }
    }
    
    @EnvironmentObject private var store: Store
    private let product: Product
    
}
