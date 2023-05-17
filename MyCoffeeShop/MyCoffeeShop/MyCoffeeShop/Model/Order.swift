//
//  Order.swift
//  MyCoffeeShop
//
//  Created by David Kababyan on 27/02/2023.
//

import Foundation

struct Order: Codable {
    let id: String
    let customerName: String
    let customerAddress: String
    let customerMobile: String
    let items: [Drink]
    let orderTotal: Double
}
