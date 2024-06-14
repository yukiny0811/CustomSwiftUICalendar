//
//  DayCell.swift
//
//
//  Created by Yuki Kuwashima on 2024/06/11.
//

import Foundation

struct DayCell: Identifiable, Equatable, Hashable {

    let id: String = UUID().uuidString
    let day: Int
    
    init(day: Int) {
        self.day = day
    }
}

extension [DayCell]: Identifiable {
    public var id: String {
        self.reduce("") { partialResult, dayCell in
            return partialResult + String(dayCell.day)
        }
    }
}
