//
//  QuantitySelector.swift
//  FruitMart
//
//  Created by Dongmin on 2023/10/15.
//  Copyright © 2023 Giftbot. All rights reserved.
//

import SwiftUI

struct QuantitySelector: View {
    
    @Binding var quantity: Int
    
    var body: some View {
        HStack {
            Button(action: { self.minusQuantityIfValidate() }) {
                Image(systemName: "minus.circle.fill")
                    .imageScale(.large)
                    .padding()
            }
            .foregroundColor(Color.gray.opacity(0.5))
            
            Text("\(self.quantity)")
                .bold()
                .font(.system(.title, design: .monospaced))
                .frame(minWidth: 40, maxWidth: 60)
            
            Button(action: { self.plusQuantityIfValidate() }) {
                Image(systemName: "plus.circle.fill")
                    .imageScale(.large)
                    .padding()
            }
            .foregroundColor(Color.gray.opacity(0.5))
        }
    }
    
    private func plusQuantityIfValidate() {
        guard self.validateRange ~= self.quantity + 1 else {
            self.occurRigidHapticFeedback()
            return
        }
        self.occurSoftHapticFeedback()
        self.quantity += 1
    }
    
    private func minusQuantityIfValidate() {
        guard self.validateRange ~= self.quantity - 1 else {
            self.occurRigidHapticFeedback()
            return
        }
        self.occurSoftHapticFeedback()
        self.quantity -= 1
    }
    
    private func occurRigidHapticFeedback() {
        self.rigidFeedback.prepare()
        self.rigidFeedback.impactOccurred()
    }
    
    private func occurSoftHapticFeedback() {
        self.softFeedback.prepare()
        self.softFeedback.impactOccurred(intensity: 0.8)
    }
    
    private let softFeedback = UIImpactFeedbackGenerator(style: .soft)
    private let rigidFeedback = UIImpactFeedbackGenerator(style: .rigid)
    private let validateRange: ClosedRange<Int> = 1...20
    
}

struct QuantitySelector_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            QuantitySelector(quantity: .constant(1))
            QuantitySelector(quantity: .constant(10))
            QuantitySelector(quantity: .constant(100))
        }
        .previewLayout(.sizeThatFits)
    }
}
