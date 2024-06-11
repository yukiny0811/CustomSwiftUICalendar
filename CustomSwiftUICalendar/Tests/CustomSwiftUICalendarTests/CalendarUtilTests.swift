//
//  File.swift
//  
//
//  Created by Yuki Kuwashima on 2024/06/10.
//

import XCTest
@testable import CustomSwiftUICalendar

class CalendarUtilTests: XCTestCase {

    func testCalendarRowCount_202406_sunStart() throws {
        let year: Int = 2024
        let month: Int = 6
        let array = CalendarUtil.getDayArrayForCalendar(year: year, month: month, startsFromMonday: false)

        var resultString = ""
        for (i, elem) in array.enumerated() {
            if i.isMultiple(of: 7) {
                print("\n", terminator: "")
                resultString += "\n"
            }
            print(String(format: "%02d ", elem), terminator: "")
            resultString += String(format: "%02d ", elem)
        }

        let expectedResultString =
"""
00 00 00 00 00 00 01
02 03 04 05 06 07 08
09 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28 29
30 00 00 00 00 00 00
"""

        let resultStringProcessedForTest = resultString.replacingOccurrences(of: "\n", with: "").replacingOccurrences(of: " ", with: "")
        let expectedResultStringProcessedForTest = expectedResultString.replacingOccurrences(of: "\n", with: "").replacingOccurrences(of: " ", with: "")
        XCTAssertEqual(resultStringProcessedForTest, expectedResultStringProcessedForTest)
    }

    func testCalendarRowCount_202406_monStart() throws {
        let year: Int = 2024
        let month: Int = 6
        let array = CalendarUtil.getDayArrayForCalendar(year: year, month: month, startsFromMonday: true)

        var resultString = ""
        for (i, elem) in array.enumerated() {
            if i.isMultiple(of: 7) {
                print("\n", terminator: "")
                resultString += "\n"
            }
            print(String(format: "%02d ", elem), terminator: "")
            resultString += String(format: "%02d ", elem)
        }

        let expectedResultString =
"""
00 00 00 00 00 01 02
03 04 05 06 07 08 09
10 11 12 13 14 15 16
17 18 19 20 21 22 23
24 25 26 27 28 29 30
00 00 00 00 00 00 00
"""

        let resultStringProcessedForTest = resultString.replacingOccurrences(of: "\n", with: "").replacingOccurrences(of: " ", with: "")
        let expectedResultStringProcessedForTest = expectedResultString.replacingOccurrences(of: "\n", with: "").replacingOccurrences(of: " ", with: "")
        XCTAssertEqual(resultStringProcessedForTest, expectedResultStringProcessedForTest)
    }

    func testChunkTo6Rows() throws {
        let array = CalendarUtil.getDayArrayForCalendar(year: 2024, month: 6, startsFromMonday: true)
        let chunked = CalendarUtil.chunkTo6Rows(array: array)
        let expected: [[Int]] = [
            [0, 0, 0, 0, 0, 1, 2],
            [3, 4, 5, 6, 7, 8, 9],
            [10, 11, 12, 13, 14, 15, 16],
            [17, 18, 19, 20, 21, 22, 23],
            [24, 25, 26, 27, 28, 29, 30],
            [0, 0, 0, 0, 0, 0, 0]
        ]
        XCTAssertEqual(chunked, expected)
    }
}
