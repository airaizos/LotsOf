//
//  TestDataPersistanceViewModel.swift
//  LotsOfUrlSessionsTests
//
//  Created by Adrian Iraizos Mendoza on 24/11/22.
//

import XCTest
@testable import LotsOfUrlSessions

final class TestDataPersistanceViewModel: XCTestCase {

    
    func testCanDecodeJson() throws {
        
        let json = """
        "appInfo": {
        "appInfo": [
        {
    "name": "Enum",
     "detail": "User Defaults",
     "image": "cylinder.split.1x2",
     "backgroundColor": "ffbb6c",
     "viewController": "EnumUserDefaultViewController"}]}"
    """
        let jsonData = json.data(using: .utf8)!
        let appInfo = try! JSONDecoder().decode(appInfo.self, from: jsonData)
        
        XCTAssertEqual(appInfo.name, "Enum")
        XCTAssertEqual(appInfo.backgroundColor, "ffbb6c")
        
    }
    
    func testCanFetchApps() throws {
        let sut = DataPersistanceViewModel()
        
        sut.provider.fetch()
        
        XCTAssertTrue(sut.provider.apps.count > 0)
      //  XCTAssertEqual(sut.provider.apps[0].name,"Enum")
        
    }
    
}
