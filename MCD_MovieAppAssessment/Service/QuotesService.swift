//
//  QuotesService.swift
//  MCD_MovieAppAssessment
//
//  Created by Ramyashree S on 5/30/25.
//

import Foundation

class QuotesListClass : FetchDataProtocol, ObservableObject {
    typealias DataType = QuotesDetail
    @Published var quotesList: [QuotesDetail] = []
    func fetchData() async throws -> [QuotesDetail]? {
        do {
            let quotes: ResponseModel = try await
            APIService.shared.fetchRequest(urlString: APIConstants.quotes, model: ResponseModel<QuotesDetail>.self)
            print("Fetched quotes from API response: \(quotes)") //debugging
            self.quotesList = quotes.docs ?? [QuotesDetail]()
        } catch {
            self.quotesList = []
            print("Error fetching data: \(error.localizedDescription)")
        }
        return self.quotesList
    }
}
