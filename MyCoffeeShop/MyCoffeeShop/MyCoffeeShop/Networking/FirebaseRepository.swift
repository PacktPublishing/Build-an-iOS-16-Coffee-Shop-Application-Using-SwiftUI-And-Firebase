//
//  FirebaseRepository.swift
//  MyCoffeeShop
//
//  Created by David Kababyan on 27/02/2023.
//

import Foundation

final class FirebaseRepository {
    
    func fetchDrinks() async throws -> [Drink] {

        try await withCheckedThrowingContinuation { continuation in
            
            FirebaseReference(.Drinks).getDocuments { querySnapshot, error in
                
                if let error = error {
                    continuation.resume(throwing: error)
                    return
                }
                
                guard let documents = querySnapshot?.documents else {
                    continuation.resume(returning: [])
                    return
                }
                
                let result = documents.compactMap { queryDocumentSnapshot -> Drink? in
                    return try? queryDocumentSnapshot.data(as: Drink.self)
                }
                
                continuation.resume(returning: result)
            }
        }
    }
    
    //used to upload menu
//    func saveDrinks() {
//        for drink in DummyData.drinks {
//            do {
//                try FirebaseReference(FCollectionReference.Drinks).document(drink.id).setData(from: drink.self)
//            } catch {
//                print("Error saving drink to firebase")
//            }
//        }
//    }
    
    func placeOrder(order: Order) {
        do {
            try FirebaseReference(.Orders).document(order.id).setData(from: order.self)
        } catch {
            print("Error saving order to FB, ", error.localizedDescription)
        }
//        print("Place an order for: \(order.customerName)")
//        for item in order.items {
//            print(item.name)
//        }
    }
}
