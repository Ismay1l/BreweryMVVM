//
//  BreweryViewModel.swift
//  BrewerApp
//
//  Created by Ismayil Ismayilov on 5/19/24.
//

import Foundation
import Combine

final class BreweryViewModel: ObservableObject {
    
    @Published var breweries: [Brewery] = []
    
    private let network: BreweryNetworkProtocol
    private var cancellable = Set<AnyCancellable>()
    
    init(network: BreweryNetworkProtocol) {
        self.network = network
    }
    
    func fetchBreweries() {
        network.fetchBreweries()
            .sink { completion in
                switch completion {
                    
                case .finished:
                    print("Finished successfully")
                case .failure(let error):
                    print(String.init(describing: error))
                }
            } receiveValue: { [weak self] breweries in
                self?.breweries = breweries
            }
            .store(in: &cancellable)
    }
}
