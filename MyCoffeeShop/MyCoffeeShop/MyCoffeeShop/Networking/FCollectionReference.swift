//
//  FCollectionReference.swift
//  MyCoffeeShop
//
//  Created by David Kababyan on 27/02/2023.
//

import Firebase
import FirebaseFirestoreSwift

enum FCollectionReference: String {
    case Orders, Drinks
}

func FirebaseReference(_ collectionReference: FCollectionReference) -> CollectionReference {
    
    Firestore.firestore().collection(collectionReference.rawValue)
}
