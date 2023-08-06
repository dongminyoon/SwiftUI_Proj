//
//  GeometryPractice.swift
//  FruitMart
//
//  Created by Dongmin on 2023/08/06.
//  Copyright © 2023 Giftbot. All rights reserved.
//

import SwiftUI

struct GeometryPractice: View {
    
    var body: some View {
        GeometryReader { geometry in
            Text("Geometry Reader")
                .font(.largeTitle)
                .bold()
                .position(
                    x: geometry.size.width / 2,
                    y: geometry.safeAreaInsets.top
                )
            
            VStack {
                Text("Size").bold()
                Text("width : \(geometry.size.width)")
                Text("heigt : \(geometry.size.height)")
            }
            .position(
                x: geometry.size.width / 2,
                y: geometry.size.height / 2.5
            )
            
            VStack {
                Text("SafeAreaInsets").bold()
                Text("top : \(geometry.safeAreaInsets.top)")
                Text("bottom : \(geometry.safeAreaInsets.bottom)")
            }
            .position(
                x: geometry.size.width / 2,
                y: geometry.size.height / 1.4
            )
        }
        .frame(height: 500)
        .border(Color.green, width: 5)
    }
    
}

struct GeometryPractice_Previews: PreviewProvider {
    static var previews: some View {
        GeometryPractice()
    }
}
