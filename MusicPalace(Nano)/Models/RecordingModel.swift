//
//  RecordingModel.swift
//  MusicPalace(Nano)
//
//  Created by Yoonjae on 2022/04/30.
//

import Foundation

struct Recording : Equatable {
    let fileURL : URL
    let createdAt : Date
    var isPlaying : Bool
    
}
