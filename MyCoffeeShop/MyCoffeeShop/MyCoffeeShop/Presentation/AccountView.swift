//
//  AccountView.swift
//  MyCoffeeShop
//
//  Created by David Kababyan on 27/02/2023.
//

import SwiftUI

struct AccountView: View {
    @StateObject private var viewModel = AccountViewModel()
    @EnvironmentObject var userRepository: UserRepository
    
    @ViewBuilder
    private func logOutButton() -> some View {
        Button {
            userRepository.removeUser()
            viewModel.setupUI(user: nil)
        } label: {
            Text("Log Out")
        }
    }
    
    var body: some View {
        
        NavigationStack {
            Form {
                Section("Personal info") {
                    TextField("First Name", text: $viewModel.name)
                    TextField("Address", text: $viewModel.address)
                    TextField("Mobile", text: $viewModel.mobile)
                }
                
                Section {
                    Button {
                        userRepository.saveChanges(name: viewModel.name,
                                                   address: viewModel.address,
                                                   mobile: viewModel.mobile)
                    } label: {
                        Text(userRepository.user != nil ? "Update" : "Create" )
                    }
                }
                .disabled(viewModel.isInvalidForm())
            }
            .navigationTitle("😎 My Account")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    if userRepository.user != nil { logOutButton() }
                }
            }
            .onAppear {
                viewModel.setupUI(user: userRepository.user)
            }
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
