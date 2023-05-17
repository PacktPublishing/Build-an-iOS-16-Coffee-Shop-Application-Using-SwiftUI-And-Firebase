//
//  Basket.swift
//  MyCoffeeShop
//
//  Created by David Kababyan on 27/02/2023.
//

import Foundation

struct Basket: Codable {
    let id: String
    let items: [Drink]
}
