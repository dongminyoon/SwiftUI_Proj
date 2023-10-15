//
//  ProductRow.swift
//  FruitMart
//
//  Created by Dongmin on 2023/07/08.
//  Copyright © 2023 Giftbot. All rights reserved.
//

import SwiftUI

struct ProductRow: View {
    
    let product: Product
    
    var body: some View {
        HStack {
            self.productImage
            self.productDescription
        }
        .frame(height: 150)
        .background(Color.primary.colorInvert())
        .cornerRadius(6)
        .shadow(color: .primaryShadow, radius: 1, x: 2, y: 2)
        .padding(.vertical, 8)
    }
    
    init(product: Product) {
        self.product = product
    }
    
}

// MARK: - ProductRow UI Component
extension ProductRow {
    
    private var productImage: some View {
        Image(self.product.imageName)
            .resizable()
            .scaledToFill()
            .frame(width: 140)
            .clipped()
    }
    
    private var productDescription: some View {
        VStack(alignment: .leading) {
            Text(self.product.name)
                .font(.headline)
                .fontWeight(.medium)
                .padding(.bottom, 6)
            
            Text(self.product.description)
                .font(.footnote)
                .foregroundColor(.secondaryText)
            
            Spacer()
            
            self.productDescriptionFooterView
        }
        .padding([.top, .trailing])
        .padding([.bottom, .leading], 12)
    }
    
    private var productDescriptionFooterView: some View {
        HStack(spacing: 0) {
            Text("₩").font(.footnote) + Text("\(self.product.price)").font(.headline)
            
            Spacer()
            
            Image(systemName: "heart")
                .imageScale(.large)
                .foregroundColor(.peach)
                .frame(width: 32, height: 32)
            
            Image(systemName: "cart")
                .foregroundColor(.peach)
                .frame(width: 32, height: 32)
        }

    }
    
}

struct ProductRow_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            ForEach(Store().products) {
                ProductRow(product: $0)
            }
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
    
}
