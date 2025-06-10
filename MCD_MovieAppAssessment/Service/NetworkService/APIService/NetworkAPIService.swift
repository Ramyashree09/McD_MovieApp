//
//  NetworkAPIService.swift
//  MCD_MovieAppAssessment
//
//  Created by Ramyashree S on 5/30/25.
//

import Foundation
import SwiftUI

public protocol FetchDataProtocol {
    
    associatedtype DataType
       func fetchData() async throws-> [DataType]?
}

class APIService {
    static let shared = APIService()

    private init() {}
    
    //Fetch data from API by creating valid url
    func fetchRequest<T: Decodable>(urlString: String, model : T.Type) async throws -> T {
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL: \(urlString)") //debugging
            throw URLError(.badURL)
        }
        guard Reachability.isConnectedToNetwork() else {
            throw URLError(.notConnectedToInternet)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
            throw URLError(.badServerResponse)
        }
        
        return try JSONDecoder().decode(model, from: data)
    }
}
