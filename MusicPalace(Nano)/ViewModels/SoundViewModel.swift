//
//  SoundViewModel.swift
//  MusicPalace(Nano)
//
//  Created by Yoonjae on 2022/04/30.
//

import SwiftUI
import AVKit

class SoundSetting: ObservableObject {
    static let instance = SoundSetting()
    var player: AVAudioPlayer?
    enum SoundOption: String {
        case Click
        case Knock
    }
    
    func playSound(sound: SoundOption) {
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("재생하는데 오류가 발생하였습니다. \(error.localizedDescription)")
        }
        
                
    }

}
