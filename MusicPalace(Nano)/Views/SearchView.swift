//
//  SearchView.swift
//  MusicPalace(Nano)
//
//  Created by Yoonjae on 2022/04/30.
//

import SwiftUI
import CoreData

struct SearchView: View {
    
    @State var searchText: String = ""
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: TaskData.entity(), sortDescriptors: [NSSortDescriptor(key: "dateCreated", ascending: true)])
    private var allTasks: FetchedResults<TaskData>
    
    var body: some View {
        NavigationView {
            VStack{
                List {
                    ForEach(allTasks) { task in
                        VStack {
                            HStack {
                                Text(task.singer ?? "")
                                Text(task.title ?? "")
                                    
                            }
                        }
                    }
                }
                
                .navigationBarTitle( Text("음악 및 가수 검색"), displayMode: .automatic)
            }
            
        }
            .searchable(text: $searchText,
                        placement: .navigationBarDrawer(displayMode: .always),
                        prompt: "음악 및 가수를 검색해주세요")
            .onChange(of: searchText) { newValue in
                        search(text: newValue)
                    }
                
    }
    private func search(text: String) {
            if text.isEmpty {
                allTasks.nsPredicate = nil
            } else {
                let titlePredicate: NSPredicate = NSPredicate(format: "title contains %@", text)
                let singerPredicate: NSPredicate = NSPredicate(format: "singer contains %@", text)
                allTasks.nsPredicate = NSCompoundPredicate(orPredicateWithSubpredicates: [titlePredicate, singerPredicate])
            }
        }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

