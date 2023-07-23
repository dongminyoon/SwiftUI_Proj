//
//  ListPractice.swift
//  FruitMart
//
//  Created by Dongmin on 2023/07/23.
//  Copyright © 2023 Giftbot. All rights reserved.
//

import SwiftUI

struct ListPractice: View {
    
    let sections = ["TEACHER", "STUDENT"]
    let totalDatas = [
        ["Sam", "Smith", "Canna", "Jenny"],
        ["Justin", "Ahri", "Jin", "Devil", "Jack"]
    ]
    
    var body: some View {
        List {
            ForEach(self.totalDatas.indices) { index in
                Section(content: {
                    ForEach(self.totalDatas[index], id: \.self) {
                        Text($0)
                    }
                }, header: {
                    Text(self.sections[index])
                }, footer: {
                    Text("Section Count : \(self.totalDatas[index].count)")
                })
            }
        }
    }
    
}

struct ListPractice_Previews: PreviewProvider {
    static var previews: some View {
        ListPractice()
    }
}
