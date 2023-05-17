//
//  AppError.swift
//  MyCoffeeShop
//
//  Created by David Kababyan on 27/02/2023.
//

import Foundation

enum AppError: Error {
    case EmptyBasketError, NoUserError
}

extension AppError: CustomStringConvertible {
    public var description: String {
        switch self {
        case .EmptyBasketError:
            return "You have no items in your basket."
        case .NoUserError:
            return "Please login to place an order."
        }
    }
}
