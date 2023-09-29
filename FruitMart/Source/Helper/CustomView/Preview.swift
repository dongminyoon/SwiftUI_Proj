//
//  Preview.swift
//  FruitMart
//
//  Created by Dongmin on 2023/09/29.
//  Copyright © 2023 Giftbot. All rights reserved.
//

import SwiftUI

struct Preview<V: View>: View {
    
    enum Device: String, CaseIterable {
        case iPhoneSE = "iPhone SE"
        case iPhone14 = "iPhone 14"
        case iPhone14Pro = "iPhone 14 Pro"
        case iPhone14ProMax = "iPhone 14 Pro Max"
    }
    
    let source: V
    var devices: [Device] = [.iPhone14Pro, .iPhone14ProMax, .iPhoneSE]
    var displayDarkMode: Bool = true
    
    var body: some View {
        Group {
            ForEach(self.devices, id: \.self) {
                self.previewSource(device: $0)
            }
            
            if self.devices.isEmpty == false && displayDarkMode {
                self.previewSource(device: self.devices[0])
                    .preferredColorScheme(.dark)
            }
        }
    }
    
    private func previewSource(device: Device) -> some View {
        self.source
            .previewDevice(PreviewDevice(rawValue: device.rawValue))
            .previewDisplayName(device.rawValue)
    }
    
}

struct Preview_Previews: PreviewProvider {
    
    static var previews: some View {
        Preview(source: Text("Hello SwiftUI!"))
    }
    
}
