//
//  NavigationPractice.swift
//  FruitMart
//
//  Created by Dongmin on 2023/07/09.
//  Copyright © 2023 Giftbot. All rights reserved.
//

import SwiftUI

struct NavigationPractice: View {
    
    var body: some View {
        let leadingItem = Button(action: { print("@Leading Item Tapped") }) {
            Image(systemName: "bell")
        }
        let trailingItem = Button(action: { print("@Trailing Item Tapped") }) {
            Image(systemName: "gear")
        }
        return NavigationView(content: {
            if #available(iOS 14.0, *) {
                Image("apple")
                    .navigationTitle("네비게이션 타이틀")
                    .navigationBarTitleDisplayMode(.large)
                    .toolbar(content: {
                        ToolbarItem(placement: .navigationBarLeading, content: { leadingItem })
                        ToolbarItem(placement: .navigationBarTrailing, content: { trailingItem })
                    })
            } else {
                Image("apple")
                    .navigationBarTitle("네비게이션 타이틀", displayMode: .large)
                    .navigationBarItems(leading: leadingItem)
                    .navigationBarItems(trailing: trailingItem)
            }
        })
    }
    
}

struct NavigationPractice_Previews: PreviewProvider {
    static var previews: some View {
        NavigationPractice()
    }
}
