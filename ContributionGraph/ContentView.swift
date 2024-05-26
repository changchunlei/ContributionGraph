//
//  ContentView.swift
//  ContributionGraph
//
//  Created by clc on 26/5/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var currentDate = Date()
    var body: some View {
        VStack {
            MultiMonthCalendarView(currentDate: .constant(currentDate))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
