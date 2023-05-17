//
//  MyCoffeeShopApp.swift
//  MyCoffeeShop
//
//  Created by David Kababyan on 27/02/2023.
//

import SwiftUI
import FirebaseCore

@main
struct MyCoffeeShopApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            AppTabView()
                .environmentObject(BasketViewModel())
                .environmentObject(UserRepository())
        }
    }
}
