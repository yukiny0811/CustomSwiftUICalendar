//
//  CalendarUtil.swift
//
//
//  Created by Yuki Kuwashima on 2024/06/10.
//

import Foundation

enum CalendarUtil {

    static func getDayArrayForCalendar(year: Int, month: Int, startsFromMonday: Bool) -> [Int] {
        let calendar = Calendar.current
        var components = DateComponents(year: year, month: month)
        components.day = 1

        guard let firstDayOfMonth = calendar.date(from: components) else {
            return []
        }

        guard let rangeOfDays = calendar.range(of: .day, in: .month, for: firstDayOfMonth) else {
            return []
        }

        let numberOfDays = rangeOfDays.count
        let firstWeekday = calendar.component(.weekday, from: firstDayOfMonth)

        // 月曜始まりの場合、日曜を7から0に調整
        let adjustedFirstWeekday = startsFromMonday ? (firstWeekday == 1 ? 6 : firstWeekday - 2) : firstWeekday - 1

        var dayArray = [Int](repeating: 0, count: 42)

        for day in 1...numberOfDays {
            let index = adjustedFirstWeekday + day - 1
            dayArray[index] = day
        }

        return dayArray
    }

    static func chunkTo6Rows(array: [Int]) -> [[Int]] {
        var result: [[Int]] = [[]]
        for (i, elem) in array.enumerated() {
            if i.isMultiple(of: 7) && i != 0 {
                result.append([])
            }
            result[result.count-1].append(elem)
        }
        return result
    }
}
