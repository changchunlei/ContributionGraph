//
//  ContributionGraphView.swift
//  ContributionGraph
//
//  Created by clc on 26/5/2024.
//


import SwiftUI

struct CustomDatePickerView: View {
    @Binding var currentDate: Date
    @State var currentMonth: Int = 0
    var currentYearAndMonth: [String] {
        let calendar = Calendar.current
        let date = calendar.date(byAdding: .month, value: currentMonth, to: currentDate) ?? Date()
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        return ["\(year)", "\(month)"]
    }
    
    var body: some View {
        VStack(spacing: 3) {
            VStack {
                ZStack {
                        VStack(alignment: .leading, spacing: 1) {
                            Text(monthName(from: currentYearAndMonth[1]))
                        }
                        .font(.caption)
                        .rotationEffect(.degrees(90))
                        .opacity(0.3)
                        .offset(x: Constants.defaultOffsetX, y: Constants.defaultOffsetY)

                    let columns = Array(repeating: GridItem(.flexible()), count: Constants.defaultGridColumns)
                    VStack {
                        LazyVGrid(columns: columns, spacing: 1) {
                            ForEach(extractDatesForCurrentMonth()) { value in
                                VStack(spacing: 1) {
                                    calendarCardView(value: value, count: valueForDate(value.date, in: calData.submissionDatesAsDates), max: calData.maxSubmissionValue)
                                }
                            } //  ForEach
                        }
                    } //  VStack
                } //  ZStack
                .rotationEffect(.degrees(Constants.defaultRotationDegrees))
                .frame(width: Constants.defaultFrameWidth, height: Constants.defaultFrameHeight)
            } //  VStack
        } //  body
    } //  CustomDatePickerView
    
    @ViewBuilder
    func calendarCardView(value: DateValue, count: Int, max: Int) -> some View {
        let normalizedValue = normalize(value: count, maxValue: max)
        
        VStack {
            if value.day != -1 {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: Constants.defaultRectangleWidth, height: Constants.defaultRectangleHeight)
                        .background(normalizedValue == 0 ? Color.gray.opacity(Constants.defaultOpacity) : Color.green.opacity(normalizedValue))
                        .cornerRadius(2)
                
            } // if
        } // VStack
        .frame(width: Constants.defaultCardWidth, height: Constants.defaultCardHeight)
    } // CalCardView function
    
    
    func getCurrentMonth()->Date{
        let calendar = Calendar.current
        
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date()) else {
            return Date()
        }
        
        return currentMonth
    }


    func extractDatesForCurrentMonth() -> [DateValue] {
        let calendar = Calendar.current
        let currentMonth = getCurrentMonth()
        
        var days = currentMonth.getAllDates().compactMap { date -> DateValue in
            let day = calendar.component(.day, from: date)
            return DateValue(day: day, date: date)
        }
        
        let firstWeekday = calendar.component(.weekday, from: days.first?.date ?? Date())
        for _ in 0..<firstWeekday - 1 {
            days.insert(DateValue(day: -1, date: Date()), at: 0)
        }
        
        return days
    } // extractDate func

}



struct ContributionGraphView_Previews: PreviewProvider {
    static var currentDate: Date = Date()

    static var previews: some View {
        MultiMonthCalendarView(currentDate: .constant(currentDate))
    }
} // preview
