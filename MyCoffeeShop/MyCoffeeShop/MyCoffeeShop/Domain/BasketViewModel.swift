//
//  BasketViewModel.swift
//  MyCoffeeShop
//
//  Created by David Kababyan on 27/02/2023.
//

import Foundation

final class BasketViewModel: ObservableObject {
    private let firebaseRepository = FirebaseRepository()
    
    @Published var basketError: AppError?
    @Published var showError = false
    @Published private(set) var items: [Drink] = []
    
    func add(drink: Drink) {
        items.append(drink)
    }
    
    func deleteItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
    
    var totalPrice: Double {
        items.reduce(0) { $0 + $1.price}
    }
    
    func createOrder(for user: User?) {
        guard !items.isEmpty else {
            basketError = .EmptyBasketError
            showError = true
            return
        }
        
        guard let user = user else {
            basketError = .NoUserError
            showError = true
            return
        }
        
        let order = Order(id: UUID().uuidString,
                          customerName: user.name,
                          customerAddress: user.address,
                          customerMobile: user.mobile,
                          items: items,
                          orderTotal: totalPrice)
        
        firebaseRepository.placeOrder(order: order)
        items = []
    }
}
