//
//  ViewModifierPractice.swift
//  FruitMart
//
//  Created by Dongmin on 2023/10/22.
//  Copyright © 2023 Giftbot. All rights reserved.
//

import SwiftUI

struct CustomViewModifier: ViewModifier {
    
    var borderColor: Color = .red
    
    func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundColor(Color.white)
            .padding()
            .background(Rectangle().fill(Color.gray))
            .cornerRadius(8)
    }
    
}

struct ViewModifierPractice: View {
    
    var body: some View {
        Text("Custom ViewModifier")
            .modifier(CustomViewModifier(borderColor: .blue))
    }
    
}

struct ViewModifierPractice_Previews: PreviewProvider {
    
    static var previews: some View {
        ViewModifierPractice()
    }
    
}
