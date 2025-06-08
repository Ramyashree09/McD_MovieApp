//
//  QuotesModel.swift
//  MCD_MovieAppAssessment
//
//  Created by Ramyashree S on 5/30/25.
//

import Foundation

struct QuotesDetail :Decodable, Identifiable, Hashable {
    var _id : String
    var dialog : String
    var movie : String
    var character : String
    var id : String
}
