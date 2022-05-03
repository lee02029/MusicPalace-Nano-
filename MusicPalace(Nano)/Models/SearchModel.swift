//
//  SearchModel.swift
//  MusicPalace(Nano)
//
//  Created by Yoonjae on 2022/04/30.
//

import SwiftUI

var searchData: [Search] = loadJson("searchData.json")
typealias Codable = Decodable & Encodable
struct Search: Codable, Identifiable {
    var id = UUID().uuidString
    var singer: String
    var song: String
}
