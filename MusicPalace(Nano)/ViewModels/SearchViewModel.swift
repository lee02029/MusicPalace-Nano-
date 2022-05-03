//
//  SearchViewModel.swift
//  MusicPalace(Nano)
//
//  Created by Yoonjae on 2022/04/30.
//

import SwiftUI
import UIKit

func loadJson<T: Decodable>(_ filename: String) -> T {
    let data: Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("\(filename) not found.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Could not load \(filename): (error)")
    }

    do {
        // parse the data
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("Unable to parse \(filename): (error)")
    }

}

class SearchStore : ObservableObject {

    @Published var searchs: [Search]

    init (searchs: [Search] = []) {
        self.searchs = searchs
    }

}




