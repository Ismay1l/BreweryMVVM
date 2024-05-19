//
//  BreweryNetwork.swift
//  BrewerApp
//
//  Created by Ismayil Ismayilov on 5/19/24.
//

import Foundation
import Combine

protocol BreweryNetworkProtocol {
    func fetchBreweries() -> AnyPublisher<[Brewery], Error>
}

class BreweryNetwork: BreweryNetworkProtocol {
    
    private enum NetworkURLs {
        static let breweries = "https://api.openbrewerydb.org/breweries"
    }
    
    func fetchBreweries() -> AnyPublisher<[Brewery], Error> {
        guard let url = URL(string: NetworkURLs.breweries) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [Brewery].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .retry(2)
            .eraseToAnyPublisher()
    }
}
