//
//  RecordView.swift
//  MusicPalace(Nano)
//
//  Created by Yoonjae on 2022/04/30.
//

import SwiftUI

struct RecordView: View {
    
    @ObservedObject var vm = VoiceViewModel()
    
    @State private var showingList = false
    @State private var showingAlert = false
    @State var recordName : String  = ""
    
    var body: some View {
        NavigationView {
            ZStack{
                
                Image("back")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    
                    HStack{
                        Button(action: {
                            if vm.isRecording == true {
                                vm.stopRecording()
                            }
                            vm.fetchAllRecording()
                            showingList.toggle()
                        }) {
                            Image(systemName: "list.bullet")
                                .foregroundColor(.black)
                                .font(.system(size: 20, weight: .bold))
                                .frame(alignment: .trailing)
                        }.sheet(isPresented: $showingList, content: {
                            recordingListView()
                        })
                        Text("목록")
                    }
                    
                    .padding(.bottom,40)
                    HStack{
                        
                        Button(action: {
                            if vm.isRecording == true {
                                vm.stopRecording()
                            }
                            vm.fetchAllRecording()
                            showingList.toggle()
                        }) {
                        }
                    }
                    .padding(.bottom,40)
                    
                    
                    
                    Spacer()
                    
                    if vm.isRecording {
                        
                        VStack(alignment : .leading , spacing : -5){
                            HStack (spacing : 3) {
                                Image(systemName: vm.isRecording && vm.toggleColor ? "circle.fill" : "circle")
                                    .font(.system(size:10))
                                    .foregroundColor(.red)
                                Text("Rec")
                            }
                            Text(vm.timer)
                                .font(.system(size:60))
                                .foregroundColor(.black)
                        }
                        
                    } else {
                        VStack{
                            Text("노래를 녹음해주세요")
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                                .font(.system(size:20))
                        }.frame(width: 300, height: 100, alignment: .center)
                        
                        
                    }
                    
                    Spacer()
                    Spacer()
                    
                    ZStack {
                        
                        Circle()
                            .frame(width: 70, height: 70)
                            .foregroundColor(Color(#colorLiteral(red: 0.4157493109, green: 0.8572631, blue: 0.9686274529, alpha: 0.4940355314)))
                        
                        Circle()
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
                        
                        
                        Image(systemName: vm.isRecording ? "stop.circle.fill" : "mic.circle.fill")
                        
                            .foregroundColor(.white)
                            .font(.system(size: 45))
                            .onTapGesture {
                                if vm.isRecording == true {
                                    vm.stopRecording()
                                } else {
                                    vm.startRecording()
                                    
                                }
                            }
                        
                    }
                    .padding(.bottom,100)
                    
                    
                    
                    Spacer()
                    
                }
                .padding(.leading,25)
                .padding(.trailing,25)
                .padding(.top , 70)
            }
        }
    }
    
}

struct RecordView_Previews: PreviewProvider {
    static var previews: some View {
        RecordView()
    }
}
