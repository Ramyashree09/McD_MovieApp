//
//  CharacterModel.swift
//  MCD_MovieAppAssessment
//
//  Created by Ramyashree S on 5/30/25.
//

struct Character : Decodable {
    var docs : [CharacterDetail]? = nil
    var total : Int
    var limit : Int
    var offset : Int
    var page : Int
    var pages : Int
}

struct CharacterDetail :Decodable, Identifiable, Hashable {
    var _id : String
    var id : String {
        _id
    }
    var name : String
    var wikiUrl : String? = nil
    var race : String? = nil
    var birth : String? = nil
    var gender : String? = nil
    var death : String? = nil
    var hair : String? = nil
    var height : String? = nil
    var realm : String? = nil
    var spouse : String? = nil
}
