//
//  IBAN.swift
//  LotsOfUrlSessionsTests
//
//  Created by Adrian Iraizos Mendoza on 29/11/22.
//ES 98 2038 5778 98 3000760236

import Foundation

struct IBAN {
    
    var country: String
    var bank: String
    var office: String
    var account: String
    
    var dc: String? /*{
                     
                     
                     return ""
                     }
                     */
    var ibanDC: String?
    
    var isValid: Bool {
        if country != "ES" { return false }
        if bank.count != 4 && Int(bank)! < 0 && Int(bank)! > 9999 { return false }
        if office.count != 4 && Int(office)! < 0 && Int(office)! > 9999 { return false }
        
        if account.count != 10 && Int(account) == nil {
            return false
        }
        return true
    }
    
    //Calc
    func controlDigitCalculation() -> String? {
        if !isValid { return nil }
        var sumLeftCD = 0
        var sumRightCD = 0
        let bankDigits = bank.compactMap( { Int(String($0)) })
        let officeDigits = office.compactMap({ Int(String($0))} )
        let accountDigits = account.compactMap( { Int(String($0))})
        
        
        //Left Control Digit Calculation
        for (index,digit) in bankDigits.enumerated() {
            //4 8 5 10
            switch index {
            case 0: sumLeftCD += digit * 4
            case 1: sumLeftCD += digit * 8
            case 2: sumLeftCD += digit * 5
            case 3: sumLeftCD += digit * 10
            default:
                break
            }
            //9736
        }
        for (index, digit) in officeDigits.enumerated() {
            switch index {
            case 0: sumLeftCD += digit * 9
            case 1: sumLeftCD += digit * 7
            case 2: sumLeftCD += digit * 3
            case 3: sumLeftCD += digit * 6
                
            default:
                break
            }
        }
        
        var leftControlDigit: Int {
            var resto = sumLeftCD % 11
            if resto != 0 {
               resto = 11 - resto
            }
            return resto
        }
     
        //Right Control Digit Calculation
        //1,2,4,8,5,10,9,7,3,6
        for (index,digit) in accountDigits.enumerated() {
            switch index {
            case 0: sumRightCD += digit * 1
            case 1: sumRightCD += digit * 2
            case 2: sumRightCD += digit * 4
            case 3: sumRightCD += digit * 8
            case 4: sumRightCD += digit * 5
            case 5: sumRightCD += digit * 10
            case 6: sumRightCD += digit * 9
            case 7: sumRightCD += digit * 7
            case 8: sumRightCD += digit * 3
            case 9: sumRightCD += digit * 6
            default:
                break
            }
        }

        var rightControlDigit:Int {
            var resto = sumRightCD % 11
            if resto != 0 {
               resto = 11 - resto
            }
            return resto
        }
        
        return "\(leftControlDigit)\(rightControlDigit)"
        }
        
    func ibanControlDigitCalculation() {
        //"99_998_888_807_777_777_142_800" % 97
    
        //Int demasiadoGrande
        
    }
    
    var number: String {
        return "\(country)\(ibanDC!)-\(bank)-\(office)-\(dc!)-\(account)"
    }
    
    var electronic: String {
        return "\(country)\(ibanDC!)\(bank)\(office)\(dc!)\(account)"
    }
    
    var printable: String {
        var text = "\(country)\(ibanDC!)\(bank)\(office)\(dc!)\(account)"
        let space: Character = " "
        let i = [text.index(text.startIndex, offsetBy: 4), text.index(text.startIndex, offsetBy: 9),text.index(text.startIndex, offsetBy: 14),text.index(text.startIndex, offsetBy: 19),text.index(text.startIndex, offsetBy: 24)]
        text.insert(space,at: i[0])
        text.insert(space,at: i[1])
        text.insert(space,at: i[2])
        text.insert(space,at: i[3])
        text.insert(space,at: i[4])
        return text
    }
}
