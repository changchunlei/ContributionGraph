//
//  Helper.swift
//  ContributionGraph
//
//  Created by clc on 26/5/2024.
//

import Foundation


extension Date {
    func getAllDates() -> [Date] {
        let calendar = Calendar.current

        guard let startDate = calendar.date(from: Calendar.current.dateComponents([.year, .month], from: self)) else {
            return []
        }

        guard let range = calendar.range(of: .day, in: .month, for: startDate) else {
            return []
        }

        return range.compactMap { day -> Date in
            return calendar.date(byAdding: .day, value: day - 1, to: startDate)!
        }
    }
}


// MARK: - Helper for log the scale for better visualization
func normalize(value: Int, maxValue: Int) -> Double {
    let logValue = log10(Double(value) + 1)
    let logMaxValue = log10(Double(maxValue) + 1)
    return logValue / logMaxValue
}

func valueForDate(_ date: Date, in datesData: [Date: Int]) -> Int {
    return datesData.first(where: { isSameDay(date1: $0.key, date2: date) })?.value ?? 0
}

func monthName(from numberString: String) -> String {
    guard let number = Int(numberString) else {
        return "Invalid month number"
    }
    let formatter = DateFormatter()
    if number >= 1 && number <= 12 {
        let monthName = formatter.shortStandaloneMonthSymbols[number - 1] // shortStandaloneMonthSymbols is 0-indexed
        return monthName
    } else {
        return "Invalid month number"
    }
}

func isSameDay(date1: Date, date2: Date)-> Bool{
    let calendar = Calendar.current
    return calendar.isDate(date1, inSameDayAs: date2)
}

