//
//  ProductDetailView.swift
//  FruitMart
//
//  Created by Dongmin on 2023/08/06.
//  Copyright © 2023 Giftbot. All rights reserved.
//

import SwiftUI

struct ProductDetailView: View {
    
    init(product: Product) {
        self.product = product
    }
    
    var body: some View {
        let stack = VStack(spacing: 0) {
            self.topArea
            self.bottomArea
        }
        
        if #available(iOS 14.0, *) {
            return stack
                .ignoresSafeArea(edges: .top)
        } else {
            return stack
                .edgesIgnoringSafeArea(.top)
        }
    }
    
    private var topArea: some View {
        GeometryReader { geometry in
            Image(self.product.imageName)
                .resizable()
                .scaledToFill()
        }
    }
    
    private var bottomArea: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                self.productDescription
                Spacer()
                self.priceArea
                self.buyButton
            }
            .padding(.bottom, geometry.safeAreaInsets.bottom)
            .frame(height: geometry.size.height + 10)
            .padding(32)
            .background(Color.white)
            .cornerRadius(16)
            .shadow(
                color: .black.opacity(0.2),
                radius: 10,
                x: 0,
                y: -5
            )
        }
    }
    
    private var productDescription: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text(self.product.name)
                    .font(.largeTitle)
                    .fontWeight(.semibold)

                Spacer()
               
                Image(systemName: "heart")
                    .imageScale(.large)
                    .foregroundColor(.peach)
                    .frame(width: 32, height: 32)
            }
            
            Text(self.product.description)
                .foregroundColor(.secondaryText)
        }
    }
    
    private var priceArea: some View {
        HStack() {
            Text("₩") + Text("\(self.product.price)").font(.title)
                .fontWeight(.medium)
            Spacer()
        }
    }
    
    private var buyButton: some View {
        Button(action: {
            print("@구매하기 버튼 누름")
        }) {
            Rectangle()
                .fill(Color.peach)
                .frame(height: 55)
                .cornerRadius(20)
                .overlay(
                    Text("주문하기")
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(.white)
                )
                .padding(.vertical, 8)
        }
    }
    
    private let product: Product
    
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(
            product: Product(
                name: "바나나",
                imageName: "banana",
                price: 2500,
                description: "싱싱하고 산뜻한 바나나 먹어보세요!! 🍌",
                isFavorite: true
            )
        )
    }
}
