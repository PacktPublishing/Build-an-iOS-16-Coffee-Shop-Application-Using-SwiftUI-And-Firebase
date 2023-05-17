//
//  HomeViewModel.swift
//  MyCoffeeShop
//
//  Created by David Kababyan on 27/02/2023.
//

import Foundation

final class HomeViewModel: ObservableObject {
    private let firebaseRepository = FirebaseRepository()
    
    @Published private(set) var drinks: [Drink] = []
    @Published private(set) var selectedDrink: Drink?
    
    @MainActor
    @Sendable func fetchDrinks() async {
        do {
            drinks = try await firebaseRepository.fetchDrinks()
        } catch {
            print("Error fetching drinks ", error.localizedDescription)
        }
    }
    
    
    func selectDrink(drink: Drink) {
        selectedDrink = drink
    }
}
