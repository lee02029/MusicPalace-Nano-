//
//  CoreDataManger.swift
//  MusicPalace(Nano)
//
//  Created by Yoonjae on 2022/04/30.
//

import Foundation
import CoreData

class CoreDataManger {
    let persistentContainer: NSPersistentContainer
    static let shared: CoreDataManger = CoreDataManger()
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "MusicPalaceModel")
        persistentContainer.loadPersistentStores{description, error in
            if let error = error {
                fatalError("Unable to initialize Core Data \(error)")
            }
        }
    }
}
