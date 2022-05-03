//
//  MusicPalace_Nano_App.swift
//  MusicPalace(Nano)
//
//  Created by Yoonjae on 2022/04/30.
//

import SwiftUI

@main
struct MusicPalace_Nano_App: App {
    let persistenceController = CoreDataManger.shared.persistentContainer
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.viewContext)
            
        }
    }
}

