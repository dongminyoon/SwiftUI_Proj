//
//  Color+Extension.swift
//  FruitMart
//
//  Created by Dongmin on 2023/07/08.
//  Copyright © 2023 Giftbot. All rights reserved.
//

import SwiftUI

extension Color {
    
    static let peach = Color("peach")
    static let primaryShadow = Color.primary.opacity(0.2)
    static let secondaryText = Color(hexString: "#6e6e6e")
    static let background = Color(UIColor.systemGray6)
    
    init(hexString: String) {
        let scanner = Scanner(string: hexString)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let red = Double((rgb >> 16) & 0xFF) / 255.0
        let green = Double((rgb >> 8) & 0xFF) / 255.0
        let blue = Double((rgb >> 0) & 0xFF) / 255.0
        self.init(red: red, green: green, blue: blue)
    }
    
}
