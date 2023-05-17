//
//  SecureStorage.swift
//  MyCoffeeShop
//
//  Created by David Kababyan on 27/02/2023.
//

import Foundation
import KeychainAccess

let userKey = "userSecureKey"

final class SecureStorage {
    
    private static let keychain = Keychain(service: "com.iosdevschool.MyCoffeeShop")
    
    func save(data: Data, with key: String) async {
        SecureStorage.keychain[data: key] = data
    }
    
    func get(with key: String) async -> Data? {
        SecureStorage.keychain[data: key]
    }
    
    func delete(with key: String) async {
        SecureStorage.keychain[key] = nil
    }
}
