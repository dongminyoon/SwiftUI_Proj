//
//  Home.swift
//  FruitMart
//
//  Created by Giftbot on 2020/03/02.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import SwiftUI

struct Home: View {
        
    var body: some View {
        NavigationView {
            List {
                ForEach(self.store.products) { product in
                    NavigationLink(destination: ProductDetailView(product: product)) {
                        ProductRow(product: product)
                    }
                }
            }
            .listStyle(.grouped)
            .navigationBarTitle("과일마트")
        }
    }
    
    @EnvironmentObject private var store: Store
    
}

struct Home_Previews: PreviewProvider {
    
    static var previews: some View {
        Preview(source: Home())
            .environmentObject(Store())
    }
    
}
