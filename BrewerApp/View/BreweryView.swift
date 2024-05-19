//
//  BreweryView.swift
//  BrewerApp
//
//  Created by Ismayil Ismayilov on 5/19/24.
//

import SwiftUI

struct BreweryView: View {
    
    private let brewery: Brewery
    
    init(brewery: Brewery) {
        self.brewery = brewery
    }
    
    var body: some View {
        HStack {
            Image(systemName: "circle")
                .resizable()
                .scaledToFit()
                .frame(
                    width: 50,
                    height: 50,
                    alignment: .center
                )
                .foregroundColor(.yellow)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(brewery.name ?? "")
                    .font(.system(size: 18))
                    .foregroundColor(.blue)
                Text("\(brewery.city ?? "") - \(brewery.street ?? "")")
                    .font(.system(.subheadline, design: .rounded, weight: .regular))
                    .foregroundColor(.brown)
            }
        }
    }
}

struct BreweryView_Previews: PreviewProvider {
    static var previews: some View {
        BreweryView(brewery: Brewery(
            id: "1",
            name: "Name",
            street: "City",
            city: "City"
        )
        )
    }
}
