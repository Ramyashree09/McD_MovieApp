//
//  ResponseModel.swift
//  MCD_MovieAppAssessment
//
//  Created by Ramyashree S on 6/5/25.
//

import Foundation

struct ResponseModel<T:Decodable> : Decodable {
    var docs : [T]? = nil
    var total : Int
    var limit : Int
    var offset : Int
    var page : Int
    var pages : Int
}
