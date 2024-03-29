//
//  CustomDatePickerView.swift
//  MusicPalace(Nano)
//
//  Created by Yoonjae on 2022/04/30.
//

import SwiftUI
import Foundation

struct CustomDatePicker: View {
    @Binding var currentDate: Date
    @State var currentMonth: Int = 0
    
    var body: some View {
        VStack(spacing: 35){
            let days: [String] = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"]
            HStack(spacing: 20){
                VStack(alignment: .leading, spacing: 10) {
                    Text(extraDate()[0])
                        .font(.caption)
                        .fontWeight(.semibold)
                    Text(extraDate()[1])
                        .font(.title.bold())
                }
                
                Spacer(minLength: 0)
                Button {
                        currentMonth -= 1
                    
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                }

                Button {
                        currentMonth += 1
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title2)
                }
            }
            .padding(.horizontal)
            
            HStack(spacing: 0){
                ForEach(days,id: \.self){day in
                    
                    Text(day)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                }
            }
            
            let columns = Array(repeating: GridItem(.flexible()), count: 7)
            LazyVGrid(columns: columns,spacing: 15) {
                ForEach(extractDate()){value in
                    CardView(value: value)
                        .background(
                            Capsule()
                                .fill(Color("Pink"))
                                .padding(.horizontal,8)
                                .opacity(isSameDay(date1: value.date, date2: currentDate) ? 1 : 0)
                        )
                        .onTapGesture {
                            currentDate = value.date
                        }
                }
            }
            
            VStack(spacing: 5){
                Text("Palace")
                    .font(.title2.bold())
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.vertical,20)
                
                if let task = tasks.first(where: { task in
                    return isSameDay(date1: task.taskDate, date2: currentDate)
                }){
                    ForEach(task.task){task in
                        
                        VStack(alignment: .leading) {
                            HStack {
                                Image(systemName:"headphones")
                                    .font(.system(size:40))
                                    .foregroundColor(.black)
                                    .padding()
                                Text(task.title)
                            }
                            .padding(.trailing,10)
                            
                        }
                        
                        .padding(.vertical,5)
                        .frame(maxWidth: .infinity,alignment: .leading)
                    }
                }
                else{
                    Text("No Task Found")
                }
            }
            .padding()
        }
        .onChange(of: currentMonth) { newValue in
            
            // updating Month...
            currentDate = getCurrentMonth()
        }
    }
    
    @ViewBuilder
    func CardView(value: DateValue)->some View{
        VStack{
            if value.day != -1{
                if let task = tasks.first(where: { task in
                    return isSameDay(date1: task.taskDate, date2: value.date)
                }){
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(isSameDay(date1: task.taskDate, date2: currentDate) ? .white : .primary)
                        .frame(maxWidth: .infinity)
                    Spacer()
                    Circle()
                        .fill(isSameDay(date1: task.taskDate, date2: currentDate) ? .white : Color("Pink"))
                        .frame(width: 8,height: 8)
                }
                else{
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(isSameDay(date1: value.date, date2: currentDate) ? .white : .primary)
                        .frame(maxWidth: .infinity)
                    Spacer()
                }
            }
        }
        .padding(.vertical,9)
        .frame(height: 60,alignment: .top)
    }
    // 날짜가 같은지 판단(참, 거짓 유무 확인)
    func isSameDay(date1: Date, date2: Date)->Bool{
        let calendar = Calendar.current
        return calendar.isDate(date1, inSameDayAs: date2)
    }
    
    func extraDate()->[String]{
        let calendar = Calendar.current
        let month = calendar.component(.month, from: currentDate) - 1
        let year = calendar.component(.year, from: currentDate)
        
        return ["\(year)",calendar.monthSymbols[month]]
    }
    
    func getCurrentMonth()->Date{
        let calendar = Calendar.current
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date()) else{
            return Date()
        }
        return currentMonth
    }
    
    func extractDate()->[DateValue]{
        let calendar = Calendar.current
        let currentMonth = getCurrentMonth()
        var days = currentMonth.getAllDates().compactMap { date -> DateValue in
            let day = calendar.component(.day, from: date)
            return DateValue(day: day, date: date)
        }
        let firstWeekday = calendar.component(.weekday, from: days.first!.date)
        for _ in 0..<firstWeekday - 1{
            days.insert(DateValue(day: -1, date: Date()), at: 0)
        }
        return days
    }
}

struct CustomDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}



