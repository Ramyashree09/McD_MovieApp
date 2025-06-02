//
//  MoviewModel.swift
//  MCD_MovieAppAssessment
//
//  Created by Ramyashree S on 5/30/25.
//

struct Movie : Decodable {
    var docs : [MovieDetail]? = nil
    var total : Int
    var limit : Int
    var offset : Int
    var page : Int
    var pages : Int
}

struct MovieDetail : Decodable, Identifiable, Hashable {
    var _id : String
    var id : String {
        _id
    }
    var name: String
    var runtimeInMinutes : Int
    var budgetInMillions : Int
    var boxOfficeRevenueInMillions : Double?
    var academyAwardNominations : Int
    var academyAwardWins : Int
    var rottenTomatoesScore : Double?
}
