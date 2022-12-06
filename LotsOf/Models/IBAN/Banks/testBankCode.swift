//
//  testBankCode.swift
//  LotsOfUrlSessionsTests
//
//  Created by Adrian Iraizos Mendoza on 30/11/22.
//

import XCTest
@testable import LotsOfUrlSessions

final class testBankCode: XCTestCase {
    
    func testCanGetFilePath() throws {
        let sut = BankProvider()
       
        XCTAssertNotNil(sut.getFilePath())
    }
    
    func testCanGetJsonFromFile() throws {
        let sut = BankProvider()
       
        XCTAssertNotNil(sut.getJsonDataFrom(filePath: sut.getFilePath()))
    }
    
    func testCanFetchJson() throws {
        let sut = BankProvider()
        
        sut.fetch()
        print(sut.banks)
        XCTAssertNotNil(sut.banks)
        XCTAssertEqual(sut.banks[0].code, 2080)
        
    }
    
    func testCanDecodeJson() throws {
       
         let json = """
[{"code":2103,"name":"UNICAJA BANCO"},
{"code":6611,"name":"VIDA CAIXA"}]
"""
        let jsonData = json.data(using: .utf8)!
        let bankData = try! JSONDecoder().decode([Bank].self, from: jsonData)
        XCTAssertEqual(bankData[0].code, 2103)
        XCTAssertEqual(bankData[1].name, "VIDA CAIXA")
    }
    
  
}
