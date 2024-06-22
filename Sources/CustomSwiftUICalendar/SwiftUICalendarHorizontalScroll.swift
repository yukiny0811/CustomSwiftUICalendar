//
//  SwiftUICalendarHorizontalScroll.swift
//
//
//  Created by Yuki Kuwashima on 2024/06/12.
//

import SwiftUI

public struct SwiftUICalendarHorizontalScroll<Cell: View>: View {

    @State var monthData: MonthData? = nil

    @Binding var year: Int
    @Binding var month: Int

    let startsFromMonday: Bool

    let yearRange = 1900..<2100

    let cellView: (_ year: Int, _ month: Int, _ day: Int, _ cellWidth: CGFloat, _ cellHeight: CGFloat) -> Cell

    public init(
        year: Binding<Int>,
        month: Binding<Int>,
        startsFromMonday: Bool,
        @ViewBuilder cellView: @escaping (_ year: Int, _ month: Int, _ day: Int, _ cellWidth: CGFloat, _ cellHeight: CGFloat) -> Cell
    ) {
        self._year = year
        self._month = month
        self.startsFromMonday = startsFromMonday
        self.cellView = cellView
    }

    public var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 0) {
                ForEach(yearRange, id: \.self) { thisYear in
                    ForEach(1..<13, id: \.self) { thisMonth in
                        SwiftUICalendar(year: thisYear, month: thisMonth, startsFromMonday: startsFromMonday) { year, month, day, cellWidth, cellHeight in
                            cellView(year, month, day, cellWidth, cellHeight)
                        }
                        .containerRelativeFrame(.horizontal, count: 1, spacing: 0)
                        .id(MonthData(year: thisYear, month: thisMonth))
                    }
                }
            }
            .scrollTargetLayout()
        }
        .scrollPosition(id: $monthData)
        .scrollTargetBehavior(.paging)
        .scrollIndicators(.hidden)
        .onAppear {
            self.monthData = MonthData(year: year, month: month)
        }
        .onChange(of: monthData) {
            if let monthData {
                self.year = monthData.year
                self.month = monthData.month
            }
        }
    }
}

#Preview {
    @State var year = 2024
    @State var month = 6
    return SwiftUICalendarHorizontalScroll(year: $year, month: $month, startsFromMonday: true) { year, month, day, cellWidth, cellHeight in
        Text(day == 0 ? "" : String(day))
    }
}
