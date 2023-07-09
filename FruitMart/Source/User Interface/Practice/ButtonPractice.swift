//
//  ButtonPractice.swift
//  FruitMart
//
//  Created by Dongmin on 2023/07/09.
//  Copyright © 2023 Giftbot. All rights reserved.
//

import SwiftUI

struct ButtonPractice: View {
    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                Button("Button 1") {
                    print("@Button 1 Tapped")
                }
                                
                Button(action: { print("@Button 2 Tapped") }) {
                    Text("Button 2")
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).strokeBorder())
                }
                
                Button(action: { print("@Button 3 Tapped") }) {
                    if #available(iOS 15.0, *) {
                        Circle()
                            .stroke(lineWidth: 2)
                            .frame(width: 80, height: 80)
                            .overlay(content: { Text("Button 3") })
                            .onTapGesture {
                                print("이것도 될까??")
                            }
                    } else {
                        Circle()
                            .stroke(lineWidth: 2)
                            .frame(width: 80, height: 80)
                            .overlay(Text("Button 3"))
                    }
                }
                // UIButton.tintColor와 같은 역할
                .accentColor(.green)
            }
            
            HStack(spacing: 20) {
                Button(action: { print("@Button 1 Tapped") }) {
                    Image(systemName: "play.circle")
                        .resizable()
                        .frame(width: 120, height: 120)
                }
                
                Button(action: { print("@Button 2 Tapped") }) {
                    Image(systemName: "play.circle")
                        .imageScale(.large)
                        .font(.largeTitle)
                }
                .padding()
            }
        }
    }
    
}

struct ButtonPractice_Previews: PreviewProvider {
    static var previews: some View {
        ButtonPractice()
    }
}
