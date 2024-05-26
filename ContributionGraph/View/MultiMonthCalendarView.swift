//
//  MultiMonthCalendarView.swift
//  ContributionGraph
//
//  Created by clc on 26/5/2024.
//

import SwiftUI

struct MultiMonthCalendarView: View {
    @Binding var currentDate: Date
    let numberOfMonths: Int = 12
    let dayColumnWidth: CGFloat = 15
    let days: [String] = ["S", "M", "T", "W", "T", "F", "S"]

    var body: some View {
        VStack {
            let submissionDates = calData.submissionDatesAsDates
             if !submissionDates.isEmpty {
                HStack {
                    daysOfWeekView
                    createCalendarScrollView(submissionDates: submissionDates)
                }
            } else {
                Text("No data")
            }
        } //  VStack
    } //  body

    var daysOfWeekView: some View {
        VStack(spacing: 3) {
            ForEach(days, id: \.self) { day in
                Text(day)
                    .font(.callout)
                    .frame(maxWidth: .infinity)
            }
        }
        .frame(width: dayColumnWidth)
    }
    
    func createCalendarScrollView(submissionDates: [Date: Int]) -> some View {
        ScrollView(.horizontal) {
            ScrollViewReader { value in
                HStack {
                    ForEach((0..<numberOfMonths).reversed(), id: \.self) { monthIndex in
                        CustomDatePickerView(currentDate: $currentDate, currentMonth: -monthIndex)
                    }
                }
                .onAppear {
                    value.scrollTo(0, anchor: .trailing)
                }
            }
        }
    }
    
}

struct MultiMonthCalendarView_Previews: PreviewProvider {
    static var currentDate: Date = Date()
    
    static var previews: some View {
        MultiMonthCalendarView(currentDate: .constant(currentDate))
    }
}
