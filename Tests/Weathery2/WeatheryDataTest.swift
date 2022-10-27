//
//  WeatheryDataTest.swift
//  LotsOfUrlSessionsTests
//
//  Created by Adrian Iraizos Mendoza on 27/10/22.
//

import XCTest
@testable import LotsOfUrlSessions

final class WeatheryDataTest: XCTestCase {
    
    func testCanParseWeather() {
        
        let json = """
            { "weather": [
                {
                    "id": 804,
                    "description": "overcast clouds",
                }
            ],
            "main": {
                "temp" : 10.58,
            },
            "name": "Calgary"
        }
        """
        let jsonData = json.data(using: .utf8)!
        let weatherData = try! JSONDecoder().decode(WeatherData.self, from: jsonData)

        XCTAssertEqual(weatherData.name, "Calgary")
        XCTAssertEqual(weatherData.main.temp, 10.58)
        XCTAssertEqual(804, weatherData.weather.first!.id)
        XCTAssertEqual("overcast clouds", weatherData.weather.first!.description)
        XCTAssertEqual("Calgary", weatherData.name)
    }
    
    func testCanParseWeatherWithEmptyCityName() {
        
        let json = """
            { "weather": [
                {
                    "id": 804,
                    "description": "overcast clouds",
                }
            ],
            "main": {
                "temp" : 10.58,
            },
            "name": ""
        }
        """
        let jsonData = json.data(using: .utf8)!
        let weatherData = try! JSONDecoder().decode(WeatherData.self, from: jsonData)

        XCTAssertEqual(weatherData.name, "")
        XCTAssertEqual(weatherData.main.temp, 10.58)
        XCTAssertEqual(804, weatherData.weather.first!.id)
        XCTAssertEqual("overcast clouds", weatherData.weather.first!.description)
    }
    
    func testCanParseWeatherViaJSONFile() throws {

        guard let filePath = Bundle.main.path(forResource: "Weather", ofType: "json") else {  fatalError("FILE PATH not Found") }

        guard let json = try? String(contentsOfFile: filePath, encoding: .utf8) else { fatalError("Unable to convert json to String") }
 
            let jsonData = json.data(using: .utf8)!
        
            let weatherData = try! JSONDecoder().decode(WeatherData.self, from: jsonData)
            
            XCTAssertEqual(weatherData.name, "Calgary")
            XCTAssertEqual(weatherData.main.temp, 10.58)
    }
}
