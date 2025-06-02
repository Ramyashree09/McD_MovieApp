//
//  MockQuotesListClass.swift
//  MCD_MovieAppAssessment
//
//  Created by Ramyashree S on 5/30/25.
//
class MockQuotesListClass: FetchDataProtocol {
    typealias DataType = QuotesDetail
    func fetchData() async -> [QuotesDetail]? {
        let quotesList = [QuotesDetail(_id: "5cd96e05de30eff6ebcce9b7", dialog: "Well, yes. At least well enough for my own people. But we have no songs for great halls and evil times.", movie: "5cd95395de30eff6ebccde5d", character: "5cd99d4bde30eff6ebccfe2e", id: "5cd96e05de30eff6ebcce9b7"),
                          
                         QuotesDetail(_id: "5cd96e05de30eff6ebcce9b8", dialog: "Sauron's wrath will be terrible, his retribution swift.", movie: "5cd95395de30eff6ebccde5b", character: "5cd99d4bde30eff6ebccfea0", id: "5cd96e05de30eff6ebcce9b8"),
                          QuotesDetail(_id: "5cd96e05de30eff6ebcce9b9", dialog: "The battle for Helm's Deep is over. The battle for Middle-earth is about to begin.", movie: "5cd95395de30eff6ebccde5b", character: "5cd99d4bde30eff6ebccfea0", id: "5cd96e05de30eff6ebcce9b9"),
                          QuotesDetail(_id: "5cd96e05de30eff6ebcce9ba", dialog: "All our hopes now lie with two little Hobbits...", movie: "5cd95395de30eff6ebccde5b", character: "5cd99d4bde30eff6ebccfea0", id: "5cd96e05de30eff6ebcce9ba")]
        return quotesList
    }
}

// Mock of FetchDataUseCase
class MockQuotesUseCase: FetchDataUseCase<MockQuotesListClass> {
    override func execute() async -> [QuotesDetail] {
        return [QuotesDetail]()
    }
}

