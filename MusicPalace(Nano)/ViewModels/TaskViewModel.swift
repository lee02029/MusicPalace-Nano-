//
//  TaskViewModel.swift
//  MusicPalace(Nano)
//
//  Created by Yoonjae on 2022/04/30.
//

import SwiftUI

// sample Date for Testing...
func getSampleDate(offset: Int)->Date{
    let calender = Calendar.current
    
    let date = calender.date(byAdding: .day, value: offset, to: Date())
    
    return date ?? Date()
}

var tasks: [TaskMetaData] = [

    TaskMetaData(task: [
    
        Task(title: "펀치넬로\nfine! "),
        Task(title: "Crush\n자나깨나")
    ], taskDate: getSampleDate(offset: -1)),
    TaskMetaData(task: [
        
        Task(title: "nov\n부재중")
    ], taskDate: getSampleDate(offset: -3)),
    TaskMetaData(task: [
        
        Task(title: "Gist\n사랑해줄래")
    ], taskDate: getSampleDate(offset: -8)),
    TaskMetaData(task: [
        
        Task(title: "김뮤지엄\nPont Alexandre iii")
    ], taskDate: getSampleDate(offset: -10)),
    TaskMetaData(task: [
        
        Task(title: "기리보이\n 그땐 어렸으니까")
    ], taskDate: getSampleDate(offset: -22)),
    TaskMetaData(task: [
        
        Task(title: "강서빈, RAINUD\nEyes on me ")
    ], taskDate: getSampleDate(offset: -15)),
    TaskMetaData(task: [
        
        Task(title: "아이유(IU)\n어푸(Ah puh)")
    ], taskDate: getSampleDate(offset: -20)),
]

