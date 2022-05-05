//
//  CalendarView.swift
//  MusicPalace(Nano)
//
//  Created by Yoonjae on 2022/04/30.
//

import SwiftUI

struct CalendarView: View {
    
    @State var currentDate: Date = Date()
    
    var body: some View {
        
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing: 20){
                    CustomDatePicker(currentDate: $currentDate)
                }
                .padding(.vertical)
            }
            .safeAreaInset(edge: .bottom) {
                
                HStack{
                }
                .padding(.horizontal)
                .foregroundColor(.white)
                .background(.ultraThinMaterial)
            }
        }
        .padding()
        
        
    }
        
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
