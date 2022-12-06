//
//  BankProvider.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 30/11/22.
// file:///Users/adrian/Library/Developer/CoreSimulator/Devices/6D953E02-746B-4927-AEE3-CC1D4EDA2084/data/Containers/Data/Application/14A3824E-9609-42DC-AC3B-3EF5A04BCFE6/Documents/


import Foundation


final class BankProvider {
    
    var banks = [Bank]()
    
    func getFilePath() -> String {
        guard let filePath = Bundle.main
            .path(forResource: "bankCodes", ofType: "json") else {
            LogManager.shared.log("BankProvider: FilePath")
            return "" }
        
        return filePath
        
    }
    
    func getJsonDataFrom(filePath: String) -> Data {
        guard let json = try? String(contentsOfFile: getFilePath(), encoding: .utf8) else {
            LogManager.shared.log("BankProvider: jsonData")
            return "".data(using: .utf8)!
        }
        
        guard let jsonData = json.data(using: .utf8) else { return "".data(using: .utf8)! }
        
        print(try! JSONDecoder().decode([Bank].self, from: jsonData))
        return jsonData
    }
    
    func fetch() {
       
        do {
            let jsonData = getJsonDataFrom(filePath: getFilePath())
            let banksCodes = try JSONDecoder().decode([Bank].self, from: jsonData)
            
            self.banks = banksCodes
        } catch { LogManager.shared.log("BankProvider: Decodejson")
        }
    }
    
    func validateBank(number: Int) -> Bool {
        if number < 0 || number > 9999 {
            return false
        }
        
        guard let _ =  banks.first (where: { $0.code == number }) else { return false }
            
        return true
    }
    
    func getName(bankCode: Int) -> String? {
        if !validateBank(number: bankCode) { return nil }
        guard let bank = banks.first(where: { $0.code == bankCode}) else { return nil }
        
        return bank.name
        
    }
}
