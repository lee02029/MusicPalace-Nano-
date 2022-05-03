//
//  convertSecToMinAndHour.swift
//  MusicPalace(Nano)
//
//  Created by Yoonjae on 2022/04/30.
//

import Foundation

extension VoiceViewModel {
    func covertSecToMinAndHour(seconds : Int) -> String{
        
        let (_,m,s) = (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
        let sec : String = s < 10 ? "0\(s)" : "\(s)"
        return "\(m):\(sec)"
        
    }
}
