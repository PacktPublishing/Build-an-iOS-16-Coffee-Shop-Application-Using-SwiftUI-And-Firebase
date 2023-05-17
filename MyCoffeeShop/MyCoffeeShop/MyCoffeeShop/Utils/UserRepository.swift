//
//  UserRepository.swift
//  MyCoffeeShop
//
//  Created by David Kababyan on 27/02/2023.
//

import Foundation


final class UserRepository: ObservableObject {
    private let secureStorage = SecureStorage()
    
    @Published var user: User?
    
    init() {
        Task {
            user = await fetchUser()
        }
    }
    
    func saveChanges(name: String, address: String, mobile: String) {
        if user != nil {
            updateUser(name: name, address: address, mobile: mobile)
        } else {
            createUser(name: name, address: address, mobile: mobile)
        }
    }
    
    private func createUser(name: String, address: String, mobile: String) {
        do {
            user = User(id: UUID().uuidString, name: name, address: address, mobile: mobile)
            
            let userData = try JSONEncoder().encode(user)
            Task {
                await secureStorage.save(data: userData, with: userKey)
            }
        } catch {
            print("Error, couldn't create user!")
        }
    }
    
    private func updateUser(name: String, address: String, mobile: String) {
        do {
            user?.name = name
            user?.address = address
            user?.mobile = mobile
            
            let userData = try JSONEncoder().encode(user)
            Task {
                await secureStorage.save(data: userData, with: userKey)
            }
        } catch {
            print("Error, couldn't save user!")
        }
    }
    
    func fetchUser() async -> User? {
        guard let userData = await secureStorage.get(with: userKey) else { return nil }
        
        do {
            return try JSONDecoder().decode(User.self, from: userData)
        } catch {
            print("Error couldn't get user")
        }
        
        return nil
    }
    
    @MainActor
    func removeUser() {
        Task {
            await secureStorage.delete(with: userKey)
            user = nil
        }
    }
}
