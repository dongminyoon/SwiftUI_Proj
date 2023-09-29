//
//  Home.swift
//  FruitMart
//
//  Created by Giftbot on 2020/03/02.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import SwiftUI

struct Home: View {
    
    init(store: Store = Store()) {
        self.store = store
    }
    
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
    
    private let store: Store
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Preview(source: Home())
    }
}
