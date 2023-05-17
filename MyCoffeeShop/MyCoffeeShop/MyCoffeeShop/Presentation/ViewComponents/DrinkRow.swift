//
//  DrinkRow.swift
//  MyCoffeeShop
//
//  Created by David Kababyan on 27/02/2023.
//

import SwiftUI

struct DrinkRow: View {
    
    private let drink: Drink
    var didClickRow: () -> Void
    
    init(_ drink: Drink, didClickRow: @escaping () -> Void) {
        self.drink = drink
        self.didClickRow = didClickRow
    }
    
    var body: some View {
        Button {
            didClickRow()
        } label: {
            HStack {
                RemoteImageView(url: drink.imageUrl)
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .cornerRadius(8)
                    .clipped()
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(drink.name)
                        .font(.title2)
                        .fontWeight(.medium)
                    
                    Text("\(drink.price, format: .currency(code: "EUR"))")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.secondary)
                    
                }
                .padding(.leading)
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
        }
        .tint(.black)
    }
}

struct DrinkRow_Previews: PreviewProvider {
    static var previews: some View {
        DrinkRow(DummyData.drinks[0]) {
            
        }
    }
}
