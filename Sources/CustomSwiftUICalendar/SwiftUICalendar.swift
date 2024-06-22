//
//  SwiftUICalendar.swift
//
//
//  Created by Yuki Kuwashima on 2024/06/10.
//

import SwiftUI

public struct SwiftUICalendar<Cell: View>: View {

    let year: Int
    let month: Int
    let startsFromMonday: Bool

    let cellView: (_ year: Int, _ month: Int, _ day: Int, _ cellWidth: CGFloat, _ cellHeight: CGFloat) -> Cell

    let chunkedCellDayArray: [[DayCell]]

    public init(
        year: Int,
        month: Int,
        startsFromMonday: Bool,
        @ViewBuilder cellView: @escaping (_ year: Int, _ month: Int, _ day: Int, _ cellWidth: CGFloat, _ cellHeight: CGFloat) -> Cell
    ) {
        self.year = year
        self.month = month
        self.cellView = cellView
        self.startsFromMonday = startsFromMonday
        let cellDayArray = CalendarUtil.getDayArrayForCalendar(year: year, month: month, startsFromMonday: startsFromMonday)
        self.chunkedCellDayArray = CalendarUtil.chunkTo6Rows(
            array: cellDayArray
        ).map {
            $0.map {
                DayCell(day: $0)
            }
        }
    }

    public var body: some View {
        GeometryReader { reader in
            let width = reader.size.width
            let height = reader.size.height
            VStack(spacing: 0) {
                ForEach(chunkedCellDayArray) { row in
                    HStack(spacing: 0) {
                        ForEach(row) { dayCell in
                            cellView(year, month, dayCell.day, width / 7, height / 6)
                                .frame(width: width / 7, height: height / 6)
                                .clipped()
                        }
                    }
                    .frame(width: width, height: height / 6)
                }
            }
            .frame(width: width, height: height)
        }
    }
}
