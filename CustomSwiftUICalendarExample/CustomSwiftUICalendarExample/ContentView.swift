//
//  ContentView.swift
//  CustomSwiftUICalendarExample
//
//  Created by Yuki Kuwashima on 2024/06/08.
//

import SwiftUI
import CustomSwiftUICalendar

struct Sample1View: View {

    @State var year = 2024
    @State var month = 6

    var body: some View {
        NavigationStack {
            SwiftUICalendarHorizontalScroll(year: $year, month: $month, startsFromMonday: true){ year, month, day, cellWidth, cellHeight in

                // define your custom cell here
                Text(day == 0 ? "" : String(day))
            }
            .navigationTitle(String(format: "%04d", year) + " " + String(format: "%02d", month))
        }
    }
}

struct Sample2View: View {

    @State var year = 2024
    @State var month = 10

    var body: some View {
        NavigationStack {
            SwiftUICalendarHorizontalScroll(year: $year, month: $month, startsFromMonday: true){ year, month, day, cellWidth, cellHeight in
                VStack {
                    if day == 10 {
                        Text(String(day))
                            .font(.caption2)
                            .bold()
                            .foregroundStyle(.background)
                            .frame(width: 20, height: 20)
                            .background(.cyan.opacity(0.5))
                            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                            .padding(5)
                    } else {
                        Text(String(day))
                            .font(.caption2)
                            .bold()
                            .foregroundStyle(.foreground.opacity(0.6))
                            .frame(width: 20, height: 20)
                            .padding(5)
                    }

                    if day == 10 {
                        VStack {
                            Text("Study")
                                .font(.caption2)
                                .bold()
                                .frame(width: cellWidth)
                                .foregroundStyle(.foreground.opacity(0.6))
                                .background(.pink.opacity(0.2))
                                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 3, height: 3)))
                        }
                    }
                    Spacer()
                }
                .frame(width: cellWidth, height: cellHeight)
                .border(.black.opacity(0.2), width: 0.3)
            }
            .navigationTitle(String(format: "%04d", year) + " " + String(format: "%02d", month))
        }
    }
}

#Preview {
    Sample2View()
}
