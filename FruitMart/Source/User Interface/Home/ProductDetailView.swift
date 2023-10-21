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
                .ignoresSafeArea(edges: [.top])
        } else {
            return stack
                .edgesIgnoringSafeArea([.top])
        }
    }
    
    private var topArea: some View {
        GeometryReader { geometry in
            Image(self.product.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: geometry.size.width, height: geometry.size.height)
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
            .padding(32)
            .background(Color.white)
            .cornerRadius(16)
            .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: -5)
            .frame(height: geometry.size.height + geometry.safeAreaInsets.bottom)
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
        let price = self.product.price * self.quantity
        
        return HStack() {
            (Text("₩") + Text("\(price)").font(.title))
                .fontWeight(.medium)
            Spacer()
            QuantitySelector(quantity: self.$quantity)
        }aw
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
        }
    }
    
    @State private var quantity: Int = 1
    private let product: Product
    
}

struct ProductDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        let store = Store()
        let previewOne = ProductDetailView(product: store.products[0])
        let previewTwo = ProductDetailView(product: store.products[1])
        
        Group {
            Preview(source: previewOne)
            Preview(source: previewTwo, device: [.iPhone14Pro], displayDarkMode: false)
        }
    }
    
}
