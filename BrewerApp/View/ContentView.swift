//
//  ContentView.swift
//  BrewerApp
//
//  Created by Ismayil Ismayilov on 5/19/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var breweryViewModel = BreweryViewModel(network: BreweryNetwork())
    
    
    var body: some View {
        
        NavigationView {
            List(breweryViewModel.breweries, id: \.self) {
                BreweryView(brewery: $0)
            }
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle("Breweries")
            .onAppear {
                breweryViewModel.fetchBreweries()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
