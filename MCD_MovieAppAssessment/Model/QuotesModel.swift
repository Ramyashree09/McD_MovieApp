//
//  QuotesModel.swift
//  MCD_MovieAppAssessment
//
//  Created by Ramyashree S on 5/30/25.
//

struct Quotes : Decodable {
    var docs : [QuotesDetail]? = nil
    var total : Int
    var limit : Int
    var offset : Int
    var page : Int
    var pages : Int
}

struct QuotesDetail :Decodable, Identifiable, Hashable {
    var _id : String
    var dialog : String
    var movie : String
    var character : String
    var id : String
}
