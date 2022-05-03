//
//  RecordListView.swift
//  MusicPalace(Nano)
//
//  Created by Yoonjae on 2022/04/30.
//

import SwiftUI

struct recordingListView: View {
    @ObservedObject var vm = VoiceViewModel()
    
    var body: some View {
            VStack {
                ScrollView(showsIndicators: false){
                    
                    ForEach(vm.recordingsList, id: \.createdAt) { recording in
                        VStack{
                           
                            HStack{
                                Image(systemName:"headphones")
                                    .font(.system(size:50))
                                    .foregroundColor(.black)
                                
                                VStack(alignment:.leading) {
                                    Text("\(recording.fileURL.lastPathComponent)")
                                        .foregroundColor(.black)
                                }
                                Spacer()
                                VStack {
                                    Button(action: {
                                        vm.deleteRecording(url:recording.fileURL)
                                    }) {
                                        Image(systemName:"xmark.circle.fill")
                                            .foregroundColor(.black)
                                            .font(.system(size:15))
                                    }
                                    Spacer()
                                    
                                    Button(action: {
                                        if recording.isPlaying == true {
                                            vm.stopPlaying(url: recording.fileURL)
                                        }else{
                                            vm.startPlaying(url: recording.fileURL)
                                        }
                                    }) {
                                        Image(systemName: recording.isPlaying ? "stop.fill" : "play.fill")
                                            .foregroundColor(.black)
                                            .font(.system(size:30))
                                    }
                                    
                                }
                                
                            }.padding()
                        }.padding(.horizontal,10)
                        .foregroundColor(.gray)
                        .frame(width: 370, height: 85)
                        .cornerRadius(10)
                        .shadow(color: Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)).opacity(0.3), radius: 10, x: 0, y: 10)
                    }
                }
                
            }.padding(.top,30)
            .navigationBarTitle("음악 녹음")
        
    }
}
