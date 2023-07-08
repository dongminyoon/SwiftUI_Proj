//
//  Product.swift
//  FruitMart
//
//  Created by Dongmin on 2023/07/08.
//  Copyright © 2023 Giftbot. All rights reserved.
//

import Foundation

struct Product {
    let name: String
    let imageName: String
    let price: Int
    let description: String
    let isFavorite: Bool
}

let productSamples: [Product] = [
    Product(name: "나는야 무화과", imageName: "fig", price: 3100, description: "소화가 잘되고 변비에", isFavorite: false),
    Product(name: "유기농 아보카도", imageName: "avocado", price: 2000, description: "미네랄도 풍부하고, 요리 장식", isFavorite: false),
    Product(name: "바나나 안 바나나", imageName: "banana", price: 2400, description: "달콤한 맛의 바나나. 이렇게 맛있으니", isFavorite: false),
    Product(name: "아임 파인애플", imageName: "pineapple", price: 3000, description: "소화와 피로회복, 비타민까지!", isFavorite: false),
    Product(name: "시원한 수박", imageName: "watermelon", price: 3500, description: "아이들이 너무나 좋아하는 시원하고", isFavorite: true)
]
