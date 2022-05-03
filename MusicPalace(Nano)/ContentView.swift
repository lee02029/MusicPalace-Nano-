//
//  ContentView.swift
//  MusicPalace(Nano)
//
//  Created by Yoonjae on 2022/04/30.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        TabView {
                MainView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("홈")
                    }
                RecordView()
                    .tabItem {
                        Image(systemName: "mic")
                        Text("녹음")
                    }
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("검색")
                    }
                CalendarView()
                    .tabItem {
                        Image(systemName: "calendar")
                        Text("달력")
                    }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


