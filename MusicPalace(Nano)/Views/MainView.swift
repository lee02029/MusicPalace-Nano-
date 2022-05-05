//
//  MainView.swift
//  MusicPalace(Nano)
//
//  Created by Yoonjae on 2022/04/30.
//

import SwiftUI
import Foundation

struct MainView: View {
    @State var singer : String = ""
    @State var title : String  = ""
    @State private var recordButton = false
    var genres = ["발라드","댄스","팝","인디","락","힙합"]
    @State private var selectedGenre = "발라드"
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: TaskData.entity(), sortDescriptors: [NSSortDescriptor(key: "dateCreated", ascending: true)])
    private var allTasks: FetchedResults<TaskData>
    var currentMainDate: Date = Date()
    
    private func saveTask() {
        
        do {
            let task = TaskData(context: viewContext)
            task.singer = singer
            task.title = title
            task.genre = selectedGenre
            task.dateCreated = currentMainDate
            try viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }

    private func deleteTask(at offsets: IndexSet) {
        offsets.forEach { index in
            let task = allTasks[index]
            viewContext.delete(task)
            do {
                try viewContext.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    HStack {
                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                
                                Text("가수")
                                    .font(.system(size: 16))
                                TextField("가수를 입력하세요", text: $singer)
                                    .disableAutocorrection(true)
                                    .autocapitalization(.none)
                                    .cornerRadius(3)
                                    .padding(.leading,20)
                                    .textFieldStyle(.roundedBorder)
                                    .font(.system(size: 14))
                            }
                            HStack {
                                Text("제목")
                                    .font(.system(size: 16))
                                TextField("제목를 입력하세요", text: $title)
                                    .disableAutocorrection(true)
                                    .autocapitalization(.none)
                                    .cornerRadius(3)
                                    .padding(.leading,20)
                                    .textFieldStyle(.roundedBorder)
                                    .font(.system(size: 14))
                                    
                            }
                            HStack {
                                Text("장르")
                                    .font(.system(size: 16))
                                
                                Image(systemName: "scroll")
                                    .padding(.leading,20)
                                Picker("원하는 장르를 선택하세요",selection: $selectedGenre) {
                                    ForEach(genres, id: \.self) {
                                        Text($0)
                                    }
                                    
                                }
                                
                            }
                        }
                        
                        .padding()
                        ZStack {
                            Button(action: {
                                saveTask()
                            }, label: {
                                Image(systemName: "square.fill")
                                    .font(.system(size: 70))
                                    .foregroundColor(Color("lightGray"))
                            })
                            Image(systemName: "arrow.down")
                                .font(.system(size: 36))
                                .foregroundColor(Color("Gray"))
                        }
                    }
                    Spacer()
                    Divider()
                    List {
                        Section(header: Text("\(Date().toString(dateFormat: "YYYY-MM-dd"))")) {
                            ForEach(allTasks) { task in
                                HStack {
                                    Image(systemName:"headphones")
                                        .font(.system(size:50))
                                        .foregroundColor(.black)
                                    VStack(alignment:.leading) {
                                        Text(task.title ?? "")
                                            .padding(.bottom,4)
                                        Text(task.singer ?? "")
                                    }
                                    Spacer()
                                    VStack {
                                        
                                        Button(action: {
                                            SoundSetting.instance.playSound(sound: .Click)
                                        }) {
                                            ZStack {
                                                Image(systemName: "rectangle.fill")
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(width: 60, height: 20)
                                                    .foregroundColor(Color("Gray"))
                                                Text(task.genre ?? "")
                                                    .foregroundColor(.white)
                                            }
                                            
                                        }
                                    }
                                }
                                
                            }.onDelete(perform: deleteTask)
                        }
                    }
                    
                    .padding()
                    
                }
                
            }
            
            .navigationBarTitle("Music Palace", displayMode: .inline)
        }
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
