//
//  DummyData.swift
//  MyCoffeeShop
//
//  Created by David Kababyan on 27/02/2023.
//

import Foundation

struct DummyData {
    
    static let basket = Basket(id: UUID().uuidString, items: [])
    static let user = User(id: UUID().uuidString, name: "David", address: "123 North Avenue", mobile: "99887766")
//    gadost0, ulleo, MorningbirdPhoto, islandworks, dany_paranoid, priyampatel4
    static let drinks: [Drink] = [
        Drink(id: UUID().uuidString,
              name: "Espresso",
              description: "Espresso is the purest distillation of the coffee bean. It doesn’t refer to a bean or blend, but actually the preparation method.",
              imageLink: "https://cdn.pixabay.com/photo/2015/05/07/13/46/cappuccino-756490_960_720.jpg",
              price: 2.50,
              category: Category.hot),
        
        Drink(id: UUID().uuidString,
              name: "Cappuccino",
              description: "Outside of Italy, cappuccino is a coffee drink that today is typically composed of double espresso and hot milk, with the surface topped with foamed milk. Cappuccinos are most often prepared with an espresso machine.",
              imageLink:  "https://cdn.pixabay.com/photo/2018/10/11/21/34/cappucino-3740926_960_720.jpg",
              price: 2.50,
              category: Category.hot),
        
        Drink(id: UUID().uuidString,
              name: "Ice Latte",
              description: "The latte is one of the most iconic espresso drinks, favored for its frothy foam topping. In this refreshing iced version, you can easily create foam with cold milk—no steamer needed.",
              imageLink: "https://cdn.pixabay.com/photo/2014/11/21/15/20/coffee-540653_960_720.jpg",
              price: 3.50,
              category: Category.cold),
        
        Drink(id: UUID().uuidString,
              name: "Americano",
              description: "An Americano Coffee is an Espresso-based coffee drink with no special additions. Actually it is a shot of Espresso with hot water poured in it. A well-prepared Americano has the subtle aroma and flavour like Espresso. Benefits of Americano Coffee it has a lighter body and less bitterness.",
              imageLink: "https://cdn.pixabay.com/photo/2015/07/13/14/58/coffee-843278_960_720.jpg",
              price: 2.50,
              category: Category.cold),
       
        Drink(id: UUID().uuidString,
              name: "Coca Cola",
              description: "The Coca-Cola Co. is the nonalcoholic beverage company, which engages in the manufacture, market, and sale of non-alcoholic beverages which include sparkling soft drinks, water, enhanced water and sports drinks, juice, dairy and plant-based beverages, tea and coffee and energy drinks.",
              imageLink: "https://cdn.pixabay.com/photo/2017/03/07/18/06/coca-cola-2124863_960_720.jpg",
              price: 1.50,
              category: Category.softDrinks),
        
        Drink(id: UUID().uuidString,
              name: "Pepsi Cola",
              description: "Pepsi is a carbonated soft drink manufactured by PepsiCo. Originally created and developed in 1893 by Caleb Bradham and introduced as Brad's Drink, it was renamed as Pepsi-Cola in 1898, and then shortened to Pepsi in 1961.",
              imageLink: "https://cdn.pixabay.com/photo/2020/05/10/05/14/pepsi-5152332_960_720.jpg",
              price: 1.50,
              category: Category.softDrinks)
    ]
}
