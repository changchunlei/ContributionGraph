//
//  HelperTests.swift
//  ContributionGraphTests
//
//  Created by clc on 26/5/2024.
//


import XCTest
@testable import ContributionGraph

class HelperTests: XCTestCase {

    func testNormalize() {
        let value = 10
        let maxValue = 100
        let expectedOutput = log10(Double(value) + 1) / log10(Double(maxValue) + 1)
        XCTAssertEqual(normalize(value: value, maxValue: maxValue), expectedOutput)
    }

    func testValueForDate() {
        let date = Date()
        let datesData: [Date: Int] = [date: 5]
        XCTAssertEqual(valueForDate(date, in: datesData), 5)
    }

    func testMonthName() {
        let monthNumber = "5"
        let expectedOutput = DateFormatter().shortStandaloneMonthSymbols[4] // May
        XCTAssertEqual(monthName(from: monthNumber), expectedOutput)
    }
    
    func testNormalizeWithZeroMaxValue() {
        let value = 10
        let maxValue = 0
        let expectedOutput = Double.infinity
        XCTAssertEqual(normalize(value: value, maxValue: maxValue), expectedOutput)
    }

    func testValueForDateWithEmptyDatesData() {
        let date = Date()
        let datesData: [Date: Int] = [:]
        XCTAssertEqual(valueForDate(date, in: datesData), 0)
    }
    
    func testMonthNameWithInvalidNumberString() {
        let monthNumber = "invalid"
        XCTAssertEqual(monthName(from: monthNumber), "Invalid month number")
    }

    func testMonthNameWithOutOfRangeNumberString() {
        let monthNumber = "13"
        XCTAssertEqual(monthName(from: monthNumber), "Invalid month number")
    }

    func testIsSameDay() {
        let date1 = Date()
        let date2 = Date()
        XCTAssertTrue(isSameDay(date1: date1, date2: date2))
    }

    func testGetAllDates() {
        let date = Date()
        let allDates = date.getAllDates()
        XCTAssertNotNil(allDates)
        XCTAssertTrue(allDates.count > 0)
    }
    
}
