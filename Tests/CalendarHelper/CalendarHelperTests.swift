//
//  CalendarHelperTests.swift
//  LotsOfUrlSessionsTests
//
//  Created by Adrian Iraizos Mendoza on 27/10/22.
//

import XCTest
@testable import LotsOfUrlSessions

final class CalendarHelperTests: XCTestCase {

    func testMonthString() throws {
        let date = "27-10-2022"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-LL-yyyy"
        let month = dateFormatter.date(from: date)!
        let calendar = CalendarHelper()

        let testMonthString = calendar.monthString(date: month)
        XCTAssertEqual("octubre",testMonthString)
    }
    
    func testYearString() throws {
        print(Date())
        let date = "01-01-2023"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-LL-yyyy"
        let year = dateFormatter.date(from: date)!
        let calendar = CalendarHelper()
        let testYearString = calendar.yearString(date: year)
        XCTAssertEqual("2023", testYearString)
    }
    //2022-10-27 18:25:59 +0000
    func testTimeString() throws {
        let date = "2022-10-27 18:25:59"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-LL-dd HH:mm:ss"
        let time = dateFormatter.date(from: date)!
        let calendar = CalendarHelper()
        let testTimeString = calendar.timeString(date: time)
        XCTAssertEqual("18:25", testTimeString)
    }
    
    func testPlusMonth() throws {
        let date = "2022-10-27 18:25:59"
        let nextMonth = "2022-11-27 18:25:59"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-LL-dd HH:mm:ss"
        let october = dateFormatter.date(from: date)!
        let november = dateFormatter.date(from: nextMonth)!
        let calendar = CalendarHelper()
        let testPlusMonth = calendar.plusMonth(date: october)
        XCTAssertEqual(november, testPlusMonth)
    }
    
    func testMinusMonth() throws {
        let date = "2022-10-27 18:25:59"
        let previousMonth = "2022-09-27 18:25:59"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-LL-dd HH:mm:ss"
        let october = dateFormatter.date(from: date)!
        let september = dateFormatter.date(from: previousMonth)!
        let calendar = CalendarHelper()
        let testMinusMonth = calendar.minusMonth(date: october)
        
        XCTAssertEqual(september, testMinusMonth)
    }
    
    func testDaysInMonth() throws {
        let date = "2022-10-27 18:25:59"
        let date2 = "2024-02-27 18:25:59"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-LL-dd HH:mm:ss"
        let october = dateFormatter.date(from: date)!
        let febrary24 = dateFormatter.date(from: date2)!
        let calendar = CalendarHelper()
        let testDaysInMonth = calendar.daysInMonth(date: october)
        let testDaysInFebrery24 = calendar.daysInMonth(date: febrary24)
        
        let daysInOctober = 31
        let daysInFebrary2024 = 29
        XCTAssertEqual(daysInOctober, testDaysInMonth)
        XCTAssertEqual(daysInFebrary2024, testDaysInFebrery24)
    }
    
    func testDayOfMonth() throws {
        let date = "2022-10-27 18:25:59"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-LL-dd HH:mm:ss"
        let octuber27th = dateFormatter.date(from: date)!
        let calendar = CalendarHelper()
        let testDayInMonth = calendar.dayOfMonth(date: octuber27th)
        XCTAssertEqual(27, testDayInMonth)
    }
    
    
    func testFirstOfMonth() throws {
        let stringDate = "2022-10-27 18:25:59"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-LL-dd HH:mm:ss"
        let date = dateFormatter.date(from: stringDate)!
        
        let stringOctober2022 = "10-2022"
        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateFormat = "LL-yyyy"
        let october2022 = dateFormatter2.date(from: stringOctober2022)
        let calendar  = CalendarHelper()
        
        let testFirstOfMonth = calendar.firstOfMonth(date: date)
        
        XCTAssertEqual(october2022, testFirstOfMonth)
    }
    
    func testWeekDay() throws {
        let stringDate = "2022-10-27 18:25:59"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-LL-dd HH:mm:ss"
        let date = dateFormatter.date(from: stringDate)!
        let jueves = 4
        let calendar = CalendarHelper()
        let testWeekDay = calendar.weekDay(date: date)
     
        XCTAssertEqual(jueves, testWeekDay)
    }
    
}
