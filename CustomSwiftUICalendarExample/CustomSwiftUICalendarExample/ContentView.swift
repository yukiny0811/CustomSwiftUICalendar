//
//  ContentView.swift
//  CustomSwiftUICalendarExample
//
//  Created by Yuki Kuwashima on 2024/06/08.
//

import SwiftUI
import CustomSwiftUICalendar

struct ContentView: View {

    @State var year = 2024
    @State var month = 6

    var body: some View {
        NavigationStack {
            SwiftUICalendarHorizontalScroll(
                year: $year,
                month: $month,
                startsFromMonday: true
            ){ year, month, day, cellWidth, cellHeight in
                Text(day == 0 ? "" : String(day))
            }
            .navigationTitle(String(format: "%04d", year) + " " + String(format: "%02d", month))
        }
    }
}
