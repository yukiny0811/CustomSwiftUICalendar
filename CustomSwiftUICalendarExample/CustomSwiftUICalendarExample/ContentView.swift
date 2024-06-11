//
//  ContentView.swift
//  CustomSwiftUICalendarExample
//
//  Created by Yuki Kuwashima on 2024/06/08.
//

import SwiftUI
import CustomSwiftUICalendar

struct ContentView: View {
    var body: some View {
        NavigationStack {
            CustomSwiftUICalendar(year: 2024, month: 9, startsFromMonday: true) { year, month, day, cellWidth, cellHeight in
                switch day {
                case 0:
                    Text("")
                case 1:
                    VStack {
                        Text(String(Int(cellHeight)))
                    }
                    .frame(width: cellWidth, height: cellHeight)
                    .background(.red)
                case 15:
                    VStack {
                        Text(String(Int(cellHeight)))
                    }
                    .frame(width: cellWidth, height: cellHeight)
                    .background(.red)
                case 30:
                    VStack {
                        Text(String(day))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.red)
                default:
                    VStack {
                        Text(String(day))
                        Text("aaa")
                    }
                }
            }
            .navigationTitle("Test")
        }
    }
}

#Preview {
    ContentView()
}
