//
//  MonthData.swift
//
//
//  Created by Yuki Kuwashima on 2024/06/14.
//

import Foundation

struct MonthData: Identifiable, Hashable {

    var id: String {
        String(year) + String(month)
    }
    var year: Int
    var month: Int

    func getNext() -> Self {
        switch month {
        case 12:
            MonthData(year: year + 1, month: 1)
        default:
            MonthData(year: year, month: month + 1)
        }
    }

    func getPrev() -> Self {
        switch month {
        case 1:
            MonthData(year: year - 1, month: 12)
        default:
            MonthData(year: year, month: month - 1)
        }
    }
}
