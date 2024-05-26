//
//  CalendarDate.swift
//  ContributionGraph
//
//  Created by clc on 26/5/2024.
//

import Foundation

struct Constants {
    static let defaultFrameWidth: CGFloat = 152
    static let defaultFrameHeight: CGFloat = 160
    static let defaultRectangleWidth: CGFloat = 20
    static let defaultRectangleHeight: CGFloat = 20
    static let defaultCardWidth: CGFloat = 22
    static let defaultCardHeight: CGFloat = 22
    static let defaultOpacity: Double = 0.1
    static let defaultOffsetX: CGFloat = -65
    static let defaultOffsetY: CGFloat = -50
    static let defaultRotationDegrees: Double = -90
    static let defaultGridColumns: Int = 7
}

struct DateValue: Identifiable{
    let id = UUID()
    var day: Int
    var date: Date
    
}

struct SubmissionCalendar: Codable {
    let submissionDates: [Int: Int]
    
    var maxSubmissionValue: Int {
        return submissionDatesAsDates.values.max() ?? 0
    }
    
    var submissionDatesAsDates: [Date: Int] {
        var dates = [Date: Int]()
        for (timestamp, value) in submissionDates {
            let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
            dates[date] = value
        }
        return dates
    }
}

let data = [
    1685404800: 1, 1711929600: 6, 1713484800: 9, 1716422400: 3, 1698105600: 1, 1685750400: 1, 1685491200: 1, 1716076800: 1, 1710201600: 4, 1699574400: 3, 1714348800: 7, 1714003200: 1, 1685145600: 1, 1712016000: 1, 1713571200: 2, 1696723200: 3, 1713744000: 3, 1709856000: 1, 1710720000: 8, 1714694400: 2, 1714435200: 2, 1691193600: 1, 1712188800: 1, 1712793600: 4, 1711843200: 2, 1714953600: 3, 1715126400: 1, 1699488000: 4, 1685836800: 1, 1715299200: 7, 1716163200: 1, 1715644800: 1, 1711497600: 1, 1712275200: 2, 1711238400: 1, 1715990400: 1, 1711324800: 1, 1685664000: 2, 1714521600: 6, 1710288000: 4, 1711756800: 2, 1710115200: 2, 1686355200: 3, 1715212800: 17, 1714089600: 4, 1713398400: 1, 1710547200: 2, 1713830400: 8, 1710028800: 6, 1712361600: 2, 1710806400: 6, 1712966400: 2, 1710633600: 4, 1699747200: 2, 1709596800: 9, 1686268800: 3, 1714262400: 5, 1710460800: 8, 1713916800: 1, 1715385600: 8, 1686182400: 1, 1715472000: 2, 1686096000: 5, 1685232000: 3, 1689206400: 1, 1699833600: 4, 1704326400: 4, 1714176000: 2, 1713657600: 6, 1712102400: 1, 1685059200: 2
]

var calData = SubmissionCalendar(submissionDates: data)
