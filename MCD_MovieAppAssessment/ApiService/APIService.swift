//
//  APIService.swift
//  MCD_MovieAppAssessment
//
//  Created by Ramyashree S on 5/30/25.
//

import Foundation

class APIService {
    static let shared = APIService()
    
    private init() {}
    
    //Data from Network call
    func fetchMyData<T: Decodable>(urlString: String, model : T.Type) async throws -> T {
        
        guard let url = URL(string: urlString) else {
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
    
    //Data from local json file
    func fetchMyMockedData<T: Decodable>(file: String, model : T.Type) async throws -> T {
        
        guard let url = Bundle.main.url(forResource: file, withExtension: nil) else {
               throw NSError(domain: "FileError", code: 1, userInfo: [NSLocalizedDescriptionKey: "Failed to locate \(file) in bundle"])
           }

           do {
               let data = try Data(contentsOf: url)
               let decoder = JSONDecoder()
               let loadedFile = try decoder.decode(T.self, from: data)
               return loadedFile
           } catch {
               print("Failed to load and decode JSON: \(error)")
               throw NSError(domain: "DecodingError", code: 2, userInfo: [NSLocalizedDescriptionKey: "Failed to decode \(file): \(error)"])
           }
    }
}
