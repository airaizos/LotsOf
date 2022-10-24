//
//  StringExtension.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 22/9/22.
//

import Foundation

extension String {
    var separateBusLineName:String {
        var lineName: String  {
            guard let separator = self.lastIndex(of: "/") else { return "/"}
            let short = String(self[separator...].dropFirst())
            return short
            
        }
        return lineName
    }
    
    var textAfterDashSeparator:String {
        var text: String  {
            guard let separator = self.lastIndex(of: "/") else { return "/"}
            let short = String(self[separator...].dropFirst())
            return short
            
        }
        return text
    }
    
    var textBeforeDashSeparator:String {
        var text: String  {
            guard let separator = self.lastIndex(of: "/") else { return "/"}
            let short = String(self[...separator].dropLast())
            return short
            
        }
        return text
    }
    
    func localized() -> String {
        return NSLocalizedString(
            self,
            tableName: "Localizable",
            bundle: .main,
            value: self,
            comment: self)
    }
    
}
