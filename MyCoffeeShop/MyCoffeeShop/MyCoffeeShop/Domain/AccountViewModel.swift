//
//  AccountViewModel.swift
//  MyCoffeeShop
//
//  Created by David Kababyan on 27/02/2023.
//

import Foundation

final class AccountViewModel: ObservableObject {
    
    @Published var name = ""
    @Published var address = ""
    @Published var mobile = ""

    func setupUI(user: User?) {
        name = user?.name ?? ""
        address = user?.address ?? ""
        mobile = user?.mobile ?? ""
    }
    
    func isInvalidForm() -> Bool {
        name.isEmpty || address.isEmpty || mobile.isEmpty
    }
}
