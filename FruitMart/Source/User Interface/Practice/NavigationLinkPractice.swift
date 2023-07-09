//
//  NavigationLinkPractice.swift
//  FruitMart
//
//  Created by Dongmin on 2023/07/09.
//  Copyright © 2023 Giftbot. All rights reserved.
//

import SwiftUI

struct NavigationLinkPractice: View {
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                NavigationLink(destination: Text("First Destination View")) {
                    Text("Go to first destination view")
                }

                NavigationLink(destination: Text("Second Destination View")) {
                    Text("Go to second destination view")
                }

                NavigationLink(destination: Text("Third Destination View")) {
                    Text("Go to third destination view")
                }
            }
        }
    }
    
}

struct NavigationLinkPractice_Previews: PreviewProvider {
    static var previews: some View {
        NavigationLinkPractice()
    }
}
